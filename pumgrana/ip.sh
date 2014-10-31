extern="163.5.84.222";
intern="10.224.9.222";
not_route=`echo "" | telnet "$extern" 2|& grep "No route to host"`;

if [ "$not_route" != "" ]; then
    echo "$intern";
else
    echo "$extern";
fi
