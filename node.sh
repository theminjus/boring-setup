#!/bin/sh
echo "------------Installing Git--------------" 
sudo dnf install git-all -y
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
source ~/.bashrc

sudo yum install gcc-c++ cairo-devel libjpeg-turbo-devel pango-devel giflib-devel


echo "-----Setup node versions-------" 
nvm install 8.9.4
nvm install 0.12.15
nvm install 10.19.0
nvm install 12.15.0

echo "------------setup node-gyp--------------" 
nvm use 8.9.4

cd ~/
cat > ~/binding.gyp << 'EOF'
{
  "targets": [
    {
      "target_name": "binding",
      "sources": [ "src/binding.cc" ]
    }
  ]
}
EOF

sudo dnf node-gyp -y
npm install -g node-gyp
node-gyp configure

