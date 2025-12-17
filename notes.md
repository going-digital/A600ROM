# Notes

## 16 bit mode

| Function | Socket pin                                      | GPIO      | Notes |
| -------- | ----------------------------------------------- | --------- | ----- |
| D15-D0   | 30,28,26,24,21,19,17,15,29,27,25,23,20,18,16,14 | GPIO15-0  |
| A18-A1   | 2,33-41,3-10                                    | GPIO33-16 |
| nBYTE    | 32                                              | GPIO35    | High  |
| nCS      | 11                                              | GPIO34    |
| nOE      | 13                                              | GPIO36    |

### Convert address

| Image address bit | GPIO   | SRAM bit |
| ----------------- | ------ | -------- |
| 1                 | GPIO33 | 18       |
| 2                 | GPIO32 | 17       |
| 3                 | GPIO31 | 16       |
| 4                 | GPIO30 | 15       |
| 5                 | GPIO29 | 14       |
| 6                 | GPIO28 | 13       |
| 7                 | GPIO27 | 12       |
| 8                 | GPIO26 | 11       |
| 9                 | GPIO24 | 10       |
| 10                | GPIO23 | 9        |
| 11                | GPIO22 | 8        |
| 12                | GPIO21 | 7        |
| 13                | GPIO20 | 6        |
| 14                | GPIO19 | 5        |
| 15                | GPIO18 | 4        |
| 16                | GPIO17 | 3        |
| 17                | GPIO16 | 2        |
| 18                | GPIO25 | 1        |

### Convert data

| Data bit | SRAM bit | Shift |
| -------- | -------- |-|
| 14       | 7        |-7
| 12       | 6        |-6
| 10       | 5        |-5
| 7        | 2        |-5
| 8        | 4        |-4
| 2        | 1        |-1
| 4        | 3        |-1
| 0        | 0        |0
| 15       | 15       |0
| 13       | 14       |1
| 11       | 13       |2
| 9        | 12       |3
| 6        | 10       |4
| 3        | 9        |6
| 5        | 11       |6
| 1        | 8        |7

### CS Output enable
```asm
inactive:
    mov pindirs, null
    mov x, pins
    jmp x--, inactive
active:
    mov pindirs, ~null
    mov x, pins
    jmp !x, active
```

### PIO Address capture
```asm
    in y, 13 [1]
    in pins, 18
    in y, 1
```

### DMA_1 Address forwarder
#### Purpose
Forward addresses from PIO to DMA_2 READ_ADDR register
#### Configuration
|                |                                 |
| -------------- | ------------------------------- |
| Trigger        | PIO_ADDR TX FIFO DREQ           |
| Read from      | PIO_ADDR RX FIFO (alias for TX) |
| Write to       | DMA_2 READADDR (CHx_READ_ADDR)  |
| Transfer size  | 32 bit word                     |
| Transfer count | 1                               |
| Chain to       | DMA_2                           |

### PIO Data fetch
```asm
    out pins, 16
```

### DMA_2 ROM Data fetch
#### Purpose
Read byte from ROM table and write to GPIO
#### Configuration
|                |                                  |
| -------------- | -------------------------------- |
| Trigger        | Chained from DMA_1               |
| Read from      | Address set dynamically by DMA_1 |
| Write to       | GPIO_OUT register                |
| Transfer size  | 16 bit word                      |
| Transfer count | 1                                |

## 8 bit mode

| Function | Socket pin              | GPIO      | Notes |
| -------- | ----------------------- | --------- | ----- |
| D7-D0    | 29,27,25,23,20,18,16,14 | GPIO7-0   |
| A18-A0   | 2,33-41,3-10,30         | GPIO33-15 |
| nBYTE    | 32                      | GPIO35    | Low   |
| nCS      | 11                      | GPIO34    |
| nOE      | 13                      | GPIO36    |

### CS Output enable

As above

### PIO Address capture

```asm
    in y, 13 [2]
    in pins, 19
```
