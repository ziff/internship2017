# ZIFF INTERNSHIP 2017

Welcome to ZIFF, Inc. Summer Internship 2017!

## Dependencies

Download and install the following:

  * [Docker Community Edition](https://www.docker.com/community-edition#/download)
  * Python 3.6.1
    * OSX: [brew](https://brew.sh/) install python3
    * Windows: [Python 3.6.1](https://www.python.org/downloads/)
  * git
    * OSX: either use system git or update with `brew install git`
    * Windows: [git](https://git-scm.com/)
  * git large file system
    * OSX: [git-lfs](https://git-lfs.github.com/)
    * Windows: [git-lfs](https://git-lfs.github.com/)
  
## Setup

### Clone this project:

    $ git clone git@github.com:ziff/internship2017.git

### Link notebooks directory

We recommend storing your personal notebooks in [Google Drive](https://www.google.com/drive/download/) 
or [Dropbox](https://www.dropbox.com/). Configure this by creating a place for notebooks and projects if you wish inside
your local sychronized storage directory. For example from OSX Terminal:

    $ cd ~/Google\ Drive/
    $ mkdir -p notebooks/internship2017
    
Because whitespace in a directory name or filename is a not supported in Docker volumes create a symlink for your 
Google Drive directory if you are using Google Drive. e.g. from your home directory:

    $ ln -s Google\ Drive gdrive # creates a symbolic link called 'gdrive'
    
Now from within this project create a symbolic link to for your notebooks directory or project directory inside this
repo and add it to the directory containing this repository. For example:

  * OSX: `ln -s ~/User/<user name>/<gdrive>/notebooks/internship2017 notebooks`
  * Windows: `mklink \D <C:/drive/notebooks/internship2017> notebooks`
  
### Configure .env

Make a copy of the `example.env` file named `.env` and update the environmental variable `GDRIVE_NOTEBOOKS_DIRECTORY`
with the full path to your local storage directory. I'm using Google Drive on OSX with a symlink to 'gdrive' so my entry
looks like this:
    
    GDRIVE_NOTEBOOKS_DIRECTORY=/Users/gonzo/gdrive/DesktopSync/notebooks/internship2017
  
### Start notebook server
 
    
    # start a notebook server in the background    
    $ docker-compose up -d 
   
    # get the link to your local notebook server
    $ docker-compose logs # e.g. http://0.0.0.0:8888/?token=3bd3dd53b2804cfc1ca4d18997f3eb7ab4906598a48f9df4
  
    # to exit from logs use 'ctl-c'
    $ docker-compose down # stop the notebook server
### For Windows Users Follow these steps

    # Download Google Drive on your desktop. Let it sync all the files. After it's done syncing do this:
    
    First,
    Create a symlink for Google Drive on you desktop
    mklink /D <Link> <Target>
    Here, Target is the folder that exists
    Example : mklink /D "C:/Users/thakk/gdrive" "C:/Users/thakk/Google Drive"
    
    Second,
    Create a symlink of the cloned repo with the folder in gdrive named "notebooks"
    Example: mklink /D "C:\Users\thakk\gdrive\notebooks" "E:\internship2017"
    
    Third,
    Now a file named 'example.env' is present. Considering the above example change it's content to 
    'GDRIVE_NOTEBOOKS_DIRECTORY=/Users/thakk/gdrive/notebooks/'
    After doing this rename 'example.env' to just '.env'
    
    Fourth,
    Just use docker-compose up -d
    
    You should be good to go!
    
