param(
    [Parameter(Mandatory=$true)] [string]$FilePath,
    [Parameter(Mandatory=$true)] [int]$StartLine,
    [Parameter(Mandatory=$true)] [int]$EndLine
)

# Read all lines preserving ordering
$lines = Get-Content -LiteralPath $FilePath -Encoding UTF8
$out = New-Object System.Collections.Generic.List[string]

for ($i = 0; $i -lt $lines.Count; $i++) {
    $lineNumber = $i + 1
    $out.Add($lines[$i])
    if ($lineNumber -ge $StartLine -and $lineNumber -le $EndLine) {
        $relative = $lineNumber - $StartLine + 1
        if ((($relative) % 4) -eq 0) {
            $out.Add("")
        }
    }
}

# Write back with UTF8 encoding
[System.IO.File]::WriteAllLines($FilePath, $out, [System.Text.Encoding]::UTF8)
Write-Output "Inserted blank lines after every 4th line between lines $StartLine and $EndLine in $FilePath."