# 使用utf8编码
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# 使用starship时自定义的头
function Invoke-Starship-TransientFunction
{
  &starship module character
}
# 使用starship主题
Invoke-Expression (&starship init powershell)
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\tokyo.omp.json" | Invoke-Expression
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete #Tab键会出现自动补全菜单
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
# 上下方向键箭头，搜索历史中进行自动补全
Import-Module posh-git # git的自动补全
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Import-Module PSFzf
Import-Module z
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PsFzfOption -PSReadLineChordProvider  'Ctrl+f' -PSReadLineChordReverseHistory  'Ctrl+r'
# fzf的主题
$ENV:FZF_DEFAULT_OPTS=@"
--layout=reverse
--preview 'bat --style=numbers --color=always --line-range :500 {}'
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
"@
Set-Alias touch New-Item
Set-Alias ll ls
Set-Alias n nvim
