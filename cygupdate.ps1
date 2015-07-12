Write-Host "Downloading and installing cygwin..."
Invoke-WebRequest -UseBasicParsing -Uri "https://cygwin.com/setup-x86_64.exe" -OutFile "$Env:Downloads\setup-x86_64.exe"
Start-Process "$Env:Downloads\setup-x86_64.exe" "--no-admin --quiet-mode -g -d -o -l c:\cygwin64\tmp -P irssi,curl,rsync,perl-Text-CharWidth,perl-Algorithm-Diff -s http://mirrors.kernel.org/sourceware/cygwin/"
pause
