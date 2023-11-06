from . import helpers

def run():
    helpers.run_cmd('sudo apt-get install python3 python3-pip -y')

    if not helpers.check_zshrc('alias python'):
        helpers.write_zshrc('alias python="python3"')

    if not helpers.check_zshrc('alias pip'):
        helpers.write_zshrc('alias pip="pip3"')

