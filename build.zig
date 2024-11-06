const std = @import("std");

const cflags = &.{"-fno-sanitize=undefined"};

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{
        .name = "zig_with_cpp",
        .root_source_file = b.path("src/main.zig"),
        .target = b.host,
    });

    exe.linkSystemLibrary("c");
    exe.linkSystemLibrary("c++");
    exe.addIncludePath(b.path("cpp-code"));
    exe.addCSourceFile(.{ .file = b.path("cpp-code/codecpp.cpp"), .flags = cflags });

    const run_exe = b.addRunArtifact(exe);

    const run_step = b.step("run", "Run the application");
    run_step.dependOn(&run_exe.step);

    b.installArtifact(exe);
}
