snap
====

# simple linux (Mint Mate 17) snapping + keybings

#### dconf-cli is required to export/import keybindings:
dconf dump /org/mate/desktop/keybindings/ > /tmp/foo


#### Haven't tried importing yet!  Maybe something like this:
cat /tmp/foo | dconf load /org/mate/desktop/keybindings/ 
