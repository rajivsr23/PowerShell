#Drop Down on Harvest-Gets the Week Preceeding the Previous Week

$ie = New-Object -ComObject internetexplorer.application
$ie.Visible = $true
$date=Get-Date -UFormat %j
$date_twoWeeks=$date-14

$ie.Navigate("https://sohodragon.harvestapp.com/missing_time/period/$date_twoWeeks/2018")
