Get-ChildItem HKLM:/SYSTEM/CurrentControlSet/Services/MsLbfoProvider/Parameters/NdisAdapters | New-ItemProperty -Name LacpTimeout -PropertyType DWORD -Value 0
shutdown -r