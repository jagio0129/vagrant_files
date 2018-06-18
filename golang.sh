###
# Vagrantfileに以下の行を追加
# config.vm.provision :shell, privileged: false, path: "./vagrant_files/golang.sh"
# このファイルをVagrantfileと同じ階層に設置してvagrant up
### 

# vagrantのプロビジョニングで使われるbashはnon-itaractiveで起動しており、ubuntuの~/.bashrcでは、non-intaractiveモードでは~/.bashrcの処理を途中で切り上げてしまう設定になっていること
set -i

sudo apt install -y golang-1.9
sudo ln -s /usr/lib/go-1.9/bin/go /usr/bin/go
sudo ln -s /usr/lib/go-1.9/bin/gofmt /usr/bin/gofmt