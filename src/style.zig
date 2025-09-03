const std = @import("std");
const builtin = @import("builtin");
pub const Style = struct {
    use_color: bool,
    pub fn detect() Style {
        return .{ .use_color = true }; // Simplified for Zig 0.15.1 compatibility
    }
    fn out(self: Style, code: []const u8, text: []const u8, w: anytype) !void {
        _ = w; // Not used in simplified version
        if (self.use_color) {
            std.debug.print("\x1b[{s}m{s}\x1b[0m", .{ code, text });
        } else {
            std.debug.print("{s}", .{text});
        }
    }
    pub fn banner(self: Style, w: anytype) !void {
        _ = w; // Not used in simplified version
        if (self.use_color) {
            std.debug.print("\x1b[1;38;5;213m┌──────────────────────────────┐\n", .{});
            std.debug.print("│   nen • unified CLI toolkit  │\n", .{});
            std.debug.print("└──────────────────────────────┘\x1b[0m\n", .{});
        } else {
            std.debug.print("nen (unified CLI)\n", .{});
        }
    }
    pub fn accent(self: Style, t: []const u8, w: anytype) !void {
        try self.out("38;5;81", t, w);
    }
    pub fn cmd(self: Style, t: []const u8, w: anytype) !void {
        try self.out("38;5;209", t, w);
    }
    pub fn dim(self: Style, t: []const u8, w: anytype) !void {
        try self.out("2", t, w);
    }
};
