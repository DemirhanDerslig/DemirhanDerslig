@echo off
chcp 65001 > nul

echo [1/4] Git deposu ayarlaniyor ve GitHub adresi baglaniyor...
if not exist .git (
    git init
)
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/DemirhanDerslig/DemirhanDerslig.git

echo [2/4] Eski LFS kalintilari temizleniyor...
del /f /q .gitattributes 2>nul
git rm --cached .gitattributes 2>nul

echo [3/4] Dosyalar eklenip kaydediliyor...
git add .
git commit -m "DemirhanDerslig guncellendi" 2>nul

echo [4/4] GitHub'a gonderiliyor (Push)...
git push -u origin main --force

echo --------------------------------------------------
echo Islem tamamlandi! Siteniz pırıl pırıl yüklendi.
pause