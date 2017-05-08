#!/bin/sh

ls -AlRSF | sort -n -r -k 5| awk 'BEGIN{val=0;fil=0;dir=0;cnt=1;}
{
	if(cnt <= 5){
		print cnt ": " $5 " " $9 " "; cnt++;
	}
	if($5 != ""){
		if($1 ~ /dw*/) {
			dir++;
		} else if($1 !~ /lw*/) {
			val=val+$5;
			fil++;
		}
	}
}
END{print "Dir num: " dir "\nFile num: " fil "\nTotal: " val;}'
