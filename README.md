[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/pauleve/ClockCycle-notebooks/main)

# Notebooks for qualitative analysis of Circadian Clock - Cell Cycle coupled SBGN-PD maps

The notebooks can be visualized and downloaded at https://nbviewer.jupyter.org/github/pauleve/ClockCycle-notebooks/tree/main.

They can be executed interactively:
* online, using myBinder service at https://mybinder.org/v2/gh/pauleve/ClockCycle-notebooks/main
* or on your computer, provided you have [Docker](https://docs.docker.com/get-docker/) and Python 3 installed:
   1. download the notebooks and maps from  https://github.com/pauleve/ClockCycle-notebooks/archive/main.zip and extract the zip file
   2. execute the following commands, where ``ClockCycle-notebooks`` is the folder in which you extracted the notebooks
  ```
  sudo pip install -U colomoto-docker # you may have to use pip3 instead of pip
  colomoto-docker --image pauleve/clockcycle -V v0 --bind ClockCycle-notebooks
  ```

The Docker image `pauleve/clockcycle:v0` is based on the [CoLoMoTo Docker](http://colomoto.org/notebook) version `2020-08-01`, with additional tools:
* [csbgnpy](https://github.com/Adrienrougny/csbgnpy), a Python library for manipulating the conceptual model underlying an SBGN PD map
* [sbgn2an](https://github.com/Adrienrougny/sgbn2an), a Python library for computing initial states and stories of a Process Description map
