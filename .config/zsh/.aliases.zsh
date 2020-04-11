back() {
	local string=""
	for i in {1..$1}
		string+=$(printf "../")
	cd $string
}
