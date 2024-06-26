# Protos Repository

Welcome to the Protos repository! This repository contains Protocol Buffers (.proto) files used for defining service interfaces and message types. These .proto files can be compiled into code for various programming languages using the Protocol Buffers Compiler (`protoc`).

## Installation

Before you can generate code from the .proto files, you need to install the necessary dependencies:

### Node.js and npm

Make sure you have Node.js and npm (Node Package Manager) installed on your system. You can download and install them from the [official Node.js website](https://nodejs.org/).

### Protocol Buffers Compiler (protoc)

You also need to install the Protocol Buffers Compiler (`protoc`). Instructions for installing `protoc` can be found in the [Protocol Buffers documentation](https://developers.google.com/protocol-buffers/docs/downloads).

Once you have installed Node.js, npm, and `protoc`, you're ready to proceed. You can confirm the installations via these comamnds:

```bash
node -v
```

```bash
npm -v
```

```bash
protoc --version
```

## Usage

This repository provides npm scripts to simplify the process of generating code from the .proto files. Here's how you can use them:

### Pre-requisites

- These commands can only be executed using a bash instance, which can be opened using GitBash or in VS Code.

- Run `npm install` once at the project directory level before proceeding.

### 1. Generating code for Amaterasu with npm script `generate:protos:amaterasu`

This script downloads any necessary dependencies via npm before generating code. Make sure you have an active internet connection before running this script.

```bash
npm run generate:protos:amaterasu /path/to/protos
```

Replace `/path/to/protos` with the path to the directory containing your .proto files.

## Example

Here's an example of how you can use the npm scripts to generate code:

```bash
npm run generate:protos:amaterasu testing-folder/dummy.proto
```

This command will generate code from the .proto files located in the `protos` directory.

### 2. Generating code for Rinnegan with npm script `generate:protos:rinnegan`

This script assumes that you have already installed `protoc` on your system.

```bash
npm run generate:protos:rinnegan /path/to/protos
```

Replace `/path/to/protos` with the path to the directory containing your .proto files.

## Example

Here's an example of how you can use the npm scripts to generate code:

```bash
npm run generate:protos:rinnegan testing-folder/dummy.proto
```

This command will generate code from the .proto files located in the `protos` directory.

## License

This repository is licensed under the [Kubair License].
