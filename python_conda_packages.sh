conda update -n base conda

# Standard data processing libraries
conda install -y numpy scipy matplotlib scikit-learn pandas jupyter jupyterlab \
    ipython sympy seaborn imageio tqdm \
    nodejs ipywidgets

# Note: to get jupyterlab widgets working, you need node/npm.
# Link: https://ipywidgets.readthedocs.io/en/stable/user_install.html
jupyter labextension install @jupyter-widgets/jupyterlab-manager
# To consider too:
# jupyter labextension install @jupyter-widgets/jupyterlab-manager jupyter-matplotlib

# Machine learning libraries (assuming no gpu)
pip install -U pip
pip install -U sacred hyperopt

# Install cpu or gpu stuff: pick from this list!
# pip install -U tensorflow
# conda install pytorch-cpu torchvision-cpu -c pytorch
