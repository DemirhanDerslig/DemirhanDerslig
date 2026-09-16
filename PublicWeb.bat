@echo off
chcp 65001 > nul

echo [1/4] Git deposu kontrol ediliyor ve baslatiliyor...
if not exist .git (
    git init
)
git branch -M main

echo [2/4] Eski LFS kalintilari temizleniyor...
del /f /q .gitattributes 2>nul
git rm --cached .gitattributes 2>nul

echo [3/4] Dosyalar eklenip kaydediliyor...
git add .
git commit -m "DemirhanDerslig guncellendi" 2>nul

echo [4/4] GitHub'a gonderiliyor (Push)...
git remote set-url origin https://github.com/DemirhanDerslig/DemirhanDerslig.git
git push -u origin main --force

echo --------------------------------------------------
echo Islem tamamlandi! Siteniz pırıl pırıl yüklendi.
pause