# remove default powershell cruft 
Remove-Item alias:cls
Remove-Item alias:erase
Remove-Item alias:set
if ((Get-Host).Version.Major -ne 7) {
  Remove-Item alias:wget # wget installed with scoop
}

# initialize external environments
Import-Module pure-pwsh
fnm env --use-on-cd | Out-String | Invoke-Expression

# file utilities
Remove-Item alias:cat
Remove-Item alias:move
# TODO: look into better ways for each of these.
Function touch { New-Item "$args" -ItemType File }
Remove-Item alias:md
Function mkdir { New-Item "$args" -ItemType Directory }
Function sha256 { Get-FileHash -Path $args }

# directory utilities
Remove-Item alias:dir
Remove-Item alias:ls
Function ls { lsd -a1 }
Function lss { lsd -a --blocks permission,user,size,inode,name --size short }
Remove-Item alias:pwd
Function pwd { (Get-ChildItem).Directory.FullName }

# navigation utilities
Function e. { explorer . }
Remove-Item alias:cd_with_fnm
Function ..  { Set-Location -Path .. }
Function dev { Set-Location -Path "c:\dev-tools\bin" }
Function xdg { Set-Location -Path $env:XDG_CONFIG_HOME }

# tools and utilities
Function sherb {
  $app_path = "c:\dev-tools\bin\sherb\sherb.exe"
  if (!$args.count) { $args = "-q" }
  & $app_path $args
}
Function nvim {
  $app_path = "c:\dev-tools\bin\nvim_msvc.cmd"
  & $app_path $args
}
Function glog { git log --oneline --all --graph --decorate }
Function neofetch { winfetch }
