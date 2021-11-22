#!/bin/bash

apt update
apt install -y sudo
sudo apt-get install -y libopencv-dev libglew-dev libglfw3 libglfw3-dev libpcl-dev

cd ..

sudo ln -s /usr/local/nvidia/lib64/libcuda.so /usr/lib/libcuda.so


# Install Eigen 3.3.4
wget https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz
tar -xf eigen-3.4.0.tar.gz
cd eigen-3.4.0
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/  ..
sudo make install
cd ../../

sudo apt-get install -y libxext-dev libx11-dev x11proto-gl-dev autoconf automake libtool
git clone https://github.com/NVIDIA/libglvnd.git
cd libglvnd
bash autogen.sh
./configure
make -j4
sudo make install
cd /kaggle/working

# git clone --recursive https://github.com/stevenlovegrove/Pangolin.git
# cd Pangolin 
# mkdir build_static && mkdir install_static
# cd build_static
# cmake ..
# cmake --build . -- -j4
# cd ../../

# git clone https://github.com/kzampog/cilantro.git
# cd cilantro
# mkdir build_static && mkdir install_static
# cd build_static
# cmake ..
# make -j4
# cd ../../
cp /usr/lib/x86_64-linux-gnu/libQt5Test.so.5 /opt/conda/lib/libQt5Test.so.5
cp /usr/lib/x86_64-linux-gnu/libharfbuzz.so.0 /opt/conda/lib/libharfbuzz.so.0
cp /usr/lib/x86_64-linux-gnu/libfontconfig.so.1 /opt/conda/lib/libfontconfig.so.1

cd surfelwarp
mkdir build && cd build
cmake -DCUDA_ARCH=60 ..
sudo make -j4

unzip /kaggle/working/surfelwarp/test_data/boxing.zip -d /kaggle/working/surfelwarp/test_data

