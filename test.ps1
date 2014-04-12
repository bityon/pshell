<#
  .SYNOPSIS
  Describe the function here
  .DESCRIPTION
  Describe the function in more detail
  .EXAMPLE
  test.ps1 -nodesNames "c1,c2,c3"
  .EXAMPLE
  Give another example of how to use it
  .PARAMETER nodesNames
  The name of nodes to check.
 #>

param (
    [string]$nodesNames = "Clear-Host,Get-Host,Out-Host,Read-Host,Write-Host"#, #$( Read-Host "Input nodesNames, please" )
    #[Parameter(Mandatory=$False,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True,HelpMessage='What computer name would you like to target?')]
    #[Alias('host')]
    #[ValidateLength(3,30)]
    #[string[]]$computername

 )

$c = Get-Command | Select-String "Host"
$d = $c | ForEach-Object { return $_.ToString() }
$e = $nodesNames.Split(',') 
#$e |  ForEach-Object { $_.GetType().FullName }

$e | ForEach-Object { $b = $d -contains $_ }
$d | ForEach-Object { $b = $e -contains $_ }

return $b