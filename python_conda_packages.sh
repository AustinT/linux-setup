conda update -n base conda

# Standard data processing libraries
conda install -y numpy scipy matplotlib scikit-learn pandas jupyter jupyterlab ipython sympy seaborn imageio 

# Machine learning libraries (assuming no gpu)
pip install tensorflow keras
conda install pytorch-cpu torchvision-cpu -c pytorch
