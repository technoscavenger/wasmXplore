Pre-requesite:
* Install [MASM](http://www.masm32.com/)

Assemble the file
```shell
\masm32\bin\ml /c /Zd /coff int2string2.asm
```

Link
```shell
\masm32\bin\Link /SUBSYSTEM:CONSOLE int2string2.obj
```
