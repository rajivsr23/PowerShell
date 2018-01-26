#Able to login to Harvest

$requestUri = "https://sohodragon.harvestapp.com/missing_time";

$username = "" 
$password = "" 
$ie = New-Object -com InternetExplorer.Application 
$ie.visible=$true
$ie.fullscreen = $true;
while($ie.Busy) { Start-Sleep -Milliseconds 1000 }
$ie.navigate("https://sohodragon.harvestapp.com/missing_time") 
while($ie.Busy) { Start-Sleep -Milliseconds 100 }

($ie.document.getElementsByName("email") |select -first 1).value = $username
($ie.document.getElementsByName("password") |select -first 1).value = $password

($ie.document.getElementsByName("button") |select -first 1).click()
# Sleep while IE is busy. Check 10 times per second, adjust delay as needed




#$ie.Document.body | Out-File -FilePath c:\web.tx
Write-Host "Login Complete"

($ie.document.getElementsByClassName("hui-button hui-button-tiny") |Select-Object -first 1).click()

Write-Host "Clicked on the View Timesheet Button"

while($ie.Busy) { Start-Sleep -Milliseconds 1000 }
#If Submit Button doesn't exist then go back
$element=$ie.document.getElementByID("hui-button submit-link js-toggle-approve test-submit-button")
if($element.ToString() -eq ""){
Write-Host "The Submit Button Doesn't exists"
$ie.navigate("https://sohodragon.harvestapp.com/missing_time") 
while($ie.Busy) { Start-Sleep -Milliseconds 1000 }
($ie.document.getElementsByClassName("hui-button hui-button-tiny") |Select-Object -last 1).click()
Write-Host "Last Button"
while($ie.Busy) { Start-Sleep -Milliseconds 1000 }
($ie.document.getElementsByClassName("hui-button submit-link js-toggle-approve test-submit-button") |Select-Object -first 1).click()

Write-Host "Clicked on the Submit Button"
}
else{

Write-Host "The Submit Button exist"
}

#<input name="email" id="email" autofocus="autofocus" type="email" placeholder="Email" autocapitalize="none">

#<input name="password" id="password" type="password" placeholder="Password">

#<button name="button" class="button button-big button-full button-primary" id="log-in" type="submit">Sign In</  #button>
