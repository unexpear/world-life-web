# Quick edit -> push for World Life Web.
# Usage:   .\publish.ps1 "your commit message"
#          .\publish.ps1                 (uses a default message)
param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Message)

$msg = if ($Message) { $Message -join ' ' } else { "Update site" }

git add -A
if (git status --porcelain) {
    git commit -m $msg
    git push
    Write-Host "Pushed: $msg" -ForegroundColor Green
    Write-Host "Live in ~1 min -> https://unexpear.github.io/world-life-web/"
} else {
    Write-Host "Nothing to commit." -ForegroundColor Yellow
}
