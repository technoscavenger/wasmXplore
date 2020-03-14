Pre-requesite:
* Install [MASM](http://www.masm32.com/)

Assemble the file
```shell
\masm32\bin\ml /c /Zd /coff int2string.asm
```

Link
```shell
\masm32\bin\Link /SUBSYSTEM:CONSOLE int2string.obj
```
