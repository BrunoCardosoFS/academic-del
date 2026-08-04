# =============================================================================
# Script de Build para Windows (PowerShell)
# =============================================================================

$ErrorActionPreference = "Stop"

# Determina o diretório raiz do projeto (dois níveis acima da pasta .github/Scripts)
$ScriptDir = $PSScriptRoot
$ProjectRoot = (Get-Item $ScriptDir).Parent.Parent.FullName

Write-Host "-> Diretório do projeto: $ProjectRoot" -ForegroundColor Cyan

# 1. Verificar/Criar/Limpar pasta release
$ReleaseDir = Join-Path $ProjectRoot "release"
if (Test-Path -Path $ReleaseDir) {
    Write-Host "-> Limpando pasta release..." -ForegroundColor Yellow
    Get-ChildItem -Path $ReleaseDir -Recurse | Remove-Item -Recurse -Force
}
else {
    Write-Host "-> Criando pasta release..." -ForegroundColor Green
    New-Item -ItemType Directory -Path $ReleaseDir | Out-Null
}

# 2. Copiar pasta academic-del, main.typ e referencias.bib para release
$SrcDir = Join-Path $ProjectRoot "src"
Write-Host "-> Copiando arquivos de src/ para a pasta release..." -ForegroundColor Green
Copy-Item -Path (Join-Path $SrcDir "academic-del") -Destination (Join-Path $ReleaseDir "academic-del") -Recurse -Force
Copy-Item -Path (Join-Path $SrcDir "main.typ") -Destination (Join-Path $ReleaseDir "main.typ") -Force
Copy-Item -Path (Join-Path $SrcDir "referencias.bib") -Destination (Join-Path $ReleaseDir "referencias.bib") -Force

# 3. Apagar tutorial.pdf e gerar novamente com typst
$TutorialPdf = Join-Path $ReleaseDir "academic-del\tutorial\tutorial.pdf"
# $TutorialTyp = Join-Path $ReleaseDir "academic-del\tutorial\tutorial.typ"
# $FontsDir = Join-Path $ReleaseDir "academic-del\medias\fonts"
# $AcademicDelDir = Join-Path $ReleaseDir "academic-del"

if (Test-Path -Path $TutorialPdf) {
    Write-Host "-> Removendo tutorial.pdf antigo..." -ForegroundColor Yellow
    Remove-Item -Path $TutorialPdf -Force
}

# Write-Host "-> Recompilando tutorial.pdf com Typst..." -ForegroundColor Green
# typst compile --root $AcademicDelDir --font-path $FontsDir $TutorialTyp $TutorialPdf

# if (-not (Test-Path -Path $TutorialPdf)) {
#     throw "Falha ao gerar o tutorial.pdf com Typst."
# }

# 4. Gerar zip academic-del.zip com todos os arquivos da pasta release
$ZipPath = Join-Path $ProjectRoot "academic-del.zip"
if (Test-Path -Path $ZipPath) {
    Remove-Item -Path $ZipPath -Force
}

Write-Host "-> Compactando pasta release em academic-del.zip..." -ForegroundColor Green
Compress-Archive -Path "$ReleaseDir\*" -DestinationPath $ZipPath -Force

Write-Host "`n[SUCESSO] Build concluído com sucesso! O arquivo zip foi gerado em: $ZipPath" -ForegroundColor Green
