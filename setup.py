from setup import python_setup, nvim_setup, helpers, link_commands

helpers.run_cmd('sudo apt-get update')
python_setup.run()
nvim_setup.run()
link_commands.run()
