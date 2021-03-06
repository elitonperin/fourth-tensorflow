#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash setup.sh




sudo apt-get update

#sudo apt-get install libxml2-dev libxslt-dev python-dev

echo "Install Rscript"

sudo apt-get -y install r-base r-base-core r-base-html 
sudo apt-get -y install libmagickwand-dev



echo "First checking the Python version"
python --version

echo "--------------------------------------------------------------"
echo ". "


echo "Now checking is pip is installed"

pip list

echo "--------------------------------------------------------------"
echo ". "


echo "next list this directory"
pwd
ls -lah  

echo "--------------------------------------------------------------"
echo "Some other useful commands are cd     cd ..      dir    ls     pwd     "
echo "."




echo "Installing PIP and Virtual Environment"

sudo apt-get -y install python-pip python-dev python-virtualenv python-scipy

echo "--------------------------------------------------------------"
echo ". "

echo "make the tensorflow environment"

virtualenv --system-site-packages ~/virtual-tf

echo "--------------------------------------------------------------"
echo ". "


echo "Activate the environemtn use deactivate to get your cursor back"
source ~/virtual-tf/bin/activate 

printf "\n\nsource ~/virtual-tf/bin/activate "  >> ~/.profile
printf "\necho 'enter   deactivate    to get out of the virtual enviroment'"  >> ~/.profile


echo "--------------------------------------------------------------"
echo ". "

echo "Now intall tensorFlow into the enviroment"


# for cpu only
#pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl

#PYTHONUSERBASE=/home/ubuntu/workspace/tensorflow pip install --user --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl
#export PYTHONPATH=/home/ubuntu/workspace/tensorflow:$PYTHONPATH
#export PATH=/home/ubuntu/workspace/tensorflow/bin:$PATH


# Ubuntu/Linux 64-bit, GPU enabled. Requires CUDA toolkit 7.5 and CuDNN v4.  For
# other versions, see "Install from sources" below.


# need more research here. Not really sure if the lines below work or not.

tar -zxf cudnn-7.0-linux-x64-v4.0-rc.tgz 
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/cudnn.h /usr/local/cuda/include/
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/ubuntu/workspace/cuda/lib64" export CUDA_HOME=/home/ubuntu/workspace/cuda


cd ..
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl









echo "--------------------------------------------------------------"
echo ". "

echo "Unfortunately on cloud 9 Pip hides the TensorFlow folder so lets clone it for our use"
echo "Kind of wasteful but it isn't on our computer anyway"

#deactivate

git clone --recurse-submodules https://github.com/tensorflow/tensorflow


echo "--------------------------------------------------------------"
echo ". "


echo "Installing a few extra packages"




pip install Wand

pip install matplotlib

pip install pymatbridge

pip install scikit-learn

#pip install git+git://github.com/tensorflow/skflow.git

pip install scikit-cuda




echo "------------------------Tensorflow installed--------------------------------------"
echo "--------------------------------------------------------------"
echo "--------------------------------------------------------------"
echo "--------------------------------------------------------------"
echo "--------------------------------------------------------------"
echo "--------------------------------------------------------------"
echo "--------------------------------------------------------------"

echo ". "

#echo "Unfortunately on cloud 9 Pip hides the TensorFlow folder so lets clone it for our use"
#echo "Kind of wasteful but it isn't on our computer anyway"

#deactivate

git clone --recurse-submodules https://github.com/tensorflow/tensorflow

echo "Make a quick link to udacity files" 

ln -s /home/ubuntu/workspace/tensorflow/tensorflow/examples/udacity /home/ubuntu/workspace/udacityLink



echo "enter   deactivate    to get out of the virtual enviroment"



echo "--------------------------------------------------------------"
echo ". "


pip install --upgrade ipython
pip install --upgrade jupyter





#jupyter notebook --ip=0.0.0.0 --port=8080 --no-browser
jupyter notebook --ip $IP --port $PORT --no-browser

# bash file stays here so no more commands will work



