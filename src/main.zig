const std = @import("std");
const commands = @import("commands/mod.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var it = std.process.args();
    _ = it.next();
    var list = try std.ArrayList([]const u8).initCapacity(allocator, 10);
    defer list.deinit(allocator);
    while (it.next()) |a| try list.append(allocator, a);
    const slice = try list.toOwnedSlice(allocator);
    defer allocator.free(slice);
    commands.dispatch(slice) catch |e| switch (e) {
        error.UnknownGroup => std.debug.print("Unknown group. Try 'nen help'.\n", .{}),
        error.UnknownDbCommand => std.debug.print("Unknown db command.\n", .{}),
        else => return e,
    };
}
