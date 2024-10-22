# temporal-clis
This docker file will create an image that can be used to run the temporal command lines. 

It installs the temporal command line executables for both amd64 and arm64.  (Small script called temporal attempts to work out the architecture you are on and will run the appropriate executable.

The image also installs go and downloads the latest tcld command line and builds from source.  (Not tested on other architures but suspect you will need to build the image on the same architecture that you intend to run the image on.

# Usage.
  ------

## Build the image
```
git clone 
$ docker build temporalcli .
```
