# Session 2

Tour guide to the Linux System.

## Filesystems

### What is a filesystem?

filesystems are simply different ways of organizing and storing
files on a hard drive, flash drive, or any other storage device.

### Types of filesystem

- **FAT32**: support individual files up to 4GB, and vollumes up to 2TB, doesnt suppor file permission,
  file system corruption can happen much more easily

- **NTFS**:the modern file system Windows likes to use by default, supports file permissions for security,
  a change journal that can help quickly recover errors if your computer crashes, shadow copies for backups,
  encryption, disk quota limits, hard links, No realistic file size or partition size limits.

- **Ext4**: a standard root/tree file system, with a boot sector, partition table, and like the Unix File System,
  uses inodes (index nodes) to describe files and objects

- file-system in linux is divided to **Meta-data** and **data**. 

- **Meta-data** is stored in **inode** and **dentry**. **Inode** has a unique number for each file. **Inode** contains information about the file size, owner, permissions, dat of creation and pointers to data blocks. 

- **Dentry** contains the file name and file path.

## Managing Directories and Files

**file Extensions**: Linux doesn't use file extensions but file's type is part of the file name. use file command to find file type. files are divided to

1. **Regular files(-)** like readable file(.txt,.cpp), binary file(.exe), image file(.png, .jpg), archive file (.zip, .rar, .doc, .pdf).

2. **Directory(d)** a folder containing other files or folders

3. **Special**: Block file(b): hardware files (Like some files under /dev/), symbilic link(l) File pointing to another file (shortcut).

## Relative and absolute paths

**absolute Path**:The total path leading to the directory.

**relative Path**: The path relative to the working directory.



## Creating Directories

```bash
mkdir dirname
```

## Creating Files

```bash
touch file1.txt
> file2.txt
```

## Renaming and Moving Files

```bash
mv old-filename new-filename #(renaming)

mv source-file /new/path #(moving)

mv old-directory new-directory #(renaming)

mv old-filename /new/path/new-filename #(moving and renaming)
```

## Copying Files and directories

```bash
cp file file_clone #(coping file)

cp -r dir new-dir #(coping directories)
```

## Deleting Files and Directories

```bash
rm filename #(removing file)

rm -f filename #(removing write-protected file)

rm -d dirname #(removing empty directory)

rm -r dirname #(removing non-empty directory)

rm -rf dirname #(removing non-empty write-protected directory)

```

## Locating Files in kali

- find
- locate
- which
  all these utilites have the same functionality, \*but\*\* work and return date differently from one another

1. locate
   reads a list of files from a database and print out any matches found

the datebase is updated thought `updatedb` command

```bash
  meska@root locate sbd.exe
```

2. which

```bash
meska@root which sbd
          /usr/bin/bsd #output
```

3. find
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

## Man Pages

Man pages are references manuals which covers Linux commands, A typical man page shows the structure of a command, describes what the command does as well as any available options and flags for the command.

```bash
man command
```

## searching for a Command

```bash
man -k hey
```

It will search the short manual page descriptions for "hey" keyword and display any matches.

## CLI Text Editors (Nano)

Nano is a simple, modeless command-line text editor.

$sudo apt-get update

$sudo apt install nano

## useful commands

### cat

commonly known usages is to print the content of a file onto the standard output stream, also allows us to write some texts into a file.

```bash
cat file #(print the content of file onto the standard output stream)

cat > file #(creating new file and typing in it)

cat #(listing to standered output)**
```

### grep

to search in files

$grep string-to-match file

## Links

### Hard links

- Hard links are appliable for files only not directories (there was a security hole with directories). 

``` bash
ln  target-file link-file #(create link-file as a hard link to target-file)
ls -i #(list inode of files in current location)
```
- hard link creates a new dentry with new name and path but it point to same inode and same data blocks

- Copying file creates new files with new dentry, inode and data blocks

- Renaming a file changes the name in dentry

- Moving a file changes name and path in dentry (if they are in same partition)



### Symbolic links

symbolic are like new file that has a mode of link, and its data block will contain the file that is wanted to create a link to it.

``` bash
ln -s  target-file link-file #(create link-file as a hard link to target-file)
ls -l #(look at the symbolic link and note that the file type is 'l' )
```
## task

get the flags from level 1 to level 8

https://overthewire.org/wargames/bandit/bandit0.html
