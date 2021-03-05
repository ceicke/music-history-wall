# Music History wall

This software is a simple music album organization software. It is used on a wall of CDs that each have a NFS tag inside of them. The NFS tag simply holds a URL in the form of http://192.168.0.2/albums/5/play that causes the software to play the selected album on a Sonos system.

It is intended to run on a RaspberryPi.

## Setup

- Configure where your database and storage for the music album lies in `config/database.yml` and `config/storage.yml`.
- Get an API key from http://www.discogs.com and put it into your `config/credentials.yml.enc` with the key `discogs_token`
- Run the softare with `rails s` and head over to `sonos_systems/` to setup your Sonos system
- Upload albums, scan and enjoy the music
