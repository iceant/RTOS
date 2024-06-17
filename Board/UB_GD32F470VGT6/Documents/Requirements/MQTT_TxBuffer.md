```
  Memory Buffer        Read     
                      Interface
+------------------+ +----+    
|                  | |    |    
|                  | |    |    
|                  +->    |    
|                  | |    |    
|                  | |    |    
|                  | |    |    
+----+-------^-----+ |    |    
     |       |       |    |    
+----v-------+-----+ |    |    
|                  | |    |    
|                  | |    |    
|                  | |    |    
|                  +->    |    
|                  | |    |    
|                  | |    |    
|                  | |    |    
+------------------+ +----+    
                               
   File BackEnd                
```

1. 写入时先写入 `Memory Buffer`；
2. 当 `Memory Buffer` 写满时，往 `File BackEnd` 写入; 此时切换到 `File BackEnd` 模式，后续写入的数据都直接写入 `BackEnd` 中
3. 写入 Backend 策略：
   1. 使用写入Buffer和读取Buffer，双Buffer设计
   2. 前端使用 Write Buffer 进行写入
   3. 当Write Buffer满了的时候写入 Backend
   4. 超过 5 秒（可配置）还没有写满，则切换 Buffer，将当前 Write Buffer 设置为 Read Buffer，并将之前的 Read Buffer 切换为 WriteBuffer，同时将 ReadBuffer 写入 file 中