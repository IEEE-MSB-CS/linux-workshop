# Git & GitHub

## table of content 
- life before VCS
- what's SVC? and its types
- git tool  
- task
- the live recorded session link


# Before VCS (Version Control System)
- the problems : how to go back into previous version, accidental delete the file or modify it, how to merge the other team work into one source code without any confusing, who did the change and when .. etc.

# What's VCS?, and its types


## VCS 
-it's a system, that make the teamwork easier, enable management of different versions, and recovering from accidental deletions or edits.


## it's types
- Local VCS
	- for local
	- can be automated by "RCS" tool
- Centralized VCS
	- Cannot work offline
	- Tools : CVS, perforce, SVN ..etc.
- Distriputed VCS
	- each client has a full repo not only a snapshot
	- tools : git, mercurial, bazaar ..etc.

# Git tool
- a software that was created by "Linus Torvalds", he made it to manage linux development community
- it's a CLI tool, but now there's a GUI too.

### some basic concepts
- Repository, repo, depot ==> it's a directory structure that holds all the project history and events. and this directory called ".git"

- Working Directory ==> the Directory that holds the whole project, and that dir contain the ".git" dir .

- Index, Staging area ==> area between the working dir and the repo. it has all the files that changed and ready to be committed.

- Commit ==> the process of saving any changes in local repo

- cloning ==> get a copy from a remote repo

- push ==> push the changes happened in the remote repo

- pull ==> pull any changes happened in the remote repo

- checkout ==> go to other snapshots (or branchs or tags) for the repo.



## git file integrity
- Each commit happened is stored as hash (SHA1)
- this checksum is 40 hex digits


## Branches and Tags

### Branches
- used to take a "copy" from the whole project at specific point, to deal with it without dealing with the master branch Directly. then return the changes you made to the main branch "master branch" bach after  **merging**.

### Tags
- it's a reference to a specific commit within the history of a Git repo
- it's often used to mark a release, or "snapshot"
- it may help to not use the commit hash to checkout to that commit.


## Commands we need 
```bash
git init # define a repo 

git status # show the status of the repo & working dir

git add [file name "or -A to add the files"] # add the file to staging area

git commit "prefer to use -m option with it " # commit the change 

git clone # clone a remote repo

git log # see the commits

git branch # to see the branches you have

git branch "branch name" # add a new branch

git tag # the same with branch but now with tags 

git checkout  "the checksum or tag or branch" # move to that commit or tag or branch

git push "remote repo name" "local repo name or branch" # push the changes from the local repo to the remote repo

git pull "remote repo name" "local repo name or branch" # same with push

git merge "name of branch" # this will merge the branch you choose with the branch you are already in.

git config --global user.name "the user name of the email on github" # to add a username. must be used before committing any thing
 
git config --global user.email "the email used in github mail" # to add an email.

git config --global core.editor "the text editor app name" # this will change the defult editor that used with git, the defaul editor is "vim".

# note ==> if you replaced the "--global" in the previous commands with a "--system", then those changes will applied to whole machine. 
```

# task 
- do like what i did in the whole scenario part in the live session "in the pracitcal part".

# the recorded session 
- the link : https://www.youtube.com/watch?v=Q1qDXgyQLFY