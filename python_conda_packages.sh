conda update -n base conda

# Python 3.7 isn't fully supported yet... so plz 3.6
conda install python=3.6

# Standard data processing libraries
conda install -y numpy scipy matplotlib scikit-learn pandas jupyter jupyterlab ipython sympy seaborn imageio 

# Machine learning libraries (assuming no gpu)
pip install -U pip
pip install -U tensorflow keras tensorboard
conda install pytorch-cpu torchvision-cpu -c pytorch
