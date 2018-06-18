###
# Vagrantfileに以下の行を追加
# config.vm.provision :shell, privileged: false, path: "./vagrant_files/rbenv.sh"
# このファイルをVagrantfileと同じ階層に設置してvagrant up
### 

# vagrantのプロビジョニングで使われるbashはnon-itaractiveで起動しており、ubuntuの~/.bashrcでは、non-intaractiveモードでは~/.bashrcの処理を途中で切り上げてしまう設定になっていること
set -i

## rbenv
cd
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

## ruby
rbenv install 2.3.7
rbenv global 2.3.7

## no document
echo "gem: --no-document" > ~/.gemrc

## rails
gem install bundler
gem install rails 5.2.0 --no-ri