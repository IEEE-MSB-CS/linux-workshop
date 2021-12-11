# Session 1

An introduction and a brief history to Linux.

## Operating Systems

most important software that runs on a computer, manages all of the software and hardware on the computer.

## OS Layers

- Hardware: This layer interacts with the system hardware and coordinates with all the peripheral devices, it the lowest layer in the layered operating system architecture.

- The Kernel: The central component of OS, managing the system's resources, provides an interface between the user and the hardware components.

- The Shell: An interface to kernel, hiding complexity of kernel’s functions from users, takes commands from the user and executes kernel’s functions.

- GUI: allow the user to interact with the system by using a graphical interface

## Boot Process

The boot process consists of many layers executing each other to load the operating system finally.

- BIOS/UEFI: Checks that the system is working properly and then executes the MBR/EFI.

- MBR/GPT: MBR/GPT executes the bootloader

- GRUB: The bootloader then checks the kernel and loads it.

- Kernel: Executes the /sbin/init program.

- init: Executes the runlevel programs

## Open Source and Linux History

(1965) Bell labs create Multics, (1969)Ken Thompson and Dennis Ritchie needed an OS to play space travel on another small machine,
(1969)Unix was developed,(1980)almost all software was proprietary, which means that it had owners who forbid and prevent cooperation by users,
(1983)The GNU project was first announced by Richard Stallman, (1987)MINIX a popular Unix-like operating system popped up, (1991) Linus Torvalds introduced Linux

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

### Installation of Kali linux on virtual machine

### shell

command line interpreter, translates the command written by user
types of shell: sh, bash, csh, ksh, z

### terminal

enviroment where commands could be written
open terminal by Ctrl+Alt+T, Ctrl+Alt+N

### command line

an are to the right of command prompt where commandsare entered

## Task
