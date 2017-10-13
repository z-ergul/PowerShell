$user_name = (Get-Item env:\username).Value             
$computer_name = (Get-Item env:\Computername).Value      
     
Write-host "##########################################################################"

#### OS INFO : NAME, SERIAL NUMBER, ARCHITECTURE ###
Write-host "OS INFORMATION"
gwmi -computer $computer_name Win32_OperatingSystem | Format-List @{Expression={$_.Caption};Label="OS Name"},SerialNumber,OSArchitecture
Write-host "###########################################################################"

###  SYSTEM INFO : NAME, DOMAIN, MANUFACTURER, MODEL, SYSTEM TYPE ###
Write-host "SYSTEM INFORMATION"
gwmi -computer $computer_name Win32_ComputerSystem | Format-List Name,Domain,Manufacturer,Model,SystemType
Write-host "###########################################################################"

###  CPU INFO ###
Write-host "CPU INFORMATION"
gwmi Win32_processor | Select  Name,ProcessId
Write-host "###########################################################################"

### USERS INFO ###
Write-host "USERS INFORMATION"
gwmi -computer $computer_name Win32_UserAccount | foreach {$_.Name}
Write-host "###########################################################################"

### ACTIVE SERVICE ###
Write-host "RUNNING SERVICE INFORMATION"
get-service | where-object {$_.Status -eq "Running"} | Select-Object Name
Write-host "###########################################################################"

### IP ADDRESS / MAC ADDRESS AND DEFAULT GATEWAY IP ADDRESS ###
Write-host "IP/MAC/DEFAULT GATEWAY INFORMATION"
gwmi Win32_NetworkAdapterConfiguration -computername $computer_name | Select IPAddress,DefaultIPGateway
Write-host "###########################################################################"

### DC INFO ###
Write-host "DC(DOMAIN CONTROLLER) INFORMATION"
Get-ADDomainController 
Write-host "###########################################################################"

### DOMAIN INFO ###
Write-host "DOMAIN INFORMATION"
Get-ADDomain
Write-host "###########################################################################"

### GROUP INFO ###
Write-host "GROUP INFORMATION"
Get-ADGroup
Write-host "###########################################################################"

### SCHEDULE TASKS ###
Write-host "SCHEDULED TASK"
schtasks
Write-host "############################################################################"


### ACTIVE CONNECTION ###
Write-host "Active Connection"
netstat -ano
Write-host "###########################################################################"
Write-host "###########################################################################"
Write-host "###########################################################################"
