1. Git tree should be in `%HOMEPATH%/vimfiles`
2. mklinks.cmd creates links for `_vimrc` and `_gvimrc`
3. Install msys2
4. From msys2 run `make` in `bundle/vimproc` (needs `make` and
   `mingw-w64-x86_64-gcc` packages installed)
5. From msys2 run `make` in `bundle/lusty`
6. From msys2 run `make` in `bundle/vim-fsharp` (needs `unzip` package)
7. In `bundle/omnisharp.vim` do `git submodule update --init --recursive`
8. In `bundle/omnisharp-vim/server` run `msbuild` (install first
   `microsoft-build-tools` with chocolatey package manager, the path to
   the installed executable is something like
   `C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\14.0\Bin\MSBuild.exe`
