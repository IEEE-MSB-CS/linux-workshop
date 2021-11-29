# Session 2


# The Command Line & The Linux Filesystem Hierarchy

# Filesystems

## What is a filesystem?
filesystems are simply different ways of organizing and storing 
files on a hard drive, flash drive, or any other storage device.

*types of filesystem

FAT32: support individual files up to 4GB, and vollumes up to 2TB, doesnt suppor file permission,
file system corruption can happen much more easily

NTFS:the modern file system Windows likes to use by default, supports file permissions for security, 
a change journal that can help quickly recover errors if your computer crashes, shadow copies for backups,
encryption, disk quota limits, hard links, No realistic file size or partition size limits.

Ext4: a standard root/tree file system, with a boot sector, partition table, and like the Unix File System, 
uses inodes (index nodes) to describe files and objects




# Linux Filesystem Hierarchy

-The root ‘/’ directory: top-level directory of the filesystem, contains all files required to boot system, contains all
-exeutables and libaries required to boot remaining filesystem
-The tmp ‘/tmp’ directory: contains temporary files created by system and users
-The home ‘/home’ directory: store files of users
-The usr ‘/usr’ directory: contains binaries, libraries and source code for programs of user space
-/usr/bin contains binary files for user programs. 
-/usr/sbin contains binary files for system administrators. 
-/usr/lib contains libraries for /usr/bin and /usr/sbin. 
-/usr/local contains users programs that installed from source.
-The etc ‘/etc’ directory: contain core system files like startup and shutdown shell scripts
-The var ‘/var’ directory: Content of the files that are expected to grow can be found under this directory.
-The sbin ‘/sbin’ directory: contains binary executable and linux commands


# Navigating through the filesystem

(~) symbol stands for your home directory
cd (change directory)
pwd (print working dircetory)
ls (list)
The ‘.’ link refers to the directory itself.
The ‘..’ link refers to the directory before it (parent directory)


# Relative and absolute paths
absolute Path:The total path leading to the directory.
relative Path: The path relative to the working directory.


#Managing Directories and Files
file Extensions
creating Directories
creating Files
renaming and Moving Files
copying Files
deleting Files and Directories

#Man Pages
what are Man pages?
searching for a Command

CLI Text Editors (Nano)
cat, grep
Using g++ to compile C++ files

#task
