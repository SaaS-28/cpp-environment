# C/C++ setup

Powershell script that **downloads**, **installs** and **configures** the c and c++ compiler **automatically**.

This script is written based on the [Visual Studio Code guide](https://code.visualstudio.com/docs/cpp/config-mingw) and using [MSYS](https://www.msys2.org/).

## How to run

First, make sure you have **permission** to run the scripts locally. To do this you simply open PowerShell as **administrator** and type the following command.

```powershell
Set-ExecutionPolicy RemoteSigned.
```
You will now need to type `A` and then you will be able to run the script.

Select the main.ps1 file then `right-click` &rarr; `Run with PowerShell`.

> **NOTE**: Do not press any key during the whole process

## Visual Studio Code

Open [Visual Studio Code](https://code.visualstudio.com/Download), download and install the [C/C++ Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack).

Now press the `Run C/C++ File` button on the top-right corner.

Select the **g++ compiler**. If you missclick this just press `F5` and select again.

> **NOTE**: You might need to press the button a second time

## Windows defender problems

You might have some **problems** with **Windows Defender** while running yout c++ scripts so read this only if you get a Windows Defender notification just after you start compiling your script.

To **fix** this just go to the `Virus & threat protection settings`, scroll down and click on the `Add or remove exclusions` under the **Exclusion** section.

You now have to click on the `Add an exclusion button` and press **folder**. Select the folder where you save your c++ files.