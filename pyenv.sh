###
# Vagrantfileに以下の行を追加
# config.vm.provision :shell, privileged: false, path: "./vagrant_filespyenv.sh"
# このファイルをVagrantfileと同じ階層に設置してvagrant up
### 

# vagrantのプロビジョニングで使われるbashはnon-itaractiveで起動しており、ubuntuの~/.bashrcでは、non-intaractiveモードでは~/.bashrcの処理を途中で切り上げてしまう設定になっていること
set -i

sudo apt-get install -y \
    zlib1g-dev \
    libbz2-dev \
    libreadline6 \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev

## pyenv
git clone git://github.com/yyuu/pyenv.git ${HOME}/.pyenv
cat << EOF >> ${HOME}/.profile
export PYENV_ROOT=\${HOME}/.pyenv
export PATH=\${PYENV_ROOT}/bin:\${PATH}
eval "\$(pyenv init -)"
EOF
source ${HOME}/.profile

## python
pyenv install 3.6.5
pyenv global 3.6.5

## pip
sudo apt-get install -y python3-pip