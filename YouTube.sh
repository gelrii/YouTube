#!/bin/bash

#######                  #######
#####     Dependencies     #####
#######                  #######

#  youtube-dl
#  aria2c

#######                       #######
#####     Download Location     #####
#######                       #######

LOCATION=$HOME/Videos/YouTube/%\(uploader\)s/%\(upload_date\)s_%\(title\)s.%\(ext\)s   # location used for youtube-dl
LOCATE=$HOME/Videos/YouTube/\(uploader\)/                                              # location told to user via echo

#######                                    #######
#####     Usefull youtube-dl ammendments     #####
#######                                    #######

# --skip-download == skips download
# -s == simulate
# --playlist-start NUMBER == defines start of selection
# --playlist-end NUMBER == defines end of selection
# --playlist-items ITEM_SPEC == specifies individual item in playlist
# --no-playlist == does not download playlist if URL contains playlist
# --yes-playlist == does download playlist if URL contains playlist
# -f best == downloads the best quality video and audio  
# --external-downloader == selects a seperate program to download file

#######                                                                       #######
#####                             Sections of the script                        #####
#####     (each section must be placed before a section which refers to it)     #####
#######                                                                       #######

TOP() {
clear
echo "################################################################################"
echo "#                                                                              #"
}

BOTTOM() {
echo "#                                                                              #"
echo "################################################################################"
}

BOTTOM_URL() {
BOTTOM
echo ""
echo "URL : $URL"
echo ""
}

DOWNLOADING() {
TOP
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                Downloading...                                #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
BOTTOM_URL
}

COMPLETE() {
TOP
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                  Complete!                                   #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
BOTTOM
echo ""
echo "Download location = $LOCATE"
echo ""
exit
}

Selection() {
TOP
echo "#                                                                              #"
echo "#                                                                              #"
echo "#           Please enter the number of the start of the selection.             #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
BOTTOM_URL
echo ""
echo -n "> "
read START
TOP
echo "#                                                                              #"
echo "#                                                                              #"
echo "#             Please enter the number of the end of the selection.             #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
BOTTOM_URL
echo "Start = $START"
echo -n "> "
read END
DOWNLOADING
echo "Start = $START"
echo "End = $END"
echo ""
echo "Download location = $LOCATE"
echo ""
youtube-dl -f bestvideo[ext=mp4]+bestaudio --external-downloader aria2c --yes-playlist --playlist-start $START --playlist-end $END -o "$LOCATION" $URL
COMPLETE
}

Whole() {
DOWNLOADING
echo "Download location = $LOCATE"
echo ""
youtube-dl -f bestvideo[ext=mp4]+bestaudio --external-downloader aria2c --yes-playlist -o "$LOCATION" $URL
COMPLETE
}

Playlist() {
TOP
echo "#                   You have chosen to download a playlist.                    #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                       Enter the URL of the playlist.                         #"
echo "#                          (( use Ctrl+Shift+V ))                              #"
BOTTOM
echo ""
echo ""
echo ""
echo ""
echo -n "> "
read URL
TOP
echo "#                Do you wish to download a selection of videos                 #"
echo "#                           or the whole playlist?                             #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                          [S]election  /  [W]hole                             #"
echo "#                                                                              #"
BOTTOM_URL
echo ""
echo -n "> "
read opt
case $opt in
	[Ss]* )
	Selection
	;;
	[Ww]* )
	Whole
	;;
esac
}

Single() {
TOP
echo "#                 You have chosen to download a single video.                  #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                         Enter the URL of the video.                          #"
echo "#                          (( use Ctrl+Shift+V ))                              #"
BOTTOM
echo ""
echo ""
echo ""
echo -n "> "
read URL
clear
DOWNLOADING
echo "Download location = $LOCATE"
echo ""
youtube-dl -f bestvideo[ext=mp4]+bestaudio --external-downloader aria2c --no-playlist -o "$LOCATION" $URL
COMPLETE
}

Main() {
TOP
echo "#                                                                              #"
echo "#             Do you want to download a playlist or a single video?            #"
echo "#                                                                              #"
echo "#                                                                              #"
echo "#                            [P]laylist  /  [S]ingle                           #"
echo "#                                                                              #"
BOTTOM
echo ""
echo ""
echo ""
echo -n "> "
read opt
case $opt in
	[Pp]* ) 
	Playlist
	;;
	[Ss]* )
	Single
	;;
esac
}

#######                #######
#####     Run Script     #####
#######                #######

Main
