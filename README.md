<div align="center">
  <br /><br />
  <img src="./zuid-dynamic.svg" alt="Banner" />
  <br /><br />
</div>

----

<h1 align="center">ZUID</h1>
<h3 align="center">A simple UUID library for ZIG</h3>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#examples">Examples</a> •
  <a href="#contributing">Contributing</a>
</p>

This library provides a simple and efficient way to generate and manipulate UUIDs (Universally Unique Identifiers) in Zig.


## Features
- Generate UUIDs of all versions (1, 3, 4, 5)
- Parse UUIDs from strings
- Convert UUIDs to strings, 128-bit integers, and byte-arrays
- Access to parts of UUID (`time_low`, `time_mid`, `node`, etc.)

# Installation
To install this library, add the following to your `build.zig` file:
```zig
pub fn build(b: *std.Build) void {
    // ...
    const zuid_dep = b.dependency("zuid", .{});
    const zuid_mod = zuid_dep.module("zuid");

    exe.root_module.addImport("zuid", zuid_mod);
    // ...
}
```
Also make sure to add the following to your `build.zig.zon` file:
```zig
.dependencies = .{
    .zuid = .{
        .url = "https://github.com/KeithBrown39423/zuid/archive/refs/tags/v1.1.1.tar.gz",
            .hash = "12201b9ead072aa5ce87a1486637a41d7711f35955d37ec2dda358f17fe9c4690752",
    },
},
```

## Examples
Here is a simple example of how to generate a UUID:
```zig
const std = @import("std");
const zuid = @import("zuid");

pub fn main() !void {
    const uuid = zuid.new.v4();

    std.debug.print("UUID: {}\n", .{uuid.toString()});
}
```
If you are creating a v3 or v5 UUID, make sure to include the namespace and data.
```zig
const std = @import("std");
const zuid = @import("zuid");

pub fn main() !void {
    const uuid = zuid.new.v5(zuid.UuidNamespace.URL, "https://example.com");

    std.debug.print("UUID: {}\n", .{uuid.toString()});
}
```
You can also get the UUID as an int through `@bitCast`.
```zig
const std = @import("std");
const zuid = @import("zuid");

pub fn main() !void {
    const uuid = zuid.new.v4();
    std.debug.print("UUID: {s}\n", .{uuid.toString()});
    const uuid_int = @as(u128, @bitCast(uuid));
    std.debug.print("UUID as int: {d}\n", .{uuid_int});
}
```

## Contributing
Contributions are welcome! Please submit a pull request or create an issue to get started.

<p align="right">
<sub>(<b>ZUID</b> is protected by the <a href="https://github.com/keithbrown39423/zuid/blob/main/LICENSE"><i>MIT licence</i></a>)</sub>
</p>
