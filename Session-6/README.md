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

.NET objects have certain properties and methods;
Get-Memeber provided a list of those.

- when PowerShell made $yousef a string-base variable, it acquired all the capabilites of a .NET string object

> Everything in PowerShell automatically has a lot of pre-programmed functionalites.

> .NET Framework is a bunch of classes.

> the more you understand how PowerShell used .NET Framework, the more you have control of the cmdlets

## Classes, Objectss and PowerShell

Let's look at a simple example...

- We'll create a .NET class.
- We'll create an object bases on that class using PowerShell.
- We'll execute a method on the object using PowerShell.
- We'll use Get-Member to get information about that newly created object

In this example, we are going to do the same as what does cmd do.

```cmd
msg ymmco Hello
```

:"D open visual studio code and make a new class

```c#

using System;
using System.Collection.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms; //don't forget to add the class from References tab

namespace MLClass
{
  public class Messages
  {
    public bool IsAdmin {get; set;}
    public bool IsOnDuty {get; set;}

    public Messages()
    {
      IsAdmin = true;
      IsOnDuty = true;
    }
    public void SendMsg(){
      System.Diagnostics.Process.Start("MSG", "Adminstrator" + " "+ "Hello from PowerShell");
      MessageBox.Show("IsAdmin =" + IsAdmin.ToString());
    }
  }
}
```

Build your project. locate the DLL file, copy it to the roo system directory (c:) and open your PowerShell

```PowerShell
[Reflection.Assembly]::LoadFile("c:\MLCLass.dll");
$ml = new-object MLClass.Messages
$ml.SendMsg();
$ml | Get-Member #
```

## Creating A Powershell Script & Executing

- using notepad
- using Windows Powershell ISE.

- The ability to execute PowerShell scripts is disables by default

  - The Execution Policy must be changed to allow scripts to be run.

- `Get-ExecutionPolicy`
- `Set-ExecutionPolicy RemoteSigned`

- To run a script, type the path and name of the script file.
  - the path is required..even when the script is located in the current directory.
  - This is a deliberate security measure.
    - Designed to be difficult intentioally for malicious code not to be run.

```PowerShell

```
