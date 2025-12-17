const dma_ch = struct {
    read_addr:u32,
    write_addr:u32,
    trans_count:u32,
    ctrl_trig:u32,
    al1_ctrl:u32,
    al1_read_addr:u32,
    al1_write_addr:u32,
    al1_trans_count_trig:u32,
    al2_ctrl:u32,
    al2_trans_count:u32,
    al2_read_addr:u32,
    al2_write_addr_trig:u32,
    al3_ctrl:u32,
    al3_write_addr:u32,
    al3_trans_count:u32,
    al3_read_addr_trig:u32,
};
const pio_t = struct {
    : u32, // 0x00
};
