# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Building and Running
- **Build and run**: Open Algorithms.xcodeproj in Xcode and use ⌘+R, or use `swift run` from the Algorithms/ directory
- **Quick testing**: Use the Playground.swift protocol for testing implementations
- **Main entry point**: main.swift contains the current execution example

### Development Commands
- **Swift compilation**: `swiftc` for individual files
- **Project build**: Use Xcode build system (⌘+B) or `swift build`

## Architecture Overview

This is an educational algorithms and data structures repository implemented in Swift with a modular architecture:

### Core Structure
- **Algorithms/**: Main implementation directory containing all Swift code
- **Theory/**: Markdown documentation with theoretical explanations and supporting images
- **Xcode Project**: Standard iOS/macOS command-line tool project structure

### Implementation Patterns
- **Playground Protocol**: Each data structure/algorithm category implements a `Playground` protocol with `executeOperations()` for testing
- **Modular Design**: Related algorithms grouped in directories (Sorts/, Trees/, Lists/, etc.)
- **Extension Pattern**: Complex implementations split across multiple files using Swift extensions (e.g., `LinkedList+Insert.swift`, `LinkedList+Delete.swift`)
- **Generic Programming**: Most data structures use Swift generics for type safety and reusability

### Key Architectural Decisions
- **Educational Focus**: Code prioritizes readability and learning over performance optimization
- **Separation of Concerns**: Core implementations separate from playground/testing code
- **Documentation Integration**: Theory files in markdown complement Swift implementations
- **File Naming**: Descriptive names matching algorithm/data structure names (e.g., `QuickSort.swift`, `AVLTree.swift`)

### Testing Approach
- Uses protocol-based playground pattern rather than formal unit tests
- Main execution examples in main.swift
- Individual playground files for each major component
- Testing code separated into dedicated playground files or extensions

### Code Organization
- **By Algorithm Type**: Sorting algorithms in Sorts/, tree structures in Trees/, etc.
- **By Functionality**: Complex structures split into logical extensions (Insert, Delete, Archive, etc.)
- **Theoretical Documentation**: Corresponding .md files in Theory/ directory for major concepts