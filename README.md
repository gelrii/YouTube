# YouTube

A simple user interface for youtube-dl created in bash.

You can run this script quickly with the following command:
<pre>curl -fsSL https://raw.githubusercontent.com/gelrii/YouTube/master/YouTube.sh -o /tmp/YouTube.sh && sh /tmp/YouTube.sh</pre>

The above command uses curl, paste this into a terminal to execute it.

This script will download the video(s) into /home/user/Videos/uploader/ using the default file name for youtube-dl. It will also attempt to download the best video and audio qualities for the video(s). If you wish to change the default download location it is easy to do so by editing the relevant section of the script

Requires both youtube-dl and aria2c to use, these can be installed using:
<pre>sudo yum install youtube-dl aria2</pre>
