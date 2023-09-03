.PHONY:main
main:
	gcc -o main -lprofiler main.c
	# clang -o main main.c
prof:
	LD_PRELOAD=$(brew --prefix)/lib/libprofiler.dylib CPUPROFILE=test.prof ./main
visualize:
  # This is pprof built in my local machine.
	# /Users/daiki-kudo/repos/gperftools/src/pprof --gv main test.prof --lib_prefix /usr/local/opt/llvm/lib/c++
	# This is pprof installed by `brew install graphviz`
	pprof --gv main test.prof --lib_prefix /usr/local/opt/llvm/lib/c++

	# ⏫ This failed with:
	# error: /Library/Developer/CommandLineTools/usr/bin/otool-classic: can't open file: /usr/lib/liboah.dylib (No such file or directory)
	# error: /Library/Developer/CommandLineTools/usr/bin/otool-classic: can't open file: /usr/lib/liboah.dylib (No such file or directory)
	# error: /Library/Developer/CommandLineTools/usr/bin/otool-classic: can't open file: /usr/lib/liboah.dylib (No such file or directory)
	# error: /Library/Developer/CommandLineTools/usr/bin/otool-classic: can't open file: /usr/lib/liboah.dylib (No such file or directory)
	# error: /Library/Developer/CommandLineTools/usr/bin/otool-classic: can't open file: /usr/lib/libobjc.A.dylib (No such file or directory)
