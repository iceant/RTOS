#ifndef INCLUDED_SDK_BIT_H
#define INCLUDED_SDK_BIT_H

////////////////////////////////////////////////////////////////////////////////
////
typedef struct sdk_bit_s sdk_bit_t;

////////////////////////////////////////////////////////////////////////////////
////


sdk_bit_t*  sdk_bit_new(int length);
void sdk_bit_free(sdk_bit_t** set);

int sdk_bit_length(sdk_bit_t* set);
int sdk_bit_count (sdk_bit_t* set);
int sdk_bit_get(sdk_bit_t* set, int n);
int sdk_bit_put(sdk_bit_t* set, int n, int bit);
void sdk_bit_clear(sdk_bit_t* set, int lo, int hi);
void sdk_bit_set  (sdk_bit_t* set, int lo, int hi);
void sdk_bit_not  (sdk_bit_t* set, int lo, int hi);
int sdk_bit_lt (sdk_bit_t* s, sdk_bit_t* t);
int sdk_bit_eq (sdk_bit_t* s, sdk_bit_t* t);
int sdk_bit_leq(sdk_bit_t* s, sdk_bit_t* t);
void sdk_bit_map(sdk_bit_t* set,
                    void apply(int n, int bit, void *cl), void *cl);
sdk_bit_t* sdk_bit_union(sdk_bit_t* s, sdk_bit_t* t);
sdk_bit_t* sdk_bit_inter(sdk_bit_t* s, sdk_bit_t* t);
sdk_bit_t* sdk_bit_minus(sdk_bit_t* s, sdk_bit_t* t);
sdk_bit_t* sdk_bit_diff (sdk_bit_t* s, sdk_bit_t* t);

#endif /*INCLUDED_SDK_BIT_H*/
