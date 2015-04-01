if [ "$0" == "./a1run.sh" ]
then
	if [ "$HOME/a1" == `pwd` ]
	then
		if [ -f a1file ]
		then
			if [ -w a1file ]
			then
				echo "a11file is writeable remove the write permissions and try again."
			else
				tr 'poiuytrewqlkjhgfdsamnbvcxz)(*&^%$#@!<[?W=+' 'qwertyuiopasdfghjklzxcvbnm1234567890/:.T, ' < a1file
			fi
		else
			echo "a1file does not exist. Create the file as per instructions to proceed."
		fi
	else
		echo "Not in correct directory. Create a directory called a1 inside your home directory and move the script there."
	fi
else
	echo "Change this script's name to a1run.sh"
fi
