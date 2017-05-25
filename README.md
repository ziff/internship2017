# ZIFF INTERNSHIP 2017

Welcome to ZIFF, Inc. Summer Internship 2017!

## Challenge submission

To submit a solution or effort for a challenge task fork this project and create a 
[pull request](https://help.github.com/articles/creating-a-pull-request/) following the pull request template found in 
`pr-template.md`.

## What about XYZ library?

If you would like to add libraries to the `notebook-server` you can do so by creating one or two files:

To add files with `conda`:
  
  1. Make a file named `./docker/my-environment.yml`
  1. Add something like the following:
  
    # my-environment.yml
    name: root
    channels:
        - conda-forge
        - defaults
    dependencies:
        - my-favorite-library=1.0.0
        
To add files with `pip`:

  1. Make a file named `./docker/my-requirements.txt`
  1. Add something like the following:
  
    # my-requirements.txt
    my-favorite-library

## Dependencies

Download and install the following:

  * Docker
    * Mac or Windows Pro: [Docker Community Edition](https://www.docker.com/community-edition#/download)
    * Windows Home Edition: [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
  * Python 3.6.1
    * OSX: [brew](https://brew.sh/) install python3
    * Windows: [Python 3.6.1](https://www.python.org/downloads/)
  * git
    * OSX: either use system git or update with `brew install git`
    * Windows: [git](https://git-scm.com/)
  * git large file system
    * OSX: [git-lfs](https://git-lfs.github.com/)
    * Windows: [git-lfs](https://git-lfs.github.com/)
  * [Google Drive](https://www.google.com/drive/download/)
    * You can sync all of your Google Drive or just create a "MyNotebooks" folder and sync only that when you setup Google Drive
  
## Setup

### Clone this project:

    $ git clone https://github.com/ziff/internship2017.git

### Setup Google Drive

We recommend storing your personal notebooks in [Google Drive](https://www.google.com/drive/download/) 
or [Dropbox](https://www.dropbox.com/). Configure this by creating a place for notebooks and if you like project subdirectories.

Because whitespace in a directory name or filename is a not supported in Docker volumes create a symlink for your 
Google Drive directory if you are using Google Drive. e.g. from your home directory:

OSX or Windows [git bash or Docker Quickstart Terminal] or Linux:

    $ ln -s Google\ Drive gdrive # creates a symbolic link called 'gdrive'

Windows Pro or Home Edition [CMD as administrator]:

    C:\Users\gonzo>mklink /D "C:\Users\<username>\gdrive" "C:\<username>\Google Drive"

Finally, create a directory or project directory in your Google Drive for your notebooks. For example you could make a directory

### Link notebooks directory

Now from this project directory:

OSX or Windows [git bash or Docker Quickstart Terminal] or Linux:

    $ cd internship2017
    $ ln -s /Users/gonzo/gdrive/MyNotebooks/internship2017 notebooks # this will create a link called notebooks in your project directory

Windows Pro or Home Edition [CMD as administrator]:

    C:\Users\gonzo\Projects\internship2017>mklink /D notebooks "C:\Users\gonzo\Google Drive\MyNotebooks\intership2017"
    
### Configure .env

Make a copy of the `example.env` file and rename the copy `.env` and update the environmental variable `GDRIVE_NOTEBOOKS_DIRECTORY`
with the full path to your local storage directory. I'm using Google Drive on OSX with a symlink to 'gdrive' so my entry
looks like this:

OSX or Linux:
    
    GDRIVE_NOTEBOOKS_DIRECTORY=/Users/gonzo/gdrive/MyNotebooks/internship2017

Windows Home Edition:

    GDRIVE_NOTEBOOKS_DIRECTORY=/c/Users/gonzo/gdrive/MyNotebooks/internship2017

Windows Pro:

  * If you are running Windows Pro with Docker CE native then you can configure natural Windows [paths](https://rominirani.com/docker-on-windows-mounting-host-directories-d96f3f056a2c)

You need to do this so that Docker can find your notebooks directory. It will not work if you try and point Docker to your local symbolic link.
  
## Start notebook server
 
    # start a notebook server in the background    
    $ docker-compose up -d 
   
    # get the link to your local notebook server
    # if you are using Windows HE make sure to get the correct IP addres
    $ docker-compose logs # e.g. http://0.0.0.0:8888/?token=3bd3dd53b2804cfc1ca4d18997f3eb7ab4906598a48f9df4
    
    # if you are using Windows HE then docker creates an isolated virtual machine using 'docker-machine' 
    # this means you need to find out the IP address of that isolated virtual machine and you can do that with
    # Windows HE only
    # docker-machine ip
    # 192.168.99.100
    # docker-compose logs # e.g. http://<IP address above>:8888/?token=3bd3dd53b2804cfc1ca4d18997f3eb7ab4906598a48f9df4
  
    # to exit from logs use 'ctl-c'
    $ docker-compose down # stop the notebook server

# Development

If you are doing development on this project create a virtual environment and install development dependencies.

  * `python -m venv .venv`
  * `pip install -r requirements.txt`
