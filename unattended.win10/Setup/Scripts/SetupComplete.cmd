rem dennyhalim.com
rem this will be copied after first reboot and then run after next reboot

rem replace defaultlayouts before it gets created
move "%Public%\..\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml" "%Public%\..\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.dennyhalim" 
copy /y "%WINDIR%\Setup\Files\DefaultLayouts.xml" "%Public%\..\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml"
move "%SystemRoot%\SysWOW64\OneDriveSetup.exe" "%SystemRoot%\SysWOW64\OneDriveSetup.dennyhalim"
move "%SystemRoot%\System32\OneDriveSetup.exe" "%SystemRoot%\System32\OneDriveSetup.dennyhalim"
rem move "%windir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy" "%windir%\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy.dennyhalim"
rem startmenu disabled if shellex disabled
rem move "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy" "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.dennyhalim"

wmic.exe USERACCOUNT WHERE "Name='admin'" set PasswordExpires=FALSE
wmic.exe USERACCOUNT WHERE "Name='user'" set PasswordExpires=FALSE

reg.exe load "HKLM\DEFAULT" "%Public%\..\default\ntuser.dat"
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 1 /f
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v Value /d Deny /f
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v epicsetup /t REG_SZ /D "%WINDIR%\Setup\Files\mini_installer.exe" /F
reg.exe add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v compacting /t REG_SZ /D "%WINDIR%\System32\compact.exe /C %LOCALAPPDATA% /I /Q" /F
reg.exe delete "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDriveSetup /F
reg.exe unload "HKLM\DEFAULT"

reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v BranchReadinessLevel /d 32 /t REG_DWORD /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferFeatureUpdates /d 1 /t REG_DWORD /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferFeatureUpdatesPeriodInDays /d 365 /t REG_DWORD /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferQualityUpdates /d 1 /t REG_DWORD /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferQualityUpdatesPeriodInDays /d 14 /t REG_DWORD /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /d 1 /t REG_DWORD /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DeferUpgrade /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore" /v AutoDownload /t REG_DWORD /d 2 /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v NoConnectedUser /t REG_DWORD /d 1 /f
rem reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Settings" /v AllowYourAccount /t REG_DWORD /d 0 /f
reg.exe add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" /v WiFiSenseCredShared /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" /v WiFiSenseOpen /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 1 /t REG_SZ /d pool.ntp.org /f
rem reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\sppsvc" /v Start /t REG_DWORD /d 3 /f
reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 1 /f
reg.exe add "HKLM\Software\Wow6432Node\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm" /v update_url /t REG_SZ /D "https://clients2.google.com/service/update2/crx" /F 
reg.exe add "HKLM\Software\Google\Chrome\Extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm" /v update_url /t REG_SZ /D "https://clients2.google.com/service/update2/crx" /F 
reg.exe add "HKLM\Software\Policies\Google\Chrome" /v BackgroundModeEnabled /f /t REG_DWORD /d 0
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v DefaultCookiesSetting /f /t REG_DWORD /d 4
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v DefaultNotificationsSetting /f /t REG_DWORD /d 2
rem reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v DefaultGeolocationSetting /f /t REG_DWORD /d 2
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v HomepageLocation /f /t REG_SZ /d "http://dennyhalim.com"
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v BlockThirdPartyCookies /f /t REG_DWORD /d 1
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v BuiltInDnsClientEnabled /f /t REG_DWORD /d 1
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v DiskCacheSize /f /t REG_DWORD /d 1
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v ForceGoogleSafeSearch /f /t REG_DWORD /d 1
reg.exe add "HKLM\Software\Policies\Google\Chrome\Recommended" /v ForceYouTubeRestrict /f /t REG_DWORD /d 1

cscript.exe "%WINDIR%\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Canon LBP2900" -i "%WINDIR%\Setup\Drivers\CanonLBP2900\CNAB4STD.inf"
cscript.exe "%WINDIR%\System32\Printing_Admin_Scripts\en-US\prndrvr.vbs" -a -m "Canon G2000 series Printer" -i "%WINDIR%\Setup\Drivers\CanonG2000\Driver\G2000P6.inf"
rem move "%WINDIR%\Setup\Drivers\*" "%WINDIR%\INF"

schtasks.exe /change /TN "\Microsoft\Windows\Setup\SetupCleanupTask" /DISABLE
schtasks.exe /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
schtasks.exe /change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE
schtasks.exe /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE
schtasks.exe /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE
schtasks.exe /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE

"%WINDIR%\Setup\Files\chocolatey.exe" /S
"%WINDIR%\Setup\Files\Firefox Setup 52.6.0esr.exe" -ms
"%WINDIR%\Setup\Files\vlc-3.0.1-win64.exe" /L=1033 /S
"%WINDIR%\Setup\Files\SumatraPDF-3.1.2-64-install.exe" /S
msiexec.exe /passive /norestart /I "%WINDIR%\Setup\Files\just-install.msi"
msiexec.exe /passive /norestart /I "%WINDIR%\Setup\Files\NpackdCL-1.23.2.msi"
msiexec.exe /passive /norestart /I "%WINDIR%\Setup\Files\7z1805-x64.msi"
msiexec.exe /passive /norestart /I "%WINDIR%\Setup\Files\qalculate-2.4.0a.msi"
msiexec.exe /passive /norestart /I "%WINDIR%\Setup\Files\GoogleChromeStandaloneEnterprise64.msi"
msiexec.exe /passive /norestart /I "%WINDIR%\Setup\Files\LibreOffice_5.4.6_Win_x64.msi"
rem "%WINDIR%\Setup\Files\avira_pc_cleaner_en.exe" /s
"%WINDIR%\Setup\Files\mb3-setup-consumer-3.4.5.2467-1.0.342-1.0.4664.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
"%WINDIR%\Setup\Files\avast_business_antivirus_managed_setup_offline_silent.exe"

powershell.exe -ExecutionPolicy Bypass -File "%WINDIR%\Setup\Progs\OpenSSH\install-sshd.ps1"
PowerShell.exe -ExecutionPolicy Bypass -File "%WINDIR%\Setup\Files\setup.ps1"

sc.exe config WSearch start= demand
sc.exe config wuauserv start= demand
sc.exe config DiagTrack start= disabled
sc.exe config dmwappushservice start= disabled
sc.exe config RetailDemo start= disabled
sc.exe config lfsvc start= disabled
sc.exe config ssh-agent start= auto
sc.exe config sshd start= auto

netsh advfirewall firewall add rule dir=in action=allow profile=any protocol=TCP localport=2222 name="sshd"

mkdir "%Public%\Desktop.dennyhalim"
move "%Public%\Desktop\*.*" "%Public%\Desktop.dennyhalim"

rem use powershell for w10 only features
dism.exe /online /norestart /Enable-Feature /FeatureName:TelnetClient
dism.exe /online /norestart /Disable-Feature /FeatureName:MediaPlayback
dism.exe /online /norestart /Disable-Feature /FeatureName:WindowsMediaPlayer
dism.exe /online /norestart /Disable-Feature /FeatureName:WindowsGadgetPlatform 
dism.exe /online /norestart /Disable-Feature /FeatureName:Indexing-Service-Package
dism.exe /online /norestart /Disable-Feature /FeatureName:Internet-Explorer-Optional-x86
dism.exe /online /norestart /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64

rem powercfg -hibernate on
REAGENTC.EXE /enable
rem "%WINDIR%\Setup-githubbox.exe"
rem shutdown /r /f /t 0
