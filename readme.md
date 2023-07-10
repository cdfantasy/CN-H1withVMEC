# readme

所有程序均可以在[PrincetonUniversity/STELLOPT: This is the GitHub repository for STELLOPT, the state-of-the-art stellarator optimization code.](https://github.com/PrincetonUniversity/STELLOPT)找到

程序使用可以查看wiki[VMECwiki | [“STELLOPT”\] (princetonuniversity.github.io)](https://princetonuniversity.github.io/STELLOPT/)



另附stellopt安装教程

2022-10-19 22:34:13 creat

2023-02-10 11.39.00 modify

Pingwei Zheng ，Gao zhengkun ，Heyi

2) 
1. Verify that your version of Ubuntu is up to date. 2. Use apt-get to install your packages.

  sudo apt-get install git

  sudo apt-get install gfortran

  sudo apt-get install openmpi-bin

  sudo apt-get install libopenmpi-dev

  sudo apt-get install gfortran

  sudo apt-get install g++

  sudo apt-get install libnetcdf-dev

  sudo apt-get install libnetcdff-dev

  sudo apt-get install libhdf5-openmpi-dev

  sudo apt-get install hdf5-tools

  sudo apt-get install libblas-dev

  sudo apt-get install liblapack-dev

  sudo apt-get install python3

  sudo apt-get install python3-numpy

  sudo apt-get install python3-h5py

  sudo apt-get install pgplot5

  sudo apt-get install libncarg-dev

  sudo apt-get install libscalapack-openmpi-dev

  sudo apt-get install make

git clone https://github.com/cdfantasy/STELLOPT.git

cd STELLOPT

export MACHINE="ubuntu" && export STELLOPT_PATH=/home/gzk/STELLOPT
（#export STELLOPT_PATH=<path to repo directory）

./build_all

提示-fallow-argument-mismatch不能识别，估计该字段应该
出现在$(STELLOPT_PATH)/SHARE/make_ubuntu.inc文件中，
(gfortran: error: unrecognized command line option ‘-fallow-argument-mismatch’; did you mean ‘-Wno-argument-mismatch’?)

找到，根据提示，都把它们替换为-Wno-argument-mismatch，或者去掉‘-fallow-argument-mismatch’。

gcc version 11.3.0 可以支持 ‘-fallow-argument-mismatch’。


========================================================================================
各个子模块的可执行文件的连接都复制到主目录 ~/bin下
cd ~/bin && ls 可以查看到：
libstell.a    xbcyclic     xcobravmec   xgrid        xstelloptv2  xvmec2stel
libstell_dir  xbeams3d     xcoilopt     xjinvariant  xtorlines    xvmec2v690
libstell.so   xbnorm       xdiagno      xneo         xvmec2000    xvmec2xgc
STELLOPT      xbootsj      xdkes        xnescoil     xvmec2pies   xwallacc

VMECplot      xbooz_xform  xfieldlines  xpenta       xvmec2spec

=======================================================================================

