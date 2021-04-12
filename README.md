# GenShell
Generates shell code from executable and alerts user of bad characters
## install
just chmod that shit
```
chmod +x GenShell.sh
```
## Use
just execute the file.
the only command line argument you need is the file you want to use it on
```
./GenShell hello-world
```
## Output
The output should tell you if there is'nt enough arguments like this
```
[-] Not enough arguments
```
or will tell you if there is bad characters and then highlight said bad characters
```
[-] Bad characters found: x00
[-] Bad characters found: x0a
[-] Bad characters found: xff
\xeb\x0c\x48\x65\x6c\x6c\x6f\x20\x57\x6f\x72\x6c\x64\x0a\xb8\x01\x00\x00\x00\x48\x31\xff\x48\x83\xc7\x01\x48\x8d\x35\xe1\xff\xff\xff\x48\x31\xd2\x48\x83\xc2\x0c\x0f\x05\x48\x31\xc0\x48\x83\xc0\x3c\x48\x31\xff\x0f\x05
```
(Obviously it is not highlighted here but in the terminal it should be)
