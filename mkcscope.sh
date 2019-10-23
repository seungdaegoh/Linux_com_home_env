#!/bin/bash

#this is cscope index build script
# created by [jongho3.lee@lge.com] 2010.04.17
# modified by seungdae.goh@lge.com
#############variables###########################

CUR_DIR=`pwd`

CSCOPE_FILES=cscope.files
CSCOPE_OUT=cscope.out
TAGS_OUT=tags


if [ -n "$1" ]; then
ADD_PRE_DIR=""
else
ADD_PRE_DIR="$CUR_DIR"
fi

echo "remove cscope file"
rm ${CSCOPE_FILES}
echo "make cscope file"

echo [$1] $2 $3

if [ "$1" = "-k" ]; then
LNX="$2"
echo kernel [$LNX] files lookup
if [ -d $LNX ]; then


echo "kernel file including"
echo "..."
find  $LNX                                                                \
	-path "$LNX/arch/*" ! -path "$LNX/arch/arm64*" -prune -o               \
	-path "$LNX/tmp*" -prune -o                                           \
	-path "$LNX/Documentation*" -prune -o                                 \
	-path "$LNX/scripts*" -prune -o                                       \
        -name "*.[chxsS]" -print > ${CSCOPE_FILES}

#find  $LNX                                                                \
#	-path "$LNX/arch/*" ! -path "$LNX/arch/arm*" -prune -o               \
#	-path "$LNX/tmp*" -prune -o                                           \
#	-path "$LNX/Documentation*" -prune -o                                 \
#	-path "$LNX/scripts*" -prune -o                                       \
#	-path "$LNX/drivers*" -prune -o                                       \
#        -name "*.[chxsS]" -print > ${CSCOPE_FILES}

echo "done"

shift
shift

fi
fi


if [ -n "$1" ]; then
ADD_DIR=""
else
ADD_DIR="$CUR_DIR"
fi

if [ "$ADD_PRE_DIR" == "$ADD_DIR" ]; then

echo " "
echo "param [$*] add [$ADD_DIR] "
echo "################################### "
echo "indexing $@ $ADD_DIR cscope.files "
find $ADD_DIR $@ -type f \(  -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.h' -o -iname '*.hpp' -o -iname '*.asm' -o -iname '*.go' -o -iname '*.py'   -o -iname '*.java' -o -iname '*.jni' -o -iname '*.mk' -o -iname '*.xml' -o -iname '*.aidl' -o -iname '*.s' -o -iname '*.S' -o -iname '*.rc' -o -iname '*defconfig' -o -iname '*.dts' -o -iname '*.dtsi' -o -iname '*.config' -o -iname 'Makefile' -o -iname 'Kconfig' -o -iname '*.sh' -o -iname '*.conf' -o -iname '*.inc' -o -iname 'bbclass' -o -iname '*.bb' -o -iname '*.bbappend' \) \
	-print >> ${CSCOPE_FILES}
fi


echo " "
echo "################################### "
echo "building cscope.out ...."
#make cscope ARCH=arm
cscope -b -q -k -i ${CSCOPE_FILES} -f ${CSCOPE_OUT}

#echo " "
echo "################################### "
echo "building ctags ...."
ctags -L ${CSCOPE_FILES} -f ${TAGS_OUT}





