$grp = Gwmi win32_group -Filter "Domain='$env:computername' and SID='S-1-5-32-544'" 
$admgrp = $grp.Name
$nameacc = 'account_name'
$pass = 'password'
$SECPass = ConvertTo-SecureString $pass -AsPlainText -Force
New-LocalUser "$nameacc" -Password $SECPass -PasswordNeverExpires
Add-LocalGroupMember -Group "$admgrp" -Member "$nameacc"