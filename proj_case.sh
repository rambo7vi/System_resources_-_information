#!/bin/bash

while [ $# -gt 0 ]
do
        case "$1" in
                "-h" | "--help"  )
                        echo Usage: $0 [Options...]
                        echo Options:
                        echo -e "\t"    "-c , --cpuinfo"
                        echo -e "\t" "\t" "\t" "Get CPU information"

                        echo -e "\t" "-k , --kernal-info "
                        echo -e "\t" "\t" "\t" "Get Kernal Information"

                        echo -e "\t" "-s , --sysinfo "
                        echo -e "\t" "\t" "\t" "Get System Information"

                        echo -e "\t" "-fm , --free-mem "
                        echo -e "\t" "\t" "\t" "Get Free Space information"

                        echo -e "\t" "-ip , --ipaddr "
                        echo -e "\t" "\t" "\t" "Get IP Address"

                        echo "Created by Shell"
                        exit 1
                        ;;

                "-c" | "--cpuinfo" )
                        CPU=`cat /proc/cpuinfo | grep "model name" | uniq |>                        echo CPU INFO: $CPU
                        echo
                        shift
                        ;;

                "-k" | "--kernal-info" )
                        echo KERNAL VERSION:`uname -r`
			echo
                        shift
                        ;;

                "-s" | "--sysinfo" )
                        SYSINFO=`cat /etc/os-release | grep PRETTY| cut -c >                        echo  SYSTEM VERSION:$SYSINFO
                        echo
                        shift
                        ;;
                "-fm"|"--freemem" )
                        MEMORY=`free -m| grep "Mem" | awk '{print $4}'`
                        echo FREE DISK SPACE: $MEMORY Mb
                        echo
                        shift
                        ;;
                "-ip"|"--ipaddr" )
                        echo IP ADDRESS:`hostname -I`
                        echo
                        shift
                        ;;

        esac
done