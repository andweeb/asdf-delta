<div align="center">

# asdf-delta ![Build](https://github.com/andweeb/asdf-delta/workflows/Build/badge.svg) ![Lint](https://github.com/andweeb/asdf-delta/workflows/Lint/badge.svg)

[delta](https://github.com/dandavison/delta) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

## Dependencies

Generic POSIX utilities `bash`, `curl`, `tar`

## Install

```shell
# Add the plugin
$ asdf plugin add delta https://github.com/andweeb/asdf-delta.git

# Manage and use delta
$ asdf list-all delta       # Show all installable versions
$ asdf install delta latest # Install specific version
$ asdf global delta latest  # Set a version globally (on your ~/.tool-versions file)
$ delta                     # Now delta is available
Usage: delta minus_file plus_file
```

See [asdf](https://github.com/asdf-vm/asdf) for more instructions on how to
install & manage versions.

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).
