# Session 2

# The Command Line & The Linux Filesystem Hierarchy

# Filesystems

## What is a filesystem?

filesystems are simply different ways of organizing and storing
files on a hard drive, flash drive, or any other storage device.

# Types of filesystem

**FAT32**: support individual files up to 4GB, and vollumes up to 2TB, doesnt suppor file permission,
file system corruption can happen much more easily

**NTFS**:the modern file system Windows likes to use by default, supports file permissions for security,
a change journal that can help quickly recover errors if your computer crashes, shadow copies for backups,
encryption, disk quota limits, hard links, No realistic file size or partition size limits.

**Ext4**: a standard root/tree file system, with a boot sector, partition table, and like the Unix File System,
uses inodes (index nodes) to describe files and objects

# Linux Filesystem Hierarchy

-The root **‘/’** directory: top-level directory of the filesystem, contains all files required to boot system, contains all exeutables and libaries required to boot remaining filesystem

-The tmp **‘/tmp’** directory: contains temporary files created by system and users

-The home **‘/home’** directory: store files of users

-The usr **‘/usr’** directory: contains binaries, libraries and source code for programs of user space

-/usr/bin contains binary files for user programs.

-/usr/sbin contains binary files for system administrators.

-/usr/lib contains libraries for /usr/bin and /usr/sbin.

-/usr/local contains users programs that installed from source.

-The etc **‘/etc’** directory: contain core system files like startup and shutdown shell scripts

-The var **‘/var’** directory: Content of the files that are expected to grow can be found under this directory.

-The sbin **‘/sbin’** directory: contains binary executable and linux commands

# Navigating through the filesystem

**(~)** symbol stands for your home directory

**cd** (change directory)

**pwd** (print working dircetory)

**ls** (list)

The **‘.’** link refers to the directory itself.

The **‘..’** link refers to the directory before it (parent directory)

# Relative and absolute paths

**absolute Path**:The total path leading to the directory.

**relative Path**: The path relative to the working directory.

# Managing Directories and Files

**file Extensions**: Linux doesn't use file extensions but file's type is part of the file name. use file command to find file type. files are divided to

1-**Regular files(-)** like readable file(.txt,.cpp), binary file(.exe), image file(.png, .jpg), archive file (.zip, .rar, .doc, .pdf).

2-**Directory(d)** a folder containing other files or folders

3- **Special**: Block file(b): hardware files (Like some files under /dev/), symbilic link(l) File pointing to another file (shortcut).

# Creating Directories

$mkdir dirname

# Creating Files

$touch file1.txt

$> file2.txt

# Renaming and Moving Files

$mv old-filename new-filename **(renaming)**

$mv source-file /new/path **(moving)**

$mv old-directory new-directory **(renaming)**

$mv old-filename /new/path/new-filename **(moving and renaming)**

# Copying Files and directories

$cp file file_clone **(coping file)**

$cp -r dir new-dir **(coping directories)**

# Deleting Files and Directories

$rm filename **(removing file)**

$rm -f filename **(removing write-protected file)**

$rm -d dirname **(removing empty directory)**

$rm -r dirname **(removing non-empty directory)**

$rm -rf dirname **(removing non-empty write-protected directory)**

# Locating Files in kali

- find
- locate
- which
  all these utilites have the same functionality, \*but\*\* work and return date differently from one another

[1] locate
reads a list of files from a database and print out any matches found

the datebase is updated thought `updatedb` command

```bash
meska@root locate sbd.exe
```

[2] which

```bash
meska@root which sbd
          /usr/bin/bsd #output
```

[3] find

The most powerful used search tool, it is able to search recursively any given path for various files <br>
locating all the files starting with lower case string 'sbd'

```bash
meska@root find / -name sbd*
```

what makes `find` really powerful is

- the list of options it gives you
- additional parameters give you the ability to execute commands on each file found, let's see an example

> find all the files that start with sbd and show the type of files

```bash
meska@root find / -name sbd* | xargs file

```

# Man Pages

Man pages are references manuals which covers Linux commands, A typical man page shows the structure of a command, describes what the command does as well as any available options and flags for the command.

$man command

## searching for a Command

$man -k hey

It will search the short manual page descriptions for "hey" keyword and display any matches.

## CLI Text Editors (Nano)

Nano is a simple, modeless command-line text editor.

$sudo apt-get update

$sudo apt install nano

# useful commands

## cat

commonly known usages is to print the content of a file onto the standard output stream, also allows us to write some texts into a file.

$cat file **(print the content of file onto the standard output stream)**

$cat > file **(creating new file and typing in it)**

$cat **(listing to standered output)**

## grep

to search in files

$grep string-to-match file

# task

```

```
