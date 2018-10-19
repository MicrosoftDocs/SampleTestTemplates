param(
	[string]$repo_path="",
	[string]$commit="head")
$git = (Get-ChildItem -Path 'C:\\Program Files\\PackageManagement\\NuGet\\Packages' -Recurse | Where-Object -FilterScript { $_.FullName -match '[a-zA-Z0-9\\\.\s:]*\\cmd\\git.exe' }).FullName
& $git clone $repo_path --verbose .\repo
cd repo
& $git reset --hard $commit

