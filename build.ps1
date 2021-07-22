
# ----- INSTALL MODULES -----

function Install-PSModule {
	param ($Name)

	if (-Not $(Get-Module -ListAvailable -Name $Name)) {
		Write-Host "Installing module $Name..."
		Install-Module VSSetup -Scope CurrentUser -Force
	}
	else
	{
		Write-Host "Module $Name already Installed"
	}
}

# Install VSSetup module
Install-PSModule VSSetup

# Install Build utils ommand
Install-PSModule BuildUtils

# ----- RUN BUILD -----

$MSBuild = Get-LatestMsbuildLocation
set-alias msbuild $MSBuild

msbuild Mods.proj -m -p:Configuration=Release -maxcpucount:4

# ----- MOVE BUILD SUBFOLDERS INTO CURRENT DIRECTORY -----

$Current = Get-Location

$Mods = Get-ChildItem -Filter "Mod.*" $Current.Name -Directory

foreach ($ModPath in $Mods) {
	$ModBuild = "$($ModPath.FullName)\Build"

	if (Test-Path -Path "$ModBuild") {
		#Write-Host "Build directory: $($ModBuild)"
		Copy-Item -Path "$ModBuild" -Destination "$Current" -Force -Recurse
		Remove-Item -Path "$ModBuild" -Force -Recurse
	}
}


#foreach ($Dir in $Directories) {
#	Write-Host "Building solution in directory $($Dir.Name)..."
#
#	$Solutions = Get-ChildItem -Filter "*.sln" $Dir.FullName
#
#	foreach ($Solution in $Solutions) {
#		Write-Host "- $($Solution.Name)"
#
#		msbuild "$($Solution.FullName)" -t:restore
#		msbuild "$($Solution.FullName)" -t:build
#	}
#}