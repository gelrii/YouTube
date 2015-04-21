#!/bin/bash

# --skip-download == skips download
# -s == simulate
# --playlist-start NUMBER == defines start of selection
# --playlist-end NUMBER == defines end of selection
# --playlist-items ITEM_SPEC == specifies individual item in playlist
# --no-playlist == does not download playlist if URL contains playlist
# --yes-playlist == does download playlist if URL contains playlist
# -f best == downloads the best quality video and audio

user=`whoami`

clear
echo "################################################################################"
echo "#                                                                              #"
echo "#          Do you want to download a playlist or a single video?               #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                         [P]laylist  /  [S]ingle                              #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "################################################################################"
echo ""
echo ""
echo ""
echo ""
echo -n "> "
read opt
case $opt in
	[Pp]* ) clear
	echo "################################################################################"
	echo "#                                                                              #"
	echo "#                   You have chosen to download a playlist.                    #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                       Enter the URL of the playlist.                         #"
	echo "#                          (( use Ctrl+Shift+V ))                              #"
	echo "#                                                                              #"
	echo "################################################################################"
	echo ""
	echo ""
	echo ""
	echo ""
	echo -n "> "
	read URL
	clear
	echo "################################################################################"
	echo "#                                                                              #"
	echo "#                Do you wish to download a selection of videos                 #"
	echo "#                           or the whole playlist?                             #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                          [S]election  /  [W]hole                             #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "################################################################################"
	echo ""
	echo "URL : $URL"
	echo ""
	echo ""
	echo -n "> "
	read opt
	case $opt in
		[Ss]* )clear
		echo "################################################################################"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#           Please enter the number of the start of the selection.             #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "################################################################################"
		echo ""
		echo "URL : $URL"
		echo ""
		echo ""
		echo -n "> "
		read START
		clear
		echo "################################################################################"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#             Please enter the number of the end of the selection.             #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "################################################################################"
		echo ""
		echo "URL : $URL"
		echo ""
		echo "Start = $START"
		echo -n "> "
		read END
		echo ""
		echo "Running script : youtube-dl -f best --yes-playlist --playlist-start $START --playlist-end $END -o \"/home/$user/Videos/YouTube/%(uploader)s/%(title)s-%(id)s.%(ext)s\" $URL"
		echo ""
		youtube-dl -f best --yes-playlist --playlist-start $START --playlist-end $END -o "/home/$user/Videos/YouTube/%(uploader)s/%(title)s-%(id)s.%(ext)s" $URL
		echo ""
		echo "################################################################################"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                  Complete!                                   #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "################################################################################"
		exit
		;;
		[Ww]* )
		echo ""
		echo "Running script : youtube-dl -f best --yes-playlist -o \"/home/$user/Videos/YouTube/%(uploader)s/%(title)s-%(id)s.%(ext)s\" $URL"
		echo ""
		youtube-dl -f best --yes-playlist -o "/home/$user/Videos/YouTube/%(uploader)s/%(title)s-%(id)s.%(ext)s" $URL
		echo ""
		echo "################################################################################"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                  Complete!                                   #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "#                                                                              #"
		echo "################################################################################"
		exit
		;;
	esac
	;;
	[Ss]* )clear
	echo "################################################################################"
	echo "#                                                                              #"
	echo "#                 You have chosen to download a single video.                  #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                         Enter the URL of the video.                          #"
	echo "#                          (( use Ctrl+Shift+V ))                              #"
	echo "#                                                                              #"
	echo "################################################################################"
	echo ""
	echo ""
	echo ""
	echo -n "> "
	read URL
	echo ""
	echo "Running script : youtube-dl -f best --no-playlist -o \"/home/$user/Videos/YouTube/%(uploader)s/%(title)s-%(id)s.%(ext)s\" $URL"
	echo ""
	youtube-dl -f best --no-playlist -o "/home/$user/Videos/YouTube/%(uploader)s/%(title)s-%(id)s.%(ext)s" $URL
	echo ""
	echo "################################################################################"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                                  Complete!                                   #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "#                                                                              #"
	echo "################################################################################"
	exit
	;;
esac
