---
name: Application Request
about: Request new applications using this template.
title: "[APP REQUEST]: "
labels: App Request
assignees: ''

---

### Dockerhub Link: ###
*replace with dockerhub link*

### Description ###
*replace with description*

### Separate Database? ###
*does this require a separate database in order to function?*

### Fill this out as best as you can. Documentation about these can be found here: https://www.portainer.io/documentation/how-to-use-templates/

```json
{
  "version": "2",
  "templates": [
    {
      "categories": [
        "Music"
      ],
      "description": "Airsonic is a free, web-based media streamer, providing ubiqutious access to your music. Use it to share your music with friends, or to listen to your own music while at work. You can stream to multiple players simultaneously, for instance to one player in your kitchen and another in your living room.",
      "env": [
        {
          "default": "1000",
          "label": "PUID",
          "name": "PUID"
        },
        {
          "default": "100",
          "label": "PGID",
          "name": "PGID"
        },
        {
          "label": "CONTEXT_PATH",
          "name": "CONTEXT_PATH",
          "set": "airsonic"
        },
        {
          "label": "JAVA_OPTS",
          "name": "JAVA_OPTS",
          "set": "-Xms256m -Xmx512m"
        }
      ],
      "image": "linuxserver/airsonic:latest",
      "logo": "https://raw.githubusercontent.com/Qballjos/portainer_templates/master/Images/airsonic-logo.png",
      "name": "airsonic",
      "platform": "linux",
      "ports": [
        "4040:4040/tcp"
      ],
      "restart_policy": "unless-stopped",
      "title": "Airsonic",
      "type": 1,
      "volumes": [
        {
          "bind": "/portainer/Music",
          "container": "/music"
        },
        {
          "bind": "/portainer/Files/AppData/Airsonic/Playlists",
          "container": "/playlists"
        },
        {
          "bind": "/portainer/Podcasts",
          "container": "/podcasts"
        },
        {
          "bind": "/portainer/Files/AppData/Airsonic/Media",
          "container": "/media"
        },
        {
          "bind": "/portainer/Files/AppData/Config/Airsonic/",
          "container": "/config"
        }
      ]
    },
```