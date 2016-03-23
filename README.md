# Buildroot Config 

Config files for creating a PXE image

The files contained in this repository are indended to supplement the [Buildroot](http://www.buildroot.org/) project.
The resultant embedded system is indended to be used for [FLDT](https://github.com/pennmanor/FLDT) to allow modern hardware to be quickly and efficiently imaged.

The latest tested version of Buildroot was 2015.11

# Using this repository

*Quick Setup:*

```bash
# Get Buildroot's files
git clone git://git.buildroot.net/buildroot
# OR:
wget https://buildroot.org/downloads/buildroot-2015.11.tar.gz
tar xzvf buildroot-2015.11.tar.gz
# Get this repo's files
git clone https://github.com/pennmanor/FLDT-Buildroot.git
# Merge the two repos together
cp -r FLDT-Buildroot/. buildroot/.
cd buildroot/
# Make the images
make all
```

