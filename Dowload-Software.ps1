
$url1 = "https://ninite.com/7zip-adoptjavax8-chrome-firefox-vlc/ninite.exe"
$output1 = "~\Downloads\ninite.exe"


$url2 = "https://admdownload.adobe.com/bin/live/readerdc_en_a_install.exe"
$output2 = "~\Downloads\readerdc_en_a_install.exe"



Invoke-WebRequest -Uri $url1 -OutFile $output1
sleep -s 1
Start-Process -FilePath "$output1" -Verb RunAs

Invoke-WebRequest -Uri $url2 -OutFile $output2
sleep -s 1
Start-Process -FilePath "$output2" -Verb RunAs


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
