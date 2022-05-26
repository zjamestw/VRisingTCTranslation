@Echo Off
Set "SPth="
For /F "Tokens=1,2*" %%A In ('Reg Query HKCU\SOFTWARE\Valve\Steam') Do (
    If "%%A" Equ "SteamPath" Set "SPth=%%C/steamapps/common/VRising/VRising_Data/StreamingAssets/Localization"
)
If Defined SPth (
    Echo=Your VRising folder path is "%SPth%"
    COPY "%~dp0\TWChinese.json" "%SPth%"
) else (
    Echo=The Steam folder path is not found
)
Pause