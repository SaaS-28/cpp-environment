Write-Host "Download has started. PLEASE DO NOT USE THE KEYBOARD THROUGHOUT THE DOWNLOAD AND INSTALLATION PROCESS"

# URL of the installation file
$url = "https://github.com/msys2/msys2-installer/releases/download/2023-05-26/msys2-x86_64-20230526.exe"

# Path of the user default download folder
$downloadPath = "$($env:USERPROFILE)\Downloads\msys2-x86_64-20230526.exe"

# Create a WebClient object and Download the file
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, $downloadPath)

# MSYS2 installer path
$installerPath = "$($env:USERPROFILE)\Downloads\msys2-x86_64-20230526.exe"

# Start the installation
$installerProcess = Start-Process -FilePath $installerPath -ArgumentList "install", "--root", "C:\msys64" -PassThru

# Wait a short time to make sure the installation window is active
Start-Sleep -Seconds 3

# Simulate "Y" and "ENTER" input in the installation window
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("Y{ENTER}")

# Wait for the installation process to complete
$installerProcess.WaitForExit()

# Commands for the msys terminal
$commands = "pacman -S --needed --noconfirm base-devel mingw-w64-ucrt-x86_64-toolchain"

# Using [System.Diagnostics.Process] to avoid quotes problems
$process = New-Object System.Diagnostics.Process
$process.StartInfo.FileName = "cmd.exe"
$process.StartInfo.Arguments = "/c C:\msys64\msys2_shell.cmd -c `"$commands`""
$process.StartInfo.UseShellExecute = $false
$process.StartInfo.CreateNoWindow = $true

# Starting the process
$process.Start() | Out-Null

# Wait for the process to complete
$process.WaitForExit()

# Path of the file to add to the PATH environment variables
$newPath = "C:\msys64\ucrt64\bin"

# Remove any backslashes at the end of $newPath
$newPath = $newPath.TrimEnd('\')

# Current value of the PATH variable
$currentPath = [System.Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)

# Check if the new path is already present in the PATH variable
if ($currentPath -notlike "*$newPath*") {
    # Add the new path to the PATH variable
    $newPathToAdd = "$currentPath;$newPath"
    [System.Environment]::SetEnvironmentVariable("PATH", $newPathToAdd, [System.EnvironmentVariableTarget]::User)
} else {
    Write-Host "The path is already present in the PATH."
}