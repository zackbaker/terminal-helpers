#!/usr/bin/python3

import os

py_version = input('What Python version would you like this env? (ex. 3.10): ')
os.system(f'pyenv install {py_version} -v')

project_name = os.getcwd()
project_name = '-'.join(project_name.split('/')[-2:])

os.system(f'pyenv virtualenv {py_version} {project_name}-{py_version}')

with open('.python-version', 'w') as fp:
    fp.write(f'{py_version}/envs/{project_name}-{py_version}')

with open('pyrightconfig.json', 'w') as fp:
    home_dir = os.path.expanduser('~')
    fp.write('{"venvPath":' + f' "{home_dir}/.pyenv/versions/", "venv": "{project_name}-{py_version}"' + '}')

