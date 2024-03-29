import os
from . import helpers

def copy_command(command_name):
    command_path = 'usr/local/bin'
    commands_dir = f'{os.getcwd()}/commands'
    helpers.run_cmd(f'sudo cp {commands_dir}/{command_name} {command_path}')
    helpers.run_cmd(f'sudo chown root: {command_path}/{command_name}')
    helpers.run_cmd(f'sudo chmod 755 {command_path}/{command_name}')

def run():
    commands = [
        'pyenv_init'
    ]
    command_path = f'/usr/local/bin'
    commands_dir = f'{os.getcwd()}/setup/commands'

    for command in commands:
        helpers.run_cmd(f'sudo ln -sf {commands_dir}/{command}.py {command_path}/{command}')

