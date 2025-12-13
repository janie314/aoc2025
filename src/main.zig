const std = @import("std");
const aoc2025 = @import("aoc2025");

pub fn main() !void {
    // Set up allocator.
    var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
    defer debug_allocator.deinit();
    const gpa = debug_allocator.allocator();
    var threaded: std.Io.Threaded = .init(gpa);
    defer threaded.deinit();
    // Setup reader
    var buffer: [1024]u8 = undefined;
    const reader = std.Io.File.reader(std.Io.File.stdin(), threaded.io(), &buffer);
    // Read stuff
    while (try reader.takeDelimiterExclusive('\n')) |line| {
        std.debug.print("{}", line);
    }
}
