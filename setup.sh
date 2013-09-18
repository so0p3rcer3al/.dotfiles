
for f in ~/.zshrc:zshrc \
	~/.bashrc:bashrc;
do LNK=${f%:*}; SRC=$(dirname "$0")/${f#*:};
	LPT=$(readlink "$LNK")
	SRC=$(readlink -f "$SRC")
	if [ "$LPT" != "$SRC" ]; then
		ln -si $SRC $LNK
		echo "+ create $LNK"
	else
		echo "* exists $LNK"
	fi
done
