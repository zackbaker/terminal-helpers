import os
from . import helpers

def run():
    home_dir = helpers.get_homedir()
    if not os.path.isdir(f'{home_dir}/.pyenv'):
        install_packages = [
            'build-essential',
            'curl',
            'libbz2-dev',
            'libffi-dev',
            'liblzma-dev',
            'libncursesw5-dev',
            'libreadline-dev',
            'libsqlite3-dev',
            'libssl-dev',
            'libxml2-dev',
            'libxmlsec1-dev',
            'llvm',
            'make',
            'tk-dev',
            'wget',
            'xz-utils',
            'zlib1g-dev'
        ]
        helpers.run_cmd(f'sudo apt-get install {" ".join(install_packages)}')
        helpers.run_cmd(f'git clone https://github.com/pyenv/pyenv.git {home_dir}/.pyenv')
        helpers.run_cmd(f'cd {home_dir}/.pyenv && src/configure && make -C src')
        helpers.run_cmd(f'git clone https://github.com/pyenv/pyenv-virtualenv.git {home_dir}/.pyenv/plugins/pyenv-virtual')

        if not helpers.check_zshrc('export PYENV_ROOT'):
            helpers.write_zshrc('export PYENV_ROOT="$HOME/.pyenv"')

        if not helpers.check_zshrc('command -v pyenv'):
            helpers.write_zshrc('command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"')

        if not helpers.check_zshrc('eval "$(pyenv init)'):
            helpers.write_zshrc('eval "$(pyenv init -)"')

        if not helpers.check_zshrc('eval "$(pyenv virtualenv-init -)"', True):
            helpers.write_zshrc('eval "$(pyenv virtualenv-init -)"')
