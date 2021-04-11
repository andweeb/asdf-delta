<div align="center">

# asdf-delta ![Build](https://github.com/andweeb/asdf-delta/workflows/Build/badge.svg) ![Lint](https://github.com/andweeb/asdf-delta/workflows/Lint/badge.svg)

[delta](https://github.com/dandavison/delta) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add delta
# or
asdf plugin add delta https://github.com/andweeb/asdf-delta.git
```

delta:

```shell
# Show all installable versions
asdf list-all delta

# Install specific version
asdf install delta latest

# Set a version globally (on your ~/.tool-versions file)
asdf global delta latest

# Now delta commands are available
delta --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/andweeb/asdf-delta/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Andrew Kwon](https://github.com/andweeb/)
