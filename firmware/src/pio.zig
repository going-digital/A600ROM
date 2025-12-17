pub const pio_sm_reg = struct {
    clkdiv: u32,
    execctrl: u32,
    shiftctrl: u32,
    addr: u32,
    instr: u32,
    pinctrl: u32,
};

const DMA_BASE = @ptrFromInt(0x50000000);

const pio_sm_t = struct {
    clkdiv: u32,
    execctrl: u32,
    shiftctrl: u32,
    addr: u32,
    instr: u32,
    pinctrl: u32,
};

const pio_rxf_t = struct {
    putget: [4]u32,
};

const pio_irq_int_t = struct {
    inte: u32,
    intf: u32,
    ints: u32,
};

const pio_t = struct {
    ctrl: u32, // 0x00
    fstat: u32, // 0x04
    fdebug: u32, // 0x08
    flevel: u32, // 0x0c
    txf: [4]u32, // 0x10-0x1c
    rxf: [4]u32, // 0x20-0x2c
    irq: u32, // 0x30
    irq_force: u32, // 0x34
    input_sync_bypass: u32, // 0x38
    dbg_padout: u32,
    dbg_padoe: u32,
    dbg_cfginfo: u32,
    instr_mem: [32]u32, // 0x48-0xc4
    sm: [4]pio_sm_t, // 0xc8-0x124
    sm_rxf: [4]pio_rxf_t, // 0x128
    gpiobase: u32,
    intr: u32,
    irq: [2]pio_irq_int_t,
};

const pio0: *pio_t = @ptrFromInt(0x50200000);
const pio1: *pio_t = @ptrFromInt(0x50300000);
const pio2: *pio_t = @ptrFromInt(0x50400000);
