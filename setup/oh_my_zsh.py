from . import helpers


def run():
    helpers.run_cmd('sudo apt-get install -y zsh')
	helpers.run_cmd('sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"')
