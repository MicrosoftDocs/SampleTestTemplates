Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Register-PackageSource -Name "NugetSource" -Location "http://www.nuget.org/api/v2" –ProviderName nuget
Install-Package -Name GitForWindows -MinimumVersion 2.18.0 -Source NugetSource -Force
$git = (Get-ChildItem -Path 'C:\\Program Files\\PackageManagement\\NuGet\\Packages' -Recurse | Where-Object -FilterScript { $_.FullName -match '[a-zA-Z0-9\\\.\s:]*\\cmd\\git.exe' }).FullName
echo $git
