import os

from . import helpers

install_packages = [
    'ninja-build',
    'gettext',
    'libtool',
    'libtool-bin',
    'autoconf',
    'automake',
    'cmake',
    'g++',
    'pkg-config',
    'unzip',
    'ripgrep',
    'nodejs',
    'npm',
    'xclip'
]

def run():
    helpers.run_cmd(f'sudo apt-get install {" ".join(install_packages)} -y')

    font_dir = '/usr/share/fonts/TTF/Hack'
    font_dir_count = len(os.listdir(font_dir))
    if font_dir_count == 0:
        helpers.run_cmd('wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip')
        helpers.run_cmd(f'sudo mkdir -p {font_dir}')
        helpers.run_cmd(f'sudo unzip Hack.zip -d {font_dir}/')
        helpers.run_cmd('rm Hack.zip')

        print('''
            Install fonts saved to Downloads folder then
            Right click on terminal click Profiles and then Profile Preferences and select Hack Font as terminal Font
        ''')
        input('Once the above is finish hit enter to continue')

    home_dir = helpers.get_homedir()
    if not os.path.isdir(f'{home_dir}/neovim'):
        helpers.run_cmd(f'cd {home_dir} && git clone https://github.com/neovim/neovim.git')

        neovim_install = [
            f'cd {home_dir}/neovim',
            'git checkout stable',
            'make CMAKE_BUILD_TYPE=RelWithDebInfo',
            'sudo make install'
        ]
        helpers.run_cmd('&&'.join(neovim_install))

    helpers.run_cmd(f'mkdir -p {home_dir}/.config')

    current_dir = os.getcwd()
    if current_dir.split('/')[-1] != 'terminal-helpers':
        raise Exception('This must be ran through setup.py in the terminal-helpers folder')

    if not os.path.isdir(f'{home_dir}/.config/nvim/'):
        helpers.run_cmd(f'ln -s {current_dir}/nvim/ {home_dir}/.config/')

