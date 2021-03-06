; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Streaming-DL Helper"
#define MyAppVersion "1.0"
#define MyAppPublisher "ichii731"
#define MyAppURL "https://tools.ic731.net/stream_dl"
#define MyAppExeName "streaming-dl_helper.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3CA7DE7A-74F2-43FF-8082-709F2B7A96EC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\Streaming-dl_helper
ChangesAssociations=yes
DisableProgramGroupPage=yes
LicenseFile=C:\Users\tomomi\source\repos\streaming-dl_helper\docs\README - はじめにお読み下さい.txt
InfoAfterFile=C:\Users\tomomi\source\repos\streaming-dl_helper\docs\インストール後表示.txt
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
OutputDir=C:\Users\tomomi\source\repos\streaming-dl_helper\bin\setup
OutputBaseFilename=mysetup
SetupIconFile=C:\Users\tomomi\source\repos\streaming-dl_helper\docs\icon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\Microsoft.WindowsAPICodePack.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\Microsoft.WindowsAPICodePack.Shell.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\Microsoft.WindowsAPICodePack.ShellExtensions.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\streaming-dl_helper.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\streaming-dl_helper.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\streaming-dl_helper.dll.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\streaming-dl_helper.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\streaming-dl_helper.runtimeconfig.dev.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\streaming-dl_helper.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\scripts\*"; DestDir: "{app}\scripts"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\tomomi\source\repos\streaming-dl_helper\bin\Release\net5.0-windows\ref\*"; DestDir: "{app}\ref"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

