# Code Snippets for Bash & CLI Tools
## ImageMagick
### Convert file
```
magick input.webp output.jpg
```

### Convert all files in directory
```
magick mogrify -format png *.webp
```

### Covert all files in a directory and place in folder
```
mkdir output_dir
magick mogrify -format png -path output_dir *.webp
```
