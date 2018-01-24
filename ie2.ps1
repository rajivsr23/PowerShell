#Able to login to Harvest

$requestUri = "https://sohodragon.harvestapp.com/missing_time";

$username = "rr@sohodragon.com" 
$password = "Password1234" 
$ie = New-Object -com InternetExplorer.Application 
$ie.visible=$true
$ie.navigate("https://sohodragon.harvestapp.com/missing_time") 
while($ie.Busy) { Start-Sleep -Milliseconds 100000 }

($ie.document.getElementsByName("email") |select -first 1).value = $username
($ie.document.getElementsByName("password") |select -first 1).value = $password
($ie.document.getElementsByName("button") |select -first 1).click()
# Sleep while IE is busy. Check 10 times per second, adjust delay as needed



#$ie.Document.body | Out-File -FilePath c:\web.tx
Write-Verbose "Login Complete"

#<input name="email" id="email" autofocus="autofocus" type="email" placeholder="Email" autocapitalize="none">

#<input name="password" id="password" type="password" placeholder="Password">

#<button name="button" class="button button-big button-full button-primary" id="log-in" type="submit">Sign In</  #button>
