// Map real data to the data bus - which is shuffled.
fn map_data_bus(u16 data) u16 {
    var result:u16 = (data >> 7) & 0x0080;
    result |= (data >> 6) & 0x0040;
    result |= (data >> 5) & 0x0024;
    result |= (data >> 4) & 0x0010;
    result |= (data >> 1) & 0x000a;
    result |= data & 0x8001;
    result |= (data << 1) & 0x4000;
    result |= (data << 2) & 0x2000;
    result |= (data << 3) & 0x1000;
    result |= (data << 4) & 0x0400;
    result |= (data << 6) & 0x0a00;
    result |= (data << 7) & 0x0100;
    return result;
}

fn map_image(flash:[]const u16, sram:[]u16) void {
    for (flash, 0..) |data, addr| {
        sram[i] = map_data_bus(data);
    }
}
