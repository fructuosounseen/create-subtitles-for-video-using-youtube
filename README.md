# create-subtitles-for-video-using-youtube
Create subtitles for video using YouTube

- [DESCRIPTION](#description)
- [INSTALLATION](#installation)
- [AUTHENTICATE WITH GOOGLE](#authenticate_with_google)
- [IOERROR YT_DEVKEY](#ioerror_yt_devkey)
- [DOWNLOAD THE SCRIPTS AND USE](#download_the_scripts_and_use)
- [DESCRIPTION THIS SCRIPTS](#description_this_scripts)

# DESCRIPTION

Small command-line program to upload video on YouTube, download subtitles creating YouTube, prepare text for translate.
Need install googlecl, youtube-dl.

# INSTALLATION

Googlecl should be higher revision r635.
At this moment in Ubuntu 14.10 older version, so download from the SVN repository.

Install the required packages

    sudo apt-get install youtube-dl git subversion python-gdata

Install GoogleCL

    svn checkout http://googlecl.googlecode.com/svn/trunk/ googlecl-read-only
    cd googlecl-read-only
    sudo python setup.py install

# AUTHENTICATE_WITH_GOOGLE

First, you need to authenticate with google. Try to upload one video

    google youtube post --category Education --access unlisted video.mp4

Opens the console window of the browser, you need to enter the login/password from your Google username.
Then you need to close the window - There will be written, you must copy the link and paste in your browser.

# IOERROR_YT_DEVKEY

 If this or a similar error:

    IOError: [Errno 2] No such file or directory: '/home/user/.local/share/googlecl/yt_devkey'

Follow:

    sudo mkdir -p ~/.local/share/googlecl

# DOWNLOAD_THE_SCRIPTS_AND_USE
    git clone https://github.com/fructuosounseen/create-subtitles-for-video-using-youtube.git

    In current directory with video start script upload.video.sh

    At next day in current directory with video start script get.srt.from.youtube.sh

    Move good subtitles to directory good.subtitles - script move.good.subtitles.sh

    Extract text from subtitles - script get.txt.from.srt.sh
    The result is one long string without punctuation. You must place the punctuation marks.

    Write punctuation in srt files. Text from txt files help you to make punctuation.

    The script will put each sentence on a separate line.

    Translate text to your language. Save the translated text in name.video.you-lang.txt
    
    Combine both texts in one script - paste.srt.sh

    As a result, after each English strings will be translated strings.
    
    Copy files lang.txt so you can process them separately, to send to others for review - script copy.lang.txt.sh 
    
    Check the translation

# DESCRIPTION_THIS_SCRIPTS

upload.video.sh

    The script looks in the current directory with the script files with the extension mp4 and consistently to each file applies the command to upload videos on YouTube.
    Change extension video at scripts. Current extension is mp4.

get.srt.from.youtube.sh

    google youtube list - shows a list of videos on your channel.
    google youtube list > info.youtube.txt - redirects the output info.youtube.txt.
    Sleep is inserted, because Youtube is blocking requests are too frequent.
    Next cut divides the text into 2 parts, using the delimiter is a comma, and the second part redirects to a file info.current.video.txt.
    The script reads info.current.video.txt and sequentially to each row applies the command. Youtube-dl in this command downloads the subtitles.

get.txt.from.srt.sh

    A script that looks in the current directory with the script files with the extension srt and consistently to each file uses the command. 
    The team there is a long and includes other commands.
    The main task of this script is reading the subtitles, and reformatted in the form of saving in a simple text file.
    THE RESULT IS ONE LONG STRING WITHOUT PUNCTUATION. YOU MUST PLACE THE PUNCTUATION MARKS. THIS MUST BE DONE IN MANUAL MODE.

move.good.subtitles.sh

    The script creates a folder good.subtitles, reads log.download.txt.
    Searches for lines containing the string Writing, forwards the matching string good.video.txt.
    Reads good.video.txt extracts from 6 column, and redirects it to the good.subtitles.txt.
    The cycle passes successively through all the rows in good.subtitles.txt and moves all files with the same name in the folder good.subtitles.

paste.srt.sh

After each line of the script adds a row with the same sequence number from another file.

Suppose there are two files: 1 and 2.
The first file:

    1st line of the 1st file
    2nd line of the 1st file

The Second file:

    1st line 2nd file
    2nd line of the 2nd file

The result:

    1st line of the 1st file
    1st line 2nd file

    2nd line of the 1st file
    2nd line of the 2nd file

copy.lang.txt.sh

    Copy files lang.txt so you can process them separately, to send to others for review
