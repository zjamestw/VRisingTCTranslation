@Echo Off
Set "IPth="
Set "QPth="

if %PROCESSOR_ARCHITECTURE%==x86 (
  Set "QPth=HKLM\SOFTWARE\Valve\Steam"
) else (
  Set "QPth=HKLM\SOFTWARE\Wow6432Node\Valve\Steam"
)

For /F "Tokens=1,2*" %%A In ('Reg Query %QPth%') Do (
    If "%%A" Equ "InstallPath" Set "IPth=%%C\steamapps\common\VRising\VRising_Data\StreamingAssets\Localization"
)

If Defined IPth (
    Echo=Your VRising installation folder path is "%IPth%"
    COPY "%~dp0\TWChinese.json" "%IPth%"
) else (
    Echo=The VRising installation folder path is not found
)
Pause