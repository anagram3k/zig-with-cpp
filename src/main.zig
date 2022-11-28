const std = @import("std");
const c = @cImport({
    @cInclude("codecpp.h");
});

const print = std.debug.print;

pub fn main() void {
    print("\n == EXPERIMENT 1 - std::string C-wrapper ======\n", .{});
    var str: c.hString = c.string_new1("A C++ string in C");
    c.string_disp(str, "str");
    var str2: c.hString = c.string_copy(str);
    c.string_add(str, " - hello world");
    c.string_disp(str, "str");
    c.string_disp(str2, "str2");
    c.string_del(str);
    c.string_del(str2);

    print("\n == EXPERIMENT 2 - Class Runstat ======\n", .{});
    var obj: c.pStat = c.Runstat_new();
    c.Runstat_add(obj, 10.0);
    c.Runstat_add(obj, 4.0);
    c.Runstat_add(obj, 25.0);
    c.Runstat_add(obj, 16.0);

    _ = std.c.printf(" Number of Elements processed = %zu \n", c.Runstat_size(obj));
    print(" Number of Elements processed = {d} \n", .{c.Runstat_size(obj)});
    print(" Mean = {e} \n", .{c.Runstat_mean(obj)});
    print(" Sdev = {d:.5} \n", .{c.Runstat_sdev(obj)});

    c.Runstat_add(obj, -50.0);
    c.Runstat_add(obj, 80.0);
    print(" Mean = {d:.5} \n", .{c.Runstat_mean(obj)});
    print(" Sdev = {d:.5} \n", .{c.Runstat_sdev(obj)});
    // Delete C++ Object
    c.Runstat_del(obj);

}
