#todo- download to downloads folder?
$webclient = New-Object System.Net.WebClient
Write-Host "Downloading and installing cygwin..."
$webclient.DownloadFile( "https://cygwin.com/setup-x86_64.exe", "$Env:TEMP\setup-x86_64.exe" )
Start-Process "$Env:TEMP\setup-x86_64.exe" "--no-admin --quiet-mode -g -d -o -l c:\cygwin64\tmp -P irssi,curl,rsync,perl-Text-CharWidth,perl-Algorithm-Diff -s http://mirrors.kernel.org/sourceware/cygwin/"
pause
