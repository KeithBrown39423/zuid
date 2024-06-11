const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const zuid_mod = b.addModule("zuid", .{
        .root_source_file = b.path("src/zuid.zig"),
    });

    const test_step = b.step("test", "Run tests for v1, v3, v4, v5, v6, v7, and v8 UUIDs.");
    const tests = b.addTest(.{
        .root_source_file = b.path("src/testing.zig"),
        .target = target,
        .optimize = optimize,
    });

    tests.root_module.addImport("zuid", zuid_mod);
    const run_tests = b.addRunArtifact(tests);
    test_step.dependOn(&run_tests.step);
}
