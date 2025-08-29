# Nen CLI

A unified command-line interface for the Nen ecosystem, providing package management capabilities similar to `pip install` but for Nen libraries.

## Features

- **Package Management**: Install, update, and list Nen libraries
- **Unified Interface**: Single CLI for all Nen ecosystem tools
- **Static Memory**: Built with Zig for zero-allocation performance
- **Cross-Platform**: Works on all platforms supported by Zig

## Installation

### From Source

```bash
git clone https://github.com/Nen-Co/nen-cli.git
cd nen-cli
zig build
```

The binary will be available at `./zig-out/bin/nen`.

### Global Installation

```bash
# After building, copy to a directory in your PATH
sudo cp ./zig-out/bin/nen /usr/local/bin/
```

## Usage

### Basic Commands

```bash
# Show help
nen help

# List available packages
nen install

# Install a package
nen install nen-net

# Install with specific version
nen install nen-io --version v0.1.0

# Update an installed package
nen install update nen-net
```

### Package Management

The CLI supports the following Nen packages:

| Package | Description | Status | Repository |
|---------|-------------|---------|------------|
| `nen-net` | High-performance HTTP/TCP framework | v0.1.0 | [GitHub](https://github.com/Nen-Co/nen-net) |
| `nen-io` | Zero-allocation I/O library | v0.1.0 | [GitHub](https://github.com/Nen-Co/nen-io) |
| `nen-json` | High-performance JSON processing | v0.1.0 | [GitHub](https://github.com/Nen-Co/nen-json) |
| `nenflow` | Workflow processing engine | v0.1.0 | [GitHub](https://github.com/Nen-Co/nenflow) |
| `nencache` | Embedding cache with hybrid strategy | design | [GitHub](https://github.com/Nen-Co/nencache) |
| `nenff` | Function framework for inference | planning | [GitHub](https://github.com/Nen-Co/nenff) |
| `nen-cli` | Unified CLI and runtime | pre-spec | [GitHub](https://github.com/Nen-Co/nen-cli) |

### Installation Process

When you install a package:

1. **Repository Cloning**: The CLI clones the package repository
2. **Local Installation**: Packages are installed to `./nen-packages/<package-name>/`
3. **Build Setup**: A `build.zig` file is created for easy integration
4. **Usage Instructions**: The CLI provides the exact code to add to your project

### Integration with Your Project

After installing a package, you can use it in your Zig project:

```zig
// In your build.zig
const nen_net = b.addModule("nen-net", .{ 
    .root_source_file = b.path("./nen-packages/nen-net/src/lib.zig") 
});

// In your source code
const net = @import("nen-net");
```

## Architecture

### Command Structure

```
nen <group> <command> [args]
```

**Groups:**
- `db`: Database operations (coming soon)
- `install`: Package management
- `cache`: Cache operations (coming soon)
- `flow`: Workflow operations (coming soon)

**Install Commands:**
- `install <package>`: Install a package
- `install list`: List available packages
- `install update <package>`: Update an installed package

### Design Principles

- **Static Memory**: Zero dynamic allocation for predictable performance
- **Inline Functions**: Critical functions marked as `inline` for maximum speed
- **Error Handling**: Comprehensive error handling with clear messages
- **User Experience**: Intuitive commands and helpful output

## Development

### Building

```bash
# Debug build
zig build

# Release build
zig build -Doptimize=ReleaseFast

# Run tests
zig build test
```

### Project Structure

```
nen-cli/
├── src/
│   ├── main.zig          # Main entry point
│   ├── style.zig         # Terminal styling and colors
│   └── commands/
│       └── mod.zig       # Command implementations
├── build.zig             # Build configuration
└── README.md             # This file
```

### Adding New Commands

1. Add the command function in `src/commands/mod.zig`
2. Add command handling in the `dispatch` function
3. Update the help text
4. Test thoroughly

## Future Enhancements

- **Real Git Integration**: Actual repository cloning and management
- **Version Management**: Semantic versioning and dependency resolution
- **Package Registry**: Centralized package discovery and metadata
- **Build Integration**: Automatic build.zig generation and updates
- **Dependency Resolution**: Handle inter-package dependencies
- **Binary Distribution**: Pre-built binaries for popular platforms

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is part of the Nen ecosystem and follows the same licensing terms.

## Support

- **Issues**: [GitHub Issues](https://github.com/Nen-Co/nen-cli/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Nen-Co/nen-cli/discussions)
- **Documentation**: [Nen.Co](https://nen-co.github.io/docs)

---

**Built with ❤️ by the Nen team**
