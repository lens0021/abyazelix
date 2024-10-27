# Abyazelix: A sidebar opens files in a helix buffer! 

### Overview
Abyazelix integrates yazi, zellij and helix, hence the name, get it?
- Zellij orchestrates everything, with yazi as a sidebar and helix as the editor
- You can open and close the sidebar by switching zellij layouts (press `alt ]` and `alt [`)
  - Or if you only got one pane open, make it fullscreen (`ctrl p + f` or `alt f` )
- Helix is called when you hit enter on a file in the "sidebar"
  - If helix is already open, in a pane next to the sidebar, it will open in a new buffer on that pane (magic)

### Instructions to set it up
1. Make sure [yazi](https://github.com/sxyazi/yazi), [zellij](https://github.com/zellij-org/zellij) and [helix](https://helix-editor.com) are installed and in your path
2. Just clone this repo in your `~/.config` dir
3. Make an alias or an abbr for the next commnd:
  ```bash
  YAZI_CONFIG_HOME=~/.config/abyazelix/yazi/sidebar yazi
  ```
4. In a Zellij section, execute the command you setup the previous step.

### Why use this project?
- This project is relatively simple to understand, the inner workings and all. Just a bit shell scripting magic, but mostly config files
- Easy to configure and make it yours

### Possible Improvements
- Abyazelix will only detect helix if it's adjacent to the sidebar. A minor thing.
- The opening of files in a helix buffer implementation works but feels like a workaround. But it does not matter much. Helix will get a plugin system and then a file tree plugin probably between the beginning and middle of 2025 anyaways.. 

### Similar projects
- [Yazelix](https://github.com/luccahuguet/yazelix)
  - Abyazelix is a fork of Yazelix.
- [Zelix](https://github.com/cfuehrmann/zelix)
- [Shelix](https://github.com/webdev23/shelix)
- [File tree picker in Helix with Zellij](https://yazi-rs.github.io/docs/tips/#helix-with-zellij) 
  - Yazi can be used as a file picker to browse and open file(s) in your current Helix instance (running in a Zellij session)
