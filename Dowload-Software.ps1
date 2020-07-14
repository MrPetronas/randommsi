#UserFiles

Set-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\' -Name '{59031a47-3f72-44a7-89c5-5595fe6b30ee}' -Value 0
Set-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\' -Name '{59031a47-3f72-44a7-89c5-5595fe6b30ee}' -Value 0


#This PC
Set-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\' -Name '{20D04FE0-3AEA-1069-A2D8-08002B30309D}' -Value 0
Set-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu\' -Name '{20D04FE0-3AEA-1069-A2D8-08002B30309D}' -Value 0

#Disable Hibernate
powercfg /h off

#set to never sleep
Powercfg /x -standby-timeout-ac 0


$url1 = "https://ninite.com/7zip-adoptjavax8-chrome-firefox-vlc/ninite.exe"
$output1 = "~\Downloads\ninite.exe"


$url2 = "https://admdownload.adobe.com/bin/live/readerdc_en_a_install.exe"
$output2 = "~\Downloads\readerdc_en_a_install.exe"

while((Test-NetConnection).PingSucceeded -eq $false){
    Write-Host "no network"
    sleep -Seconds 5
}

Invoke-WebRequest -Uri $url1 -OutFile $output1
sleep -s 5
Start-Process -FilePath "$output1" -Verb RunAs

Invoke-WebRequest -Uri $url2 -OutFile $output2
sleep -s 240
Start-Process -FilePath "$output2" -Verb RunAs

$javadowload = "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=242029_3d5a2bb8f8d4428bbe94aed7ec7ae784"
$javadowloadlocal = "~\Downloads\java.exe"

Invoke-WebRequest -Uri $javadowload -OutFile $javadowloadlocal
sleep -s 120
Start-Process -FilePath "$javadowloadlocal" -Verb RunAs

if((read-host "ar reikia office 365? jei ne spauskite N ir Enter") -like "n")
{
    Write-Host "neirasom"
}else{
    Write-Host "irasom"

    $o365xml = "https://github.com/MrPetronas/Install-Default-Apps/raw/master/0365MonthlyConfiguration.xml"
    $o365xmllocal = "~\desktop\0365MonthlyConfiguration.xml"


    Invoke-WebRequest -Uri $o365xml -OutFile $o365xmllocal
    sleep -s 1    

    $office365Setupexe = "https://github.com/MrPetronas/Install-Default-Apps/raw/master/setup.exe"
    $office365Setupexelocal = "~\desktop\setup.exe"


    Invoke-WebRequest -Uri $office365Setupexe -OutFile $office365Setupexelocal
    sleep -s 2
    Start-Process -FilePath "$office365Setupexelocal" -Verb RunAs -ArgumentList "/configure C:\Users\Administrator\desktop\0365MonthlyConfiguration.xml"
    
}






$userName = "administrator"
Enable-LocalUser -Name $userName
Write-Host "Suvesk lokalaus Admin PSW"
$Password = Read-Host
$Password = (convertto-securestring $Password -AsPlainText -Force)


Set-LocalUser -Name $userName -Password $Password
Set-LocalUser -Name $userName -PasswordNeverExpires 1
Set-LocalUser -Name $userName -AccountNeverExpires


Write-Host "Suvesk kompiuterio Varda"
$PCname = Read-Host
Rename-Computer -NewName "$PCname"
