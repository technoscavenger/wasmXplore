Pre-requesite:
* Install [MASM](http://www.masm32.com/)

Assemble the file
```shell
\masm32\bin\ml /c /Zd /coff hellow.asm
```

Link
```shell
\masm32\bin\Link /SUBSYSTEM:WINDOWS hellow.obj
```
