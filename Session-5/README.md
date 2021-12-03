# Session 5

contents
core concepts:
Bash Enviroment
core bash configuration files
bash enviroment variables
what makes a file a bash script?
exit codes and return status
pipes and redirects
Signals
Foreground and background
scriptings:
Execute permissions and PATH
THe runtime enviroment
comments
static variables
Dynamic variables
I/O Handling
Conditionals
Flow Control
Declaring functions
Array
Parsing runtime arguments
Value tesing
Functions
code blocks
special structrues (&&, ||, {}, etc);
how to math
Handling errors within a script
Advanced I/O (IPC, signals, interactive user inut, redirection, file handles)
Advanced find
External Dependecies (sourcing external filem libraries, etc)
Date and time(timezones, formatiing, adding stamps to file)
metadata
Directory and file attributes
Automation of common system adminstration
using in conjunction with CRON, things to be aware of

# Brief History

- The Shell (Command line interpreter)
  Back in 1971, the first unix shell V6 shell was written by Ken Thompson from Bell labs,
  this shell (simply the /bin/sh) was a user program that executed from outside of the kernel
  it give you a way to interactive with the file system

Many of the things we have come to expect from Bash, were added after the inital shell's development

in 1977, the Bourne shell was introduced having been created by Stephen Bounse while at Bell Labs for V7 Unix
The Bournse shell iteself was written with one of the main goals begin to support interactive execution of commands for the OS, thuse scripting was born
the Bourne Shell introduced more advanced concepts into the shell and scripting capabilites such as control structures (if, while, case, etc..) as well as singlal handling and command subsitituon

these shells gave birth to a large number of shells we have all heard of Korn, Almquish, Cshell and eventually
The Bournse Again Shell (Bash)

Bash
open source GNU project that was intended to completly replace the Bournse shell, it was developed by Brian Fox and has become standard shell for almost all linux distribution over time

Bash does full backward compatability with the previouse Bournse shell and also to the other shell.

Bash provides the ability to define functions, include regular expression and associative arrays

## Bash Files

.bash_profile and .bashrc
the main difference is
.bash_profile is gonna be exuecuted once you log in to the OS to do some configuration before get the inital command prompt

and for .bashrc it works after you already logged in
we'll see why these two are there, and how they are communicating together

```bash
ls -lah

meska# ls -la | grep '.bash*'
-rw-rw-r--  1 yousef yousef        18 نوف 21 03:36 .bash_aliases
-rw-------  1 yousef yousef     10707 نوف  6 07:29 .bash_history
-rw-r--r--  1 yousef yousef       220 يون 16 12:04 .bash_logout
-rw-rw-r--  1 yousef yousef        95 يول  6 17:58 .bash_profile
-rw-r--r--  1 yousef yousef      4260 نوف 25 06:31 .bashrc
-rw-rw-r--  1 yousef yousef     78656 يول  6 17:54 .git-completion.bash
meska#

nano .bash_profile
```

task
do alias for lZ
which is ls -laZ | more

.bashrc it gets executed simply before command prompt comes up, or its run when you start bash instance when you type bash in the shell.

```bash
nano ~./bashrc
```

you will notice that .bashrc will not going to run, unless .bash_profile runs it at first

let's say we export NEWVAL in .bashrc
when we save and try to grep that newVAL
we will see nothing

```bash
env | grep NEWVAL
```

because remember .bashrc runs?
so wwithout loggin out and in we can do

```bash
bash
```

and bash will create new shell instance that runs ../bashrc
but if we exit from that shell, it will return to as before
so we returns to the previous shell

```bash
exit
```

the changes are active just for bash shell instances
unless you logout

as you see, both .bash_profile and .bashrc tends to call eachother

## Bash history

.bash_histroy
contains what you type as the current user
by default the histroy configurations is in enviroment variable and we can determine a number of different things

```bash
env | grep HISTCONTROL
```

if not found

ignoring duplicates and space

```bash
export HISTCONTROL=$HISTCONTROL:ignorespace
```

what does ignore space do?
If I as a regular user don't want any sudo user to see my command histroy
so I put spave before writing the command, it not be captured on the bash history

search more about HISTCONTROL.

## Bash logout

.bash_logout
the last the thing that happends you issue the exit or logout command

this gives you the ability to execute something when you logout of the terminal session

## What makes a file a shell script

is it .sh?

```bash
vim test.sh
```

inside test.sh

```bash
echo "welcome"
```

then

```bash
chmod u+x test.sh
```

Do you think it will work?

```bash
test.sh
```

of course it will, but this is not a typicall shell script
the reason why it isn't
because the typicall shell script is defined by the fact it start a particular shell and execute commands inside that shell, so it's completely independant of the user shell.
think of it as sandbox.
so we need the #!
inside test.sh

```bash
#!/bash/bin
echo "Welcome"
```

.sh is for visually easily know this is shell script.

# Displaying Enviroment Variables

enviroment variables are designated by $CAPITAL_CASE_CONVENTION

```bash
#!/bin/bash

clear

echo "This script will giv us enviroment information"
echo "======================="
echo ""
echo "Hello Username: $USER"
echo
echo "Your home directory is: $LOGIN"
```

# Task1: Extract Subdomains

```bash
wget cisco.com
cat index.html | grep 'href=' index.html | cut -d '/' -f 3 | grep '\.' | cut -d '"' -f 1 | sort -u
```

if we have to do this operation over and over?
so bash comes into play
extractSubDomains.sh

```bash

```

## Task 2: LogForensic

Log files are used for tracking the behaviour of application (All kind of behaviour)
so dealing with log files is an essential skill,

what is the difference between uniq and sort -u?

```bash
cat access.log.1 | grep "127.0.1" | cut -d '"' -f 2 | sort | uniq -c | sort -n
```

## Task3: LiveHosts

how to know the live machines on your network?

```bash
ping -c 1 127.0.0.1 | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1
```

pingSweep.sh

```bash
for i in {1..254}; do ping -c 192.168.1.$i | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 done;
```

## Essential Tools:

1-nc (our swiss army knife :D)
2-ncat
3-wireshark
4-tcpdump
