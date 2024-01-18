from . import helpers


def run():
    helpers.run_cmd('sudo apt-get install -y ca-certificates curl gnupg')
    helpers.run_cmd('sudo install -m 0755 -d /etc/apt/keyrings')
    helpers.run_cmd('curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg')
    helpers.run_cmd('sudo chmod a+r /etc/apt/keyrings/docker.gpg')
    helpers.run_cmd('''
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ''')
    helpers.run_cmd('sudo apt-get update')
    helpers.run_cmd('sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin')

