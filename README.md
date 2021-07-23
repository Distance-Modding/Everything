# Mod common repository
Repository referencing all of the [Distance-Modding](https://github.com/Distance-Modding) mod repositories as submodules for continuous integration (CI/CD) using AppVeyor.

# Cloning the repository
```sh
git clone --recurse-submodules -j8 https://github.com/Distance-Modding/Everything.git
```

# Building the repository
> Before building the mods, be sure to have [__Visual Studio 2019__ (or higher)](https://visualstudio.microsoft.com/fr/downloads/) installed. Building might work with previous versions of the `msbuild` compiler but these versions are not officially supported!

In a *powershell command prompt**, run the [build.ps1](build.ps1) script:
```sh
pwsh ./build.ps1
```
The built mod files will be located in the `Build` folder next to the build script.

*Tested with [Powershell 7](https://github.com/PowerShell/PowerShell#get-powershell)

# I just wanna copy-paste commands to build the mods, don't care about the details!
Well, just copy this in your terminal and you'll be good to go, just be sure to have both [Powershell 7](https://github.com/PowerShell/PowerShell#get-powershell) and [Visual Studio 2019 (or higher)](https://visualstudio.microsoft.com/fr/downloads/) installed.
```sh
git clone --recurse-submodules -j8 https://github.com/Distance-Modding/Everything.git
cd Everything
pwsh ./build.ps1
cd Build
```