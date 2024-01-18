from . import helpers


def run():
    helpers.run_cmd('git config --global user.email "zbakerdesign@gmail.com"')
    helpers.run_cmd('git config --global user.name "Zack Baker"')
    helpers.run_cmd('git config --global core.editor "nvim"')

