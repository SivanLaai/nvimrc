# Neovim-Tmux

### 更加强大的终端zsh和on-my-zsh管理，支持主题和插件

## Ubuntu安装方式
```bash
# 可在内部选择对应的版本
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SivanLaai/nvimrc/HEAD/install.sh)"
```

## windows
#### 1.下载安装vim-gui
- Neovim
[下载python编译版本gvim](https://github.com/neovim/neovim/releases)

配置路径```D:\Program Files\Neovim\bin```为系统环境变量

#### 2.安装对应版本的Python
- GVim查看对应版本的Python
[查看相关版本的python下载安装：](https://github.com/vim/vim-win32-installer/releases/latest)
 ![python](https://cdn.jsdelivr.net/gh/SivanLaai/image-store-rep@master/vim/python.2aejfb0v8g7w.png)

#### 3.安装字体
- [下载字体 DejaVu Sans Mono for Powerline](https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf)

#### 4.安装ripgrep
- [下载ripgrep](https://github.com/BurntSushi/ripgrep/releases/latest)
- 将ripgrep程序拷贝到安装路径，如```D:\Program Files\ripgrep```
- 配置路径```D:\Program Files\ripgrep```为系统环境变量
#### 5.安装Latex
- [下载miktex](https://miktex.org/download)
- 安装mitex并更新
#### 6.安装MSYS2
- [下载MSYS2](https://www.msys2.org/)
- 将MSYS2程序安装到路径，如```D:\Program Files\MSYS2```
- 配置路径```D:\Program Files\MSYS2\usr\bin```为系统环境变量
- 配置路径```D:\Program Files\MSYS2\clang4\bin```为系统环境变量
- 安装clang64
```bash
# 更新软件库
pacman -Syu
# 更新核心软件
pacman -Su
# 安装Clang64编译环境
pacman -S --needed base-devel mingw-w64-clang-x86_64-toolchain
```
- [下载git](https://github.com/git-for-windows/git/releases/tag/v2.33.0.windows.2)
- 将git程序安装到路径，如```D:\Program Files\git```
- 配置路径```D:\Program Files\git\bin```为系统环境变量
- git中文显示错误修正
```bash
git config --global core.quotepath false
```
- 想卸载某个包的话
```bash
pacman -Rs mingw-w64-clang-x86_64-toolchain
```
#### 9.复制配置文件
- NeoVim-qt
```
git clone https://github.com/NvChad/NvChad %HOMEPATH%\AppData\Local\nvim --depth 1
git clone https://github.com/SivanLaai/nvimrc %HOMEPATH%\AppData\Local\nvim\lua\custom
```
#### 10.配置vim
```zsh
:PackerSync #待安装完成
```

# Reference
- [example_config](https://github.com/NvChad/example_config)
