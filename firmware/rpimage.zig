const pico_sdk = @import("pico-sdk");

const block_marker_start:u32 = 0xffffded3;
const block_marker_end:u32 = 0xab123579;

pub fn generate(data: []u32) !void {
    // 
    var header: Picobin_Block = .{
        .start = 0xffffded3,
        .block_type = 0x11010142,
        .block_size = 0x000001ff,
        .next_ptr = 0,
        .end = 0xab123579,
    };
}
