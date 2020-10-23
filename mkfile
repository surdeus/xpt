<mkconfig
HDR = `{ ls *.h }
SRC = `{ ls *.c }
OBJ = ${SRC:%.c=%.o}
TGT = $NAME
all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD -o $target $LDFLAGS $prereq
%.o : %.c
	$CC -c -o $target $CFLAGS $prereq
%.c :Q: $HDR
	touch $target
%.h :Q:
	touch $target
install : $TGT
	mkdir -p $BIN $MAN/1
	cp -f $TGT $BIN
	chmod 0755 $BIN/$TGT
	cp -f man $MAN/1/$NAME
	chmod 0644 $MAN/1/$NAME
uninstall: 
	rm -rf $BIN/$TGT
clean:
	rm -rf $TGT *.o 
