
for f in ~/.zshrc:zshrc \
	~/.bashrc:bashrc \
	~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings:sublime3 \
	;
do
	# absolute paths of link and source
	lnk_path=${f%:*}
	src_path=$(readlink -f "$(dirname "$0")/${f#*:}")

	# if the file already already exists and is a symlink, read its location.
	# if it is not, this evaluates to ""
	cur_lnk=$(readlink "$lnk_path")

	if [ "$cur_lnk" != "$src_path" ]; then
		ln -si $src_path $lnk_path
		echo "+ create $lnk_path"
	else
		echo "*        $lnk_path"
	fi
done
