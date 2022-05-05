# Kitty
## Running and viewing commands in separate windows
### Open new split and run command
```
kitty @ launch --cwd=current frotz 24.z5
```

### Open new split. Send command to split.
```
kitty @ launch --cwd=current --title=frotz --keep-focus
kitty @ send-text --match title:frotz frotz 24.z5 \\x0d
```
