#############Instalar pip#############
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
vi .bash_profile
export PATH=~/.local/bin:$PATH
source ~/.bash_profile
pip --version
############Instala aws################
pip install awscli --upgrade --user
aws --version
aws configure