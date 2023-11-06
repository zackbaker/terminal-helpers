import os

def run_cmd(cmd):
	os.system(cmd)

def check_zshrc(match, exact=False):
    """
    Checks user zshrc file for exact match

    :param match: Phrase to match
    :param exact: Exact match
    """
    home_dir = os.path.expanduser('~')
    with open(f'{home_dir}/.zshrc', 'r') as fp:
        for line in fp.readlines():
            if exact:
                if line == match:
                    return True
            else:
                if match in line:
                    return True
    return False
        
def write_zshrc(line):
    home_dir = os.path.expanduser('~')
    with open(f'{home_dir}/.zshrc', 'a') as fp:
        fp.write(f'{line}\n')
