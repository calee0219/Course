#!/bin/sh

init() {
	mkdir ${HOME}/.mybrowser
	mkdir ${HOME}/Downloads
	exec 2> ${HOME}/.mybrowser/error.log
	url="https://google.com"
}
error() {
	dialog \
		--title 'ERROR' \
		--msgbox "$(cat error.dio)" 16 51
}
testURL() {
	isURL=false
	tmp=$(echo $urlTmp | sed -e 's~http[s]*://~~' -e 's~ftp://~~')
	cnt=$(ping -c 1 "${tmp%%/*}" | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
	if [ $cnt -ne 0 ] ; then
		isURL=true
	fi
}
urlProcess() {
	url=$(echo $url | sed -e "s/\"//g" -e "s/\/[^\/]*\/\.\.//g" | awk ' \
		{
			if($0 ~ /^(https?|ftp):\/\//) print $0;
			else print "https://"$0;
		}
	' | awk ' \
		{
			if($0 ~ /\/$/) print $0;
			else print $0"/";
		}
	')
}
udProcess() {
	if [ "$(awk 'END{print}' prev)" != "$url" ] ; then
		echo $url >> prev
		rm next
	fi
}
errorPage() {
	dialog \
		--title "error page" \
		--msgbox "This is not a WebPage. Please select antoher link." 16 51
}
welcome() {
	dialog \
		--title 'dialog browser' \
		--yesno "$(cat welcome.dio)" 16 51
}
web() {
	urlProcess
	dialog \
		--title "dialog browser for $url" \
		--msgbox "$(w3m -dump $url)" 32 102
}
input() {
	dialog \
		--title 'input' \
		--cancel-label "Exit" \
		--inputbox "input URL or Command" 16 51 2> cmd-url
}
source() {
	dialog \
		--title 'source of the Web' \
		--msgbox "$(curl $url)" 32 102
}
getLink() {
	wget $url -O  lin
	cat lin | sed -e "s/</>/g" | awk ' \
		BEGIN { RS=">"; } \
		{
			if($1 == "a") { print $0; }
		}
	' | sed -e "s/^.*href=//" -e"s/^\"//" -e "s/^\///" -e "s/\".*$//" -e "s/\"//g" | awk -v pos="$url" ' \
		{
			if($0 == "/a");
			if($0 ~ /^(https?|ftp):\/\//) print $0;
			else if(pos ~ /^(https?|ftp):\/\//) print pos$0;
			else print "https://"pos$0;
		}
	' | awk ' \
		{
			if($0 ~ /\/$/) print "\""$0"\"";
			else print "\""$0"/\"";
		}
	' > linkTable
}
menuScript() {
	awk '{ printf NR"\ "$0"\ "; }' linkTable >> menu
	echo '2> selection' >> menu
	chmod +x menu
	./menu
}
link() {
	getLink
	if [ "$(cat linkTable)" == "" ] ; then
		dialog \
			--title "No Link" \
			--msgbox "$(cat noLink.dio)" 16 51
	else
		echo "dialog --backtitle \"Got Link\" --title \"Link under $url\"  --scrollbar --cancel-label \"Back\" --menu \"Select a link:\" 0 0 8 \\" > menu
		menuScript
		case $? in
			0) no=$(cat selection)
				udProcess
				url=$(awk -v no="$no" 'NR==no' linkTable)
				web;;
			1);;
			*) error;;
		esac
	fi
}
download() {
	getLink
	if [ "$(cat linkTable)" == "" ] ; then
		dialog \
			--title "No Link" \
			--msgbox "$(cat noLink.dio)" 16 51
	else
		echo "dialog --backtitle \"Download HTML\" --title \"Download Source Code from $url\"  --scrollbar --cancel-label \"Back\" --menu \"Select a link:\" 0 0 8 \\" > menu
		menuScript
		case $? in
			0) no=$(cat selection)
				urlProcess
				url=$(awk -v no="$no" 'NR==no' linkTable)
				name=$(echo $url | sed -e 's~http[s]*://~~' -e 's~ftp://~~' -e 's~/~.~g' -e 's~\"~~g')
				wget -O ${HOME}/Downloads/${name%.} $url
				chk=$(ls ~/Downloads/ | grep $name)
				if [ chk == "" ] ; then
					dialog \
						--title "Download" \
						--msgbox "$(cat downloadErr.dio)" 16 51
				else
					dialog \
						--title "Download" \
						--msgbox "$(cat downloadCrr.dio)" 16 51
				fi;;
			1) ;;
			*) error;;
		esac
	fi
}
deleteBookmark() {
	dialog \
		--backtitle "Delete Bookmark" \
		--title "Choose bookmark to delete" \
		--scrollbar \
		--cancel-label "Back" \
		--menu "Select a link:" 0 0 8 \
		$(awk '{ print NR,$0; }' bookmark.tab) \
		2> selection
	no=$(cat selection)
	del=$(awk -v no="$no" 'NR==no' bookmark.tab)
	awk -v url="$del" ' \
		{ if($0 !~ url) print $0; }
	' bookmark.tab > bookmark.tab
}
bookmark() {
	dialog \
		--backtitle "Book Mark" \
		--title "Choose bookmark or add one" \
		--scrollbar \
		--cancel-label "Back" \
		--menu "Select a link:" 0 0 8 \
		"1" "Add a bookmark" \
		"2" "Delete a bookmark" \
		$(awk '{ print NR+2,$0; }' bookmark.tab) \
		2> selection
	case $? in
		0) no=$(cat selection)
			case $no in
				1) awk -v url=$url ' \
					BEGIN { there=0; }
					{ if($0 == url) there=1; }
					END { if(there == 0) print url; }
				' bookmark.tab >> bookmark.tab;;
				2) deleteBookmark;;
				*)udProcess
					url=$(awk -v no="$no" 'NR==(no-2)' bookmark.tab)
					web;;
			esac;;
		1) ;;
		*) error;;
	esac
}
help() {
	dialog \
	   	--title 'help' \
		--msgbox "$(cat help.dio)" 32 102
}
prePage() {
	if [ "$(cat prev)" != "" ] ; then
		echo $url >> next
		url=$(tail -n1 prev)
		awk '{ if(NR > 1) print prev; prev=$0; }' prev >> pre
		cat pre > prev
		rm pre
		web
	else
		dialog \
			--title "No Previous Page" \
			--msgbox "There is no more previous Page" 16 51
	fi
}
nexPage() {
	if [ "$(cat next)" != "" ] ; then
		echo $url >> prev
		url=$(tail -n1 next)
		awk '{ if(NR > 1) print prev; prev=$0; }' next >> nex
		cat nex > next
		rm nex
		web
	else
		dialog \
			--title "No Next Page" \
			--msgbox "There is no more next Page" 16 51
	fi
}
shellCmd() {
	cat cmd-url | sed 's/^!//' > script
	chmod +x script
	./script > result
	dialog \
		--title "Shell Command" \
		--msgbox "$(cat result)" 16 51
	web
}
badCondition() {
	dialog \
		--title "Input \"$(cat cmd-url)\" error" \
		--msgbox "$(cat badCondition.dio)" 16 51
}
goodbye() {
	dialog \
	   	--title 'Good Bye' \
		--msgbox "$(cat bye.dio)" 16 51
}
end() {
	rm cmd-url
	rm selection
	rm lin linkTable
	rm menu
	rm prev next
	rm script result
}


init
welcome
if [ "$?" -eq 1 ] ; then
	dialog \
	   	--title 'Out of browser' \
		--msgbox "$(cat out.dio)" 16 51
else
	web
	while true; do
		input
		case $? in
			0) urlTmp=$(cat cmd-url)
				testURL
				if [ "$isURL" == true ] ; then
					udProcess
					url=$(cat cmd-url)
					web
				else
					case "$(cat cmd-url)" in
						\/S|\/s|\/source)	source;;
						\/L|\/l|\/link)		link;;
						\/D|\/d|\/download)	download;;
						\/B|\/b|\/bookmark)	bookmark;;
						\/H|\/h|\/help)		help;;
						\/Q|\/q|\/quit)		break;;
						\/P|\/p|\/previous)	prePage;;
						\/N|\/n|\/next)		nexPage;;
						!*) shellCmd;;
						*)					badCondition;;
					esac
				fi;;
			1) break;;
			*) error;;
		esac
	done
	goodbye
fi
end
