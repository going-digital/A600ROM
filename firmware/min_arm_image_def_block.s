.section .picobin_block, "a"
.word 0xffffded3 // PICOBIN_BLOCK_MARKER_START
.byte 0x42 // PICOBIN_BLOCK_ITEM_1BS_IMAGE_TYPE
.byte 0x1 // Item is 1 word
// Try Before You Buy - 0 (not set)
// Chip - b001 (RP2350)
// reserved - 0b0
// CPU - 0b000 (ARM)
// reserved - 0b00
// EXE security - 0b10 (Secure mode)
// Image Type - 0b0001 (Exe)
.hword 0b0_001_0_000_00_10_0001

// Item 1 Last
.byte 0xff
.hword 0x0001 // Item is 1 word
.byte 0 // Pad

// Relative pointer to next block in loop
// 0 means a link to itself, meaning there is no other block
.word 0

.word 0xab123579 // PICOBIN_BLOCK_MARKER_END

