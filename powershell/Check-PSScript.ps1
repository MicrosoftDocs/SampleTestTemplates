function Check-PSScript
{
	param(
		[Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
		[ValidateNotNullOrEmpty()]
		[string] $FilePath
	)
	begin
	{
		$total = 0
	}
	process
	{
		Get-ChildItem -Path $FilePath -File -Recurse *.ps1|ForEach-Object{
			$total += 1			
			$errors = $null
			$content = Get-Content -Path $_.FullName
			$tokens = [System.Management.Automation.PSParser]::Tokenize($content, [ref] $errors)
			if ($errors){
				Write-Error $_.FullName -ErrorAction:SilentlyContinue
			}
		}
	}
	end
	{
		return (({0},{1})[$Error -or $total -eq 0]).Invoke()
	}
}

pwd|Write-Host

exit (Check-PSScript '.')
