file.ll: file.stm
	python3.6 final.py file.stm

.PHONY: lli

lli: file.ll
	lli file.ll

file.s: file.ll
	llc file.ll -o file.s

file.sh: file.s
	clang file.s -o file.sh

all: file.sh
	./file.sh

.PHONY: clean

clean: 
	rm file.sh file.s file.ll