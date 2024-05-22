#include <sdk_bit.h>
#include <os_memory.h>
#include <assert.h>

////////////////////////////////////////////////////////////////////////////////
////
typedef uint32_t word_t;

struct sdk_bit_s{
    int length;
    unsigned char   *bytes;
    word_t        *words;
};

////////////////////////////////////////////////////////////////////////////////
////

#define BPW (8*sizeof (word_t))

#define nwords(len) ((((len) + BPW - 1)&(~(BPW-1)))/BPW)

#define nbytes(len) ((((len) + 8 - 1)&(~(8-1)))/8)

#define setop(sequal, snull, tnull, op) \
	if (s == t) { assert(s); return sequal; } \
	else if (s == NULL) { assert(t); return snull; } \
	else if (t == NULL) return tnull; \
	else { \
		int i; sdk_bit_t* set; \
		assert(s->length == t->length); \
		set = sdk_bit_new(s->length); \
		for (i = nwords(s->length); --i >= 0; ) \
			set->words[i] = s->words[i] op t->words[i]; \
		return set; }

////////////////////////////////////////////////////////////////////////////////
////

static unsigned char msbmask[] = {
        0xFF, 0xFE, 0xFC, 0xF8,
        0xF0, 0xE0, 0xC0, 0x80
};
static unsigned char lsbmask[] = {
        0x01, 0x03, 0x07, 0x0F,
        0x1F, 0x3F, 0x7F, 0xFF
};

static sdk_bit_t* copy(sdk_bit_t* t) {
    sdk_bit_t* set;
    assert(t);
    set = sdk_bit_new(t->length);
    if (t->length > 0)
        memcpy(set->bytes, t->bytes, nbytes(t->length));
    return set;
}

////////////////////////////////////////////////////////////////////////////////
////

sdk_bit_t* sdk_bit_new(int length) {
    sdk_bit_t* set;
    assert(length >= 0);
    OS_NEW(set);
    if (length > 0)
        set->words = OS_CALLOC(nwords(length),
                            sizeof (unsigned long));
    else
        set->words = NULL;
    set->bytes = (unsigned char *)set->words;
    set->length = length;
    return set;
}

void sdk_bit_free(sdk_bit_t* *set) {
    assert(set && *set);
    OS_FREE((*set)->words);
    OS_FREE(*set);
}

int sdk_bit_length(sdk_bit_t* set) {
    assert(set);
    return set->length;
}

int sdk_bit_count(sdk_bit_t* set) {
    int length = 0, n;
    static char count[] = {
            0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4 };
    assert(set);
    for (n = nbytes(set->length); --n >= 0; ) {
        unsigned char c = set->bytes[n];
        length += count[c&0xF] + count[c>>4];
    }
    return length;
}

int sdk_bit_get(sdk_bit_t* set, int n) {
    assert(set);
    assert(0 <= n && n < set->length);
    return ((set->bytes[n/8]>>(n%8))&1);
}

int sdk_bit_put(sdk_bit_t* set, int n, int bit) {
    int prev;
    assert(set);
    assert(bit == 0 || bit == 1);
    assert(0 <= n && n < set->length);
    prev = ((set->bytes[n/8]>>(n%8))&1);
    if (bit == 1)
        set->bytes[n/8] |=   1<<(n%8);
    else
        set->bytes[n/8] &= ~(1<<(n%8));
    return prev;
}

void sdk_bit_set(sdk_bit_t* set, int lo, int hi) {
    assert(set);
    assert(0 <= lo && hi < set->length);
    assert(lo <= hi);
    if (lo/8 < hi/8) {
        set->bytes[lo/8] |= msbmask[lo%8];
        {
            int i;
            for (i = lo/8+1; i < hi/8; i++)
                set->bytes[i] = 0xFF;
        }
        set->bytes[hi/8] |= lsbmask[hi%8];
    } else
        set->bytes[lo/8] |= (msbmask[lo%8]&lsbmask[hi%8]);
}

void sdk_bit_clear(sdk_bit_t* set, int lo, int hi) {
    assert(set);
    assert(0 <= lo && hi < set->length);
    assert(lo <= hi);
    if (lo/8 < hi/8) {
        int i;
        set->bytes[lo/8] &= ~msbmask[lo%8];
        for (i = lo/8+1; i < hi/8; i++)
            set->bytes[i] = 0;
        set->bytes[hi/8] &= ~lsbmask[hi%8];
    } else
        set->bytes[lo/8] &= ~(msbmask[lo%8]&lsbmask[hi%8]);
}

void sdk_bit_not(sdk_bit_t* set, int lo, int hi) {
    assert(set);
    assert(0 <= lo && hi < set->length);
    assert(lo <= hi);
    if (lo/8 < hi/8) {
        int i;
        set->bytes[lo/8] ^= msbmask[lo%8];
        for (i = lo/8+1; i < hi/8; i++)
            set->bytes[i] ^= 0xFF;
        set->bytes[hi/8] ^= lsbmask[hi%8];
    } else
        set->bytes[lo/8] ^= (msbmask[lo%8]&lsbmask[hi%8]);
}

void sdk_bit_map(sdk_bit_t* set,
             void apply(int n, int bit, void *cl), void *cl) {
    int n;
    assert(set);
    for (n = 0; n < set->length; n++)
        apply(n, ((set->bytes[n/8]>>(n%8))&1), cl);
}

int sdk_bit_eq(sdk_bit_t* s, sdk_bit_t* t) {
    int i;
    assert(s && t);
    assert(s->length == t->length);
    for (i = nwords(s->length); --i >= 0; )
        if (s->words[i] != t->words[i])
            return 0;
    return 1;
}

int sdk_bit_leq(sdk_bit_t* s, sdk_bit_t* t) {
    int i;
    assert(s && t);
    assert(s->length == t->length);
    for (i = nwords(s->length); --i >= 0; )
        if ((s->words[i]&~t->words[i]) != 0)
            return 0;
    return 1;
}

int sdk_bit_lt(sdk_bit_t* s, sdk_bit_t* t) {
    int i, lt = 0;
    assert(s && t);
    assert(s->length == t->length);
    for (i = nwords(s->length); --i >= 0; )
        if ((s->words[i]&~t->words[i]) != 0)
            return 0;
        else if (s->words[i] != t->words[i])
            lt |= 1;
    return lt;
}

sdk_bit_t* sdk_bit_union(sdk_bit_t* s, sdk_bit_t* t) {
    setop(copy(t), copy(t), copy(s), |)
}

sdk_bit_t* sdk_bit_inter(sdk_bit_t* s, sdk_bit_t* t) {
    setop(copy(t),
          sdk_bit_new(t->length), sdk_bit_new(s->length), &)
}

sdk_bit_t* sdk_bit_minus(sdk_bit_t* s, sdk_bit_t* t) {
    setop(sdk_bit_new(s->length),
          sdk_bit_new(t->length), copy(s), & ~)
}

sdk_bit_t* sdk_bit_diff(sdk_bit_t* s, sdk_bit_t* t) {
    setop(sdk_bit_new(s->length), copy(t), copy(s), ^)
}


