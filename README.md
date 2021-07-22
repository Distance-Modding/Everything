# Mod common repository
Repository referencing all of the [Distance-Modding](https://github.com/Distance-Modding) mod repositories as submodules for continuous integration (CI/CD) using AppVeyor.

# Cloning the repository
```
git clone --recurse-submodules -j8 git://github.com/Distance-Modding/Everything.git
```

# Building the repository
> Before building the mods, be sure to have [__visual studio 2019__ (or higher)](https://visualstudio.microsoft.com/fr/downloads/) installed. Building might work with previous versions of the `msbuild` compiler but these versions are not officially supported!

In a *powershell command prompt**, run the [build.ps1](build.ps1) script:
```
pwsh ./build.ps1
```
The built mod files will be located in the `Build` folder next to the build script.

*Tested with [Powershell 7](https://github.com/PowerShell/PowerShell#get-powershell)