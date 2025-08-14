rd /s /q "C:\Users\RubenPC\.dotfiles\"
mkdir "C:\Users\RubenPC\.dotfiles\"
xcopy /e /k /h /i /y * "C:\Users\RubenPC\.dotfiles\" 

xcopy /e /k /h /i /y "C:\Users\RubenPC\.dotfiles\inputleap\start-inputleap-server.bat" "C:\Users\RubenPC\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"