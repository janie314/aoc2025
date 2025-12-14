const std = @import("std");
const aoc2025 = @import("aoc2025");

pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;
    if (std.os.argv.len <= 1) {
        std.debug.print("what day??\n", .{});
        std.process.exit(1);
    }
    try stdout.print("{d}\n", .{std.os.argv.len});
    try stdout.flush();
}

fn day1a() !i64 {
    return 0;
}
