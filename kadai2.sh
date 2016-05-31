##################################################
#
# 14745205 Hiroko Nagashima
#
# the advanced system software course
# kadai2 : calculate the greatest common divisor    
#
################################################# 
#!/bin/bash

# check the number of parameters
PARAMVAL=$#
if [ $PARAMVAL -ne "2" ]; then
	echo "mismatch the number of parameter. need 2 parameters."
	exit -1
fi

# check the range of parameters
if [ $1 -le "0" ]; then
	echo "invalid parameter. ( $1 is NOT positive integer )"
	exit -1
fi
if [ $2 -le "0" ]; then
	echo "invalid parameter. ( $2 is NOT positive integer )"
	exit -1
fi

# prepare
if [ $1 -eq $2 ]; then
	echo "greatest common divisor( $1 and $2 ) = $1"
	exit 0

elif [ $1 -lt $2 ]; then
	COMDIV=$2
	VAL1=$1
	VAL2=$2
else
	COMDIV=$1
	VAL1=$2
	VAL2=$1
fi

# search
while [ "0" -lt $COMDIV ]
do
	MOD=`expr $VAL1 % $COMDIV`
	if [ $MOD -eq "0" ]; then
		MOD=`expr $VAL2 % $COMDIV`
		if [ $MOD -eq "0" ]; then
			# find!
			echo "greatest common divisor( $1 and $2 ) = $COMDIV"
			exit 0
		fi
	fi
	COMDIV=`expr $COMDIV - 1`
done

# not find 
echo "greatest common divisor( $1 and $2 ) = 1"
exit 0

 
