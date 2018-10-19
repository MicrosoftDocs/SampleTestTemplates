function CheckNodeJSScript
{
    param(
		[Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
		[ValidateNotNullOrEmpty()]
		[string] $FilePath
    )
    begin{
        $total = 0
        $failed = 0
    }
    process{
        Get-ChildItem -Path $FilePath -File -Recurse *.js|ForEach-Object{
            Write-Host $_.FullName
            $total += 1
            $pinfo = New-Object System.Diagnostics.ProcessStartInfo
            $pinfo.FileName = "node"
            $pinfo.RedirectStandardError = $true
            $pinfo.RedirectStandardOutput = $true
            $pinfo.UseShellExecute = $false
            $pinfo.Arguments = " -c " + $_.FullName
            $p = New-Object System.Diagnostics.Process
            $p.StartInfo = $pinfo
            $p.Start() | Out-Null
            $p.WaitForExit()
            $stdout = $p.StandardOutput.ReadToEnd()
            $stderr = $p.StandardError.ReadToEnd()
            Write-Host "stdout: $stdout"
            Write-Host "stderr: $stderr"
            Write-Host "exit code: " + $p.ExitCode
            $failed += (({0},{1})[$p.ExitCode -ne 0]).Invoke().ToInt32($null)
        }
    }
    end{
        Write-Host "total:" $total
        Write-Host "failed:" $failed

        return (({0},{1})[$failed -gt 0 -or $total -eq 0]).Invoke()
    }
}

exit (CheckNodeJSScript '.')
