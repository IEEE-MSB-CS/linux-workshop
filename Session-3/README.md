# Session 3 

## Input and Output Streams and Redirection 

- standard streams are input and output (I/O) communication channels between a program and it's environment.

- The three standard streams are standard input (stdin,0) provides input to commands, standard output (stdout,1) displays output from commands, and standard error (stderr,2) displays error output from commands.

### Redirection

#### To redirect stdout use '>' operator.

``` bash
cat file > output.txt #(content of file will overwrite content of output.txt, if output.txt doesn't exit, a new file with this name is created)
cat file >> output.txt #(content of file will append to content of output.txt)
```
- Note: error messages still go to the screen.

- Note: '>' stands for "1>", as 1 is assumed to be the default value.

#### To redirect stderr use "2>".

``` bash
find /home/user -name text.txt 2> error.txt #(errors of finding text.txt in user home dirctory overwrite the content of  error.txt, if error.txt dosen't exist, a new file with this name is created)
find /home/user -name text.txt 2>> error.txt #errors of finding text.txt in user home dirctory append the content of  error.txt)
```
- Note: output still go to the screen.

#### To redirect stdin use "<".

``` bash
cat < file.txt #(file.txt is redirected as the input of cat command)
```

### Piping '|'

- Pipe is a command in Linux that lets you use two or more commands such that output of one command serves as input to the next

``` bash
cat error.txt | grep -i sphinky #(content of cat command don't go to stdout, but it served as input of grep command)                 
```

## Users and Groups

- User: Linux is a multi-user system for the same linux machine. Every user is provided with his work area with hiw own files, environment variables, shell functions.

- Groups: A user- group can contain multiple users. All users belonging to a group will have the same Linux group permissions access to the file. 

- Others: Any other user who has access to a file. This person has neither created the file, nor he belongs to a usergroup who could own the file. 

- Linux Primary Groups: A primary group is the default group that a user account belongs to. Every user on Linux belongs to a primary group.


### Adding and deleting users

```bash
sudo useradd sphinky #(add new user called sphinky)
sudo useradd -m sphinky #(add new user called sphinky and create home dircetory for him)
sudo useradd -D #(displays defaults for user additions)
users #(print names of users currently logged in to the current host)
sudo passwd sphinky #(to set pasword for new user, or change it)
sudo userdel username #(delete username)
```

### Switching users

```bash
sudo su sphinky #(switch to sphinky and keep host environment)
sudo su - sphinky #(switch to sphinky and change to this user environment)
```

### Important configurations files

- Users are added in /etc/passwd

- Groups are added in /etc/group

- Passwords of users are encrypted and stored in /etc/shadow

### Adding and deleting groups

```bash
sudo groupadd SEN #(creats new group called SEN)
sudo groupdel SEN #(delete SEN group)
id sphinky #(display user and group names and numeric ID's)
sudo usermod -G groupname user #(add user to groupname)
sudo usermod -a -G group1,group2,group3 user #(add user to multiple groups)
groups user #(list groups of this user)
```

### Add login root user

```bash
sudo apt install kali-root-login
sudo passwd
```


## Permissions

- Permission is acciocated with files, not users nor groups. There are three types of permissions read, write and execute.

- Read: This permission give you the authority to open and read a file. Read permission on a directory gives you the ability to lists its content.

- Write: The write permission gives you the authority to modify the contents of a file. The write permission on a directory gives you the authority to add, remove and rename files stored in the directory.

- Execute: you cannot run a program unless the execute permission is set.

### Changing files permissions
#### Absolute mode

- read pemission has value of 4, write permission has value of 2, executr permission has value of 1. Depending of permissions you need you add these values.

- Default permissions values for directories are 777 and for files are 666. Default value of mask is 002, changing directories permission to 775 and files permissions to 664. 

```bash
chmod 700 try.txt #(change permissions of user to r,w and x. groups and others don't have any permission)
chmod 060 try.txt #(change permission of groups to r and w. user and others don't have any permission)
chmod 005 try.txt #(change permissions of others to r and x. user and groups don't have any permission)
umask #(display mask value)
umask 000 #(change mask value to 000)

```

#### Relative mode

```bash
chmod u=rw try.txt #(set permission of user to r and w)
chmod o+w  try.txt #(add w permission to others)
chmod g-r  dir1 #(remove r permission from groups)
chmod -R u=rw dir2 #(change permission of this directory with its sub files and directories)
```

## Changing Ownership

```bash
ls -l #(list files and directories in long format, user and group owner also displayed)
chown sphinky:SEN file #(change group ownership of this file to SEN, and user ownership to sphinky)
chown sphinky file #(change file user ownership to sphinky)
chwon :SEN file #(change file group ownership to SEN)
```

## Processes

- A program is any executable file held in storage on your machine. Anytime you run a program, you have created a process.

- Linux is a multi-tasking OS, that means it can run multiple tasks simultaneously. The linux kernel distribute the processor time among the running processes. Each user starting a process becomes its owner. 

- Each process has a unique id (PID).

- There are four States of a process in Linux: 
    - 1- Running: the process is running
    - 2- Wating: a process is waiting for an event to occur or for a system resource.
    - 3- Stopped: a process has been stopped, usually by receiving a signal.
    - 4- Zombie: a process is dead, it has been halted but it's still has an entry in the process table. 

- When a command is written, the execution of this command is called job. Jobs can run in foreground or background

- Foreground job: all input and output of the terminal is exclusively for this job, user cannot use the terminal for any other activity or start other jobs.

- Background job: i/o does not utilize the terminal, its still attached to the terminal, may multiply jobs run in the background. Useful when the process takes long time in processing and you want to use the terminal.

```bash
jobs #(list jobs the user is running in background and foreground)
fg %i #(to resume a stopped foreground job with id i)
```
- ctrl + z to stop a froeground job.

- crtl + c interrupt a foreground job.

- To run the command in background type '&' at the end of the command

```bash
ps #(It displays information about a selection of the active processes on the system)
```
- Result of ps command has four colums
    - PID: the unique process ID.
    - TTY: terminal type that the user is logged into.
    - TIME: amount of CPU in minutes and seconds that the process has been running.
    - CMD: name of the command that lanuched the process.


```bash
top #(list all running Linux Processes and get the information of running tasks, memory, cpu, and swap)
```
	- PID: Shows task's unique process id.
	- PR: Stands for priority of the task.
	- SHR: Represents the amount of shared memory used by a task.
	- VIRT: Total virtual memory used by the task.
	- USER: User name of owner of task.
	- %CPU: Represents the CPU usage.
	- TIME+: CPU Time, the same as TIME, but reflecting more granularity through hundredths of a second.
	- SHR: Represents the Shared Memory size (kb) used by a task.
	- NI: Represents a Nice Value of task. A Negative nice value implies higher priority, and positive Nice value means lower priority.
	- %MEM: Shows the Memory usage of task.

### Task

- get passwords up to user 15


https://overthewire.org/wargames/bandit/bandit15.html
