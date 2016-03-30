# Buildroot Config 

Config files for creating a PXE image

The files contained in this repository are indended to supplement the [Buildroot](http://www.buildroot.org/) project.
The resultant embedded system is indended to be used for [FLDT](https://github.com/pennmanor/FLDT) to allow modern hardware to be quickly and efficiently imaged.

The latest tested version of Buildroot was 2016.02

# Using this repository

*Quick Setup:*

```bash
# Get Buildroot's files
git clone git://git.buildroot.net/buildroot
wget https://buildroot.org/downloads/buildroot-2016.02.tar.gz
tar xzvf buildroot-2016.02.tar.gz
# Get this repo's files
git clone https://github.com/pennmanor/FLDT-Buildroot.git
#cd into buildroot
cd buildroot-2016.02
#apply our patches
patch -p2  < ../FLDT_Buildroot/build_root_patches/01-linux-firmware.patch 
patch -p2  < ../FLDT_Buildroot/build_root_patches/02-linux-firmware.patch
#setup the external buildroot 
make BR2_EXTERNAL=../FLDT_Buildroot/ list-defconfigs
#use the fldt default config
make fldt_defconfig
#build it
make all
```

The built fldt image should be in output/images.

