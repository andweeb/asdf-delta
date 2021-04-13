# Contributing

Testing Locally:

```shell
# Plugin test usage
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# Test asdf-delta plugin
asdf plugin test delta https://github.com/andweeb/asdf-delta.git "delta --help"
```

Tests are automatically run in GitHub Actions on push and PR.
