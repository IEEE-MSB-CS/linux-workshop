# Session 1

An introduction and a brief history to Linux.

## Operating Systems

most important software that runs on a computer, it manges computer's memory, processes and all of the software and hardware on the computer. 

## OS Layers

- Hardware: This layer interacts with the system hardware and coordinates with all the peripheral devices, it the lowest layer in the layered operating system architecture.

- The Kernel: The central component of OS, managing the system's resources, provides an interface between the user and the hardware components.

- The Shell: An interface to kernel, hiding complexity of kernel’s functions from users, takes commands from the user and executes kernel’s functions.

- GUI: allow the user to interact with the system by using a graphical interface


## Open Source and Linux History

1- (1969) Ken Thompson found himself creating and playing computer games on the company’s expensive, decided to port this games 

2- (1980) many versions of unix was released and almost all of software was restricted. 

3- (1983) The project to develop the GNU system is called the  “GNU Project.” 

4- (1990) either found or written all the major components except one—the kernel

5- (1991) Then Linux, a Unix-like kernel, was developed by Linus Torvalds

6-  Combining Linux with the almost-complete GNU system resulted in a complete operating system: the GNU/Linux system


## Linux Distribution Families

Since Linux and GNU are both open source, many people from different communities have made different Linux Distributions.
There are too many distributions to count, so we’ll talk about the three main families:

1. Red Hat Family
   This family concentrated on the enterprise side of things, such as servers and company workstations.
2. Debian Family
   The Debian family started with the home user in mind, the community wanted to make GNU/Linux available for the average user as much as it was for enterprises at the time.
3. Other distributions built for specific use cases\*\*
   Distributions such as Arch Linux, openSUSE, SLES, Gentoo, and many others were made for specific use cases or optimisations based on what the community wanted.

## What is special about Linux?

1. Open Source Nature
   Linux is completely an open source project. You can have a look at the source code of a Linux OS.

2. Secure
   The process of package management, the concept of repositories, and a couple more features makes it possible for Linux to be more secure than Windows.

3. Customisability
   The operating system is very modular and customisable, which allows you to create your own customised system according to your needs.

4. Software Updates
   Linux notice more effective and faster updates to fix the problems you might be facing due to lareg community Support.

5. Good Development Environment
   Due to features like package managers, the command line, the operating system being very low on resource usage, customisability, and many more, GNU/Linux is a great development environment.

6. Privacy
   Linux distributions do not collect much data (or none). Moreover, you will not be needing additional tools to protect your privacy.

7. Hardware
   Linux systems are known for consuming fewer system resources (RAM, disk space, etc.)


### terminal

enviroment where commands could be written
open terminal by Ctrl+Alt+T, Ctrl+Alt+N


### shell

command line interpreter, translates the command written by user
types of shell: sh, bash, csh, ksh, z


### command line

an are to the right of command prompt where commandsare entered

### The command line prompt syntax:

```bash
sphinky@ubuntu:~$
```

**sphinky:** The username of the current logged in user.

**@:** Defines that you are connected to the machine that has the name after it

**ubuntu:** The name of the computer running (Name of the host)

**:~** refers to the directoy that the terminal is working in right now (home directory right now).

**$:** States that you are logged in as a regular user.

## Linux Filesystem Hierarchy

- The root **‘/’** directory: top-level directory of the filesystem, contains all files required to boot system, contains all exeutables and libaries required to boot remaining filesystem

- The tmp **‘/tmp’** directory: contains temporary files created by system and users

- The home **‘/home’** directory: store files of users

- The usr **‘/usr’** directory: contains binaries, libraries and source code for programs of user space

- /usr/bin contains binary files for user programs.

- /usr/sbin contains binary files for system administrators.

- /usr/lib contains libraries for /usr/bin and /usr/sbin.

- /usr/local contains users programs that installed from source.

- The etc **‘/etc’** directory: contain core system files like startup and shutdown shell scripts

- The var **‘/var’** directory: Content of the files that are expected to grow can be found under this directory.

- The sbin **‘/sbin’** directory: contains binary executable and linux commands

## Navigating through the filesystem

**(~)** symbol stands for your home directory

**cd** (change directory)

**pwd** (print working dircetory)

**ls** (list)

The **‘.’** link refers to the directory itself.

The **‘..’** link refers to the directory before it (parent directory)

## Task
Installation of Kali linux on virtual machine

download VMware : https://customerconnect.vmware.com/en/downloads/details?downloadGroup=WKST-PLAYER-1621&productId=1039&rPId=77292

download kali iso for virtual machine : https://www.kali.org/get-kali/#kali-virtual-machines
