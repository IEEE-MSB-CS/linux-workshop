# Session 6

A humble Introduction to PowerShell

## Table of contents

- Why Windows PowerShell?
- A little history
- Powershell or CMD
- .NET Integration
- Getting and installing powershell
- Configuring the Console
- Powershell Profiles
- PowerShell Commands
- The Pipeline
- Creating a powershell script & Executing
- Variables and Constants
- Comparison opertators
- If statements and looping
- Regular expressions
- Escape Expressions
- Using Parameters with scripts
- PowerShell Providers
- Working with files and folders
- Reading and writing data
- HTML/XML/CSV
- Working with processes
- PowerShell and WMI ()
- Powershell 5.0

## Conventions

most of the Powershell comamnds are Captialzed-and-Hyphned
(and they are case-insensitive)

## Adminstrative priveledges

1. Run as 'GUI'
2.

```powershell
Start-Process Powershell -verb runas
```

## Getting Help

- Help Files

1. Single page

- `Get-Help <command>`
- `Help <cmdlet>`

2. Multiple Pages

- `<cmdlet>-?`

3. to see examples
   `Get-Help <cmdlet> -example or -detailed`
4. for more technical information
   `Get-Help <cmdlet> -full`
5. Open in windows
   `Get-Help <cmdlet> -ShowWindow

## Commands

- `cls` or `clear` (clearing the screen)

- `Get-Command`:
  prompt and return a list of all the commands in the version you are running

> try to get-help about Get-Command

```powershell
get-command -type cmdlet
```

## Using a format

Format Command is very powerfull when you want to dig into administration, but for us, it's that much helpful

- Powershell has a set of cmdlets that allow you to control which properties are displayed for particular objects
  - the cmdlets begin with the verb Format
- 4 format commands
  - Format-Wide
  - Format-List
  - Format-Table
  - Format-Custom

```powershell
Get-Process | Format-Wide -column 4
Get-Process | Format-List

Get-Process -Name PowerShell | Format-List -Property Name, FileVersion

Get-Process -Name PowerShell | Format-Table
```

- `Get-Member`
  retreieves information about .NET objects - It displays the properties and methods of the objects - the members of the object
  can't understand a word, right? this is normal, it takes time to get you head around this mindset, so let's look at an example

```powershell
$yousef = "Hello world"
```

yousef is a variable and also .NET object

```powershell
$yousef | Get-Member -membertype properties

$yousef.Length
$yousef.ToUpper
```

\*\* .NET Object:

> Everything in PowerShell is an object
