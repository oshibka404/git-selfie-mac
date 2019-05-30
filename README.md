# Git Selfie Mac

## Requirements:

- OS X
- Git 2.9+
- ffmpeg

## Prerequisites

Install ffmpeg with [Homebrew](https://brew.sh/).

```bash
brew install ffmpeg
```

If you don't have Homebrew, follow the [official instructions](https://ffmpeg.org/download.html#build-mac) of FFMPEG.

Check your git version:

```bash
git --version
```

In case you don't have git or your version is outdated, either use `brew install git` or [download](https://git-scm.com/downloads) the latest version from the official site.

## Setup

Check if you already have any global git hooks:

```bash
git config --global core.hooksPath
```

If output is not empty, run

```bash
ls $(git config --global core.hooksPath)
```

and check if there is already a file `post-commit`. Then follow corresponding guide below.

### Setting up git-selfie as your first post-commit hook

If you already have git hooks folder configured, skip this step. otherwise, run it:

```bash
# Create and set git hooks folder
mkdir ~/.git_hooks
git config --global core.hooksPath ~/.git_hooks
```

Then clone the repository anywhere you want and copy the files.

```bash
git clone git@github.com:oshibka404/git-selfie-mac.git
cp git-selfie-mac/hook/* $(git config --global core.hooksPath)
```

### Adding git-selfie to your existing post-commit hooks

```bash
git clone git@github.com:oshibka404/git-selfie-mac.git
cp git-selfie-mac/hook/webcam.sh $(git config --global core.hooksPath)
```

then open file `post-commit` with your favorite text editor and add this line there:

```bash
$(git config --global core.hooksPath)/webcam.sh
```

## Finishing setup

Make sure that `webcam.sh` and `post-commit` can be executed:

```bash
chmod u+x ~/.git_hooks/webcam.sh ~/.git_hooks/post-commit
```

## Usage

just `git commit ...` in any repo! and see photos in `~/Pictures/Commits`

### Making a video out of the photos
```bash
ffmpeg -f concat \
  -safe 0 \
  -i <(for f in ~/Pictures/Commits/*.jpg; do echo "file '$f'"; done) \
  -vsync vfr \
  -pix_fmt yuv420p \ 
  output.mp4
 ```

### Making a GIF out of the photos
```bash
ffmpeg -f concat \
  -safe 0 \
  -i <(for f in ~/Pictures/Commits/*.jpg; do echo "file '$f'"; done) \
  -vsync vfr \
  -pix_fmt bgr8 \
  output.gif
```
