setopt prompt_subst

# Re-define 'precmd' function to catch the command line [RETURN] event.
precmd() {
	local _preverr=$? ## The return value of command when [RETURN] was pressed.
	local _usernamebutthefirstthreecharactersonly=$(LOGNAME | cut -c1-3)
	local _user=$(echo $_usernamebutthefirstthreecharactersonly | tr '[:lower:]' '[:upper:]')
	local _userclr=$(tput setaf 130)
	local _hostclr=$(tput setaf 33)
	local _pwdclr=$(tput setaf 40)
	local _timeclr=$(tput setaf 7)
	local _red=$(tput setaf 160)
	local _bold=$(tput bold)
	local _rst=$(tput sgr0)
	local _pwd=${PWD/$HOME/'~'}
	local _errclr=$_null
	local _errfont=$_null
	if [ $_preverr != 0 ]; then
		_errclr=$_red;
		_errfont=$_bold
	fi
	PS1="[%{$_userclr%}$_user%{$_rst%}@%{$_hostclr%}%m%{$_rst%}(%{$_pwdclr%}%1~%{$_rst%})%{$_timeclr%}%T%{$_rst%}]%{$_errclr%}%{$_errfont%}%?%{$_rst%}$ "
}
