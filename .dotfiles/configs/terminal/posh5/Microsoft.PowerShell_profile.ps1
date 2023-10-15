oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/bubblesextra.omp.json" | Invoke-Expression

Import-Module PSReadline
Import-Module Terminal-Icons
Import-Module PSFzf
Import-Module Posh-git

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f'
Set-PsFzfOption -PSReadLineChordReverseHistory 'Ctrl+r'