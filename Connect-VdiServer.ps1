 function Connect-VDIserver {
[CmdletBinding()]
param(
    
    [Parameter(Mandatory =$true)]
    [string] $ViewConnectionServer,
    [Parameter(Mandatory = $true)]
    [pscredential] $Credential
    )
    $PsSession=New-PSSession -ComputerName $ViewConnectionServer -Credential $Credential
    Enter-PSSession $PsSession
 try {
     Invoke-Command -Session $PsSession -ScriptBlock { Get-PSSnapin -Registered -Name "VMware.View.Broker"| Add-PSSnapin} -ErrorAction Stop
     Write-Host -Object "Connected to Horizon View server $ViewConnectionServer"
 }
 catch{
     Write-Host -Object "Failed to Connect to server"
 }
}
 
