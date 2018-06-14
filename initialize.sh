###
# Vagrantfileに以下の行を追加
# config.vm.provision :shell, privileged: false, path: "./vagrant_files/initialize.sh"
# このファイルをVagrantfileと同じ階層に設置してvagrant up
### 

# vagrantのプロビジョニングで使われるbashはnon-itaractiveで起動しており、ubuntuの~/.bashrcでは、non-intaractiveモードでは~/.bashrcの処理を途中で切り上げてしまう設定になっていること
set -i

# for Ubuntu16.04
sudo apt-get update

## my vim
cd
git clone https://github.com/jagio0129/dotfiles.git
cd dotfiles
git submodule init
git submodule update
./dotfilesLink.sh