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

    // printf("\n == EXPERIMENT 2 - Class Runstat ======\n");
    // pStat obj = Runstat_new();
    // Runstat_add(obj, 10.0);
    // Runstat_add(obj, 4.0);
    // Runstat_add(obj, 25.0);
    // Runstat_add(obj, 16.0);

    // printf(" Number of Elements processed = %zu \n", Runstat_size(obj));
    // printf(" Mean = %.5f \n", Runstat_mean(obj));
    // printf(" Sdev = %.5f \n", Runstat_sdev(obj));

    // Runstat_add(obj, -50.0);
    // Runstat_add(obj, 80.0);
    // printf(" Mean = %.5f \n", Runstat_mean(obj));
    // printf(" Sdev = %.5f \n", Runstat_sdev(obj));
    // // Delete C++ Object
    // Runstat_del(obj);

}
