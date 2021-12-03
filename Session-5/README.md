# Session 5

## Contents

- core concepts:
- Bash Enviroment
- core bash configuration files
- bash enviroment variables
- what makes a file a bash script?
- exit codes and return status
- pipes and redirects
- Signals
- Foreground and background
- scriptings:
  - Execute permissions and PATH
  - THe runtime enviroment
  - comments
  - static variables
  - Dynamic variables
  - I/O Handling
  - Conditionals
  - Flow Control
  - Declaring functions
  - Array
  - Parsing runtime arguments
  - Value tesing
  - Functions
  - code blocks
  - special structrues (&&, ||, {}, etc);
  - how to math
  - Handling errors within a script
  - Advanced I/O (IPC, signals, interactive user inut, redirection, file handles)
  - Advanced find
  - External Dependecies (sourcing external filem libraries, etc)
  - Date and time(timezones, formatiing, adding stamps to file)
  - metadata
  - Directory and file attributes
  - Automation of common system adminstration
  - Using in conjunction with CRON, things to be aware of
- Tasks
  - Extracting Sudomains
  - LogForeniscs
  - Automate Networking Scanning

# Brief History

## What is the Shell?

the shell is the first layer that a user can use to interact with the
operating system.

![]('./img/');

To access the **TTY** Shell, you can press \_\_ctrl+ alt + (f1 -> f6)

you will see something look like this

![]('./img/tty');

the problem with this approach is you have to exit the GUI everytime you need to type a command

that' why we have terminals.

## Different ways to access terminal

- CTRL + ALT + T
- ALT + F2 then type the name of the terminal ("gnome-terminal", "tilix", etc);

* Open it using GUI

When you open the terminal, you will see the following syntax
`USERNAME@HOSTNAME:WORKING_DIRECTORY($/#)`
The Shell (Command line interpreter)
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

## Pros and Cons of using BASH

- **Pros**
- **Process Files**
  - Reading Files.
  - Checking if files exist
  - Checking if files have changed.
- **Automate Tasks**
  - Automating the backing up of data
  - Automating package installations
  - Automating updates
- **Using Linux Commands inside a program**
  - Use Linux commands inside programs
  - Controlling the workflow of your system and commands.

## Cautions

# _CAUTION!_

- Never run a Linux command unless you know what it does.
- Take care if a command has a -f command as an option, it could mean **by force**.
- Never run any of the following commands unless you know what you're doing:
- `rm -rf /` or `rm -rf /*` -> Deletes everything on your system, including Windows and Linux files.
- `:(){:|:&};:` (aka Fork Bomb) -> Keeps executing a function that calls itself until the system crashes.
- `command > /dev/sda` -> Data loss on the specified block.
- `mkfs.ext3 /dev/sda` -> Formats the specified block to ext3, don't do so unless intended.

## Bash Files

We have 5 different type of bash configuration files

- .bashrc and .bash_profile
- .bash_logout and .bash_histroy
- .bash_aliases

### .bash_profile and .bashrc

both are being used to do some configurations but the main difference is
**.bash_profile** is gonna be exuecuted once you **log in** to the OS to do some configuration before get the inital command prompt.

and for **.bashrc** it works after you already logged in

we'll see why these two are there, and how they are communicating together <br>
navigate to your home directory and see the configuration files.

```bash
meska@root ls -la | grep '.bash*'
-rw-rw-r--  1 yousef yousef        18 نوف 21 03:36 .bash_aliases
-rw-------  1 yousef yousef     10707 نوف  6 07:29 .bash_history
-rw-r--r--  1 yousef yousef       220 يون 16 12:04 .bash_logout
-rw-rw-r--  1 yousef yousef        95 يول  6 17:58 .bash_profile
-rw-r--r--  1 yousef yousef      4260 نوف 25 06:31 .bashrc
-rw-rw-r--  1 yousef yousef     78656 يول  6 17:54 .git-completion.bash

meska@root nano .bash_profile
```

#### Task

try to make an alias for for '-laZ | more'

.bashrc it gets executed simply

- before command prompt comes up, or
- when you start bash instance when you type bash in the shell.

```bash
nano ~./bashrc
```

you will notice that .bashrc will not going to run, unless .bash_profile runs it at first

let's say we export NEWVAL in .bashrc

```bash
#!/bin/bash
# inside .bashrc
export NEWVAL=123;
```

when we save and try to grep that newVAL
we will see nothing

```bash
env | grep NEWVAL
# no output
```

</details>
--> because remember how .bashrc get executed?
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

# Using Enviroment Variables

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

# Using Variables on the Command line

We will look first on how to use variables on command line, then we will see how to so on bash

**Be sure** not to override already existed variables (reserved variables [all on CAPS]), be careful of the name you pick

- ""
- ''
- \` \`

\*\* There is no spaces before or after the assignment

```bash
meska@root FIRSTNAME="Yousef"
meska@root env | grep FIRSTNAME #shows nothing
meska@root export FIRSTNAME
meska@root env | grep FIRSTNAME
            FIRSTNAME=Yousef # output
meska@root echo "Your first name is: $FIRSTNAME"
            Your first name is: Yousef #output
meska@root export TODAYSDATE=`date`
meska@root echo $TODAYSDATE
            <your current date> # output
```

\*\* If your command is a real-time command like (date), you should export it everytime you need to use it because if we don't do so, it will show the first time we exported

# Setting and using variables in scripts

```bash
#!/bin/bash
echo "The current path is: $PATH";
```

- As a best practive: combine export and variable declaration into one single statement

```bash
MYUSERNAME="username"
MYPASSWORD="password123"
STARTOFSCRIPT=`data`

echo "My login name for this application is: $MYUSERNAME"
echo "My Login password for this application is: $MYPASSWORD"
echo "I started this script at :$STARTOFSCRIPT"

ENDOFSCRIPT=`date`
echo "I ended this script at : $ENDOFSCRIPT"
```

Run the [script](src="./scripts/variables.sh") and notice something weird:

```bash
meska@root chmod u+x variables.sh
meska@root ./variable.sh
            ## Shows the ouput
meska@root env | grep MY
            ## Shows nothing?
```

where is the variables I've declared?
The reason for this, as the script runs on shell instance differ from the one we executing the other command

# Comments

Comments can help you fasten your scripting skills and make others understand your code.

In Bash we use the HASH symobl **#** to make commendts

```bash
#!/bin/bash
# this line is intended to be used as a general description of the script
# and anything that it does

clear # clears the screen

MYUSERNAME='meska' # the username for this application
echo "We are using the default user called: $MYUSERNAME" # display to the console
DATETIMESTAMP=`date`
echo "This is when the script was run: $DATETIMESTAMP" # this is the timestamp of run
```

# Task1: Extract Subdomains

You've given a website to extract the subdomain for it, make a script to automate this opertion

<details>
<summary>Solution</summary>

```bash
wget cisco.com
cat index.html | grep 'href=' index.html | cut -d '/' -f 3 | grep '\.' | cut -d '"' -f 1 | sort -u
```

</details>

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

<details>
<summary>Solution</summary>
```bash
## codes
```
