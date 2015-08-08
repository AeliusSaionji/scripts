curl -O https://bintray.com/veegee/generic/vim_x64
addr=$(sed -n 's/.*\(artifact.*exe\)"><span.*/\1/p' vim_x64)
curl -LO https://bintray.com/$addr
