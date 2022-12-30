#!/usr/bin/python
# coding=UTF-8
# These glyphs, and the mapping of file extensions to glyphs
# has been copied from the vimscript code that is present in
# https://github.com/ryanoasis/vim-devicons
import re;
import os;

# all those glyphs will show as weird squares if you don't have the correct patched font
# My advice is to use NerdFonts which can be found here:
# https://github.com/ryanoasis/nerd-fonts
file_node_extensions = {
    '7z'       : '',
    'apk'      : '',
    'avi'      : '',
    'bat'      : '',
    'bmp'      : '',
    'bz2'      : '',
    'c'        : '',
    'c++'      : '',
    'cab'      : '',
    'cc'       : '',
    'coffee'   : '',
    'conf'     : '',
    'cp'       : '',
    'cpio'     : '',
    'cpp'      : '',
    'css'      : '',
    'cxx'      : '',
    'deb'      : '',
    'ejs'      : '',
    'epub'     : '',
    'flac'     : '',
    'flv'      : '',
    'gem'      : '',
    'gif'      : '',
    'go'       : '',
    'gz'       : '',
    'gzip'     : '',
    'hbs'      : '',
    'hs'       : '',
    'htm'      : '',
    'html'     : '',
    'ico'      : '',
    'ini'      : '',
    'jl'       : '',
    'jpeg'     : '',
    'jpg'      : '',
    'js'       : '',
    'json'     : '',
    'less'     : '',
    'lha'      : '',
    'lhs'      : '',
    'log'      : '',
    'lua'      : '',
    'lzh'      : '',
    'lzma'     : '',
    'markdown' : '',
    'md'       : '',
    'mkv'      : '',
    'ml'       : 'λ',
    'mli'      : 'λ',
    'mov'      : '',
    'mp3'      : '',
    'mp4'      : '',
    'mpeg'     : '',
    'mpg'      : '',
    'mustache' : '',
    'ogg'      : '',
    'pdf'      : '',
    'php'      : '',
    'png'      : '',
    'py'       : '',
    'pyc'      : '',
    'pyd'      : '',
    'pyo'      : '',
    'rar'      : '',
    'rc'       : '',
    'rpm'      : '',
    'rss'      : '',
    'scss'     : '',
    'slim'     : '',
    'styl'     : '',
    'tar'      : '',
    'tgz'      : '',
    'ts'       : '',
    'twig'     : '',
    'wav'      : '',
    'xml'      : '',
    'xz'       : '',
    'yml'      : '',
    'zip'      : '',
}

dir_node_exact_matches = {
# English
    'Desktop'                          : '',
    'Documents'                        : '',
    'Music'                            : '',
    'Public'                           : '',
    'Templates'                        : '',
    'Videos'                           : '',
}

file_node_exact_matches = {
    '.Xdefaults'                       : '',
    '.Xresources'                      : '',
    '.bashprofile'                     : '',
    '.bashrc'                          : '',
    '.dmrc'                            : '',
    '.ds_store'                        : '',
    '.fasd'                            : '',
    '.gitconfig'                       : '',
    '.gitignore'                       : '',
    '.jack-settings'                   : '',
    '.mime.types'                      : '',
    '.nvidia-settings-rc'              : '',
    '.pam_environment'                 : '',
    '.profile'                         : '',
    '.recently-used'                   : '',
    '.selected_editor'                 : '',
    '.xinputrc'                        : '',
    'config'                           : '',
    'exact-match-case-sensitive-1.txt' : 'X1',
    'exact-match-case-sensitive-2'     : 'X2',
    'favicon.ico'                      : '',
    'gruntfile.coffee'                 : '',
    'gruntfile.js'                     : '',
    'gruntfile.ls'                     : '',
    'gulpfile.coffee'                  : '',
    'gulpfile.js'                      : '',
    'gulpfile.ls'                      : '',
    'ini'                              : '',
    'ledger'                           : '',
    'license'                          : '',
    'mimeapps.list'                    : '',
    'procfile'                         : '',
    'react.jsx'                        : '',
    'user-dirs.dirs'                   : '',
}

def devicon(file):
  if file.is_directory: return dir_node_exact_matches.get(file.relative_path, ''')
  return file_node_exact_matches.get(file.relative_path, file_node_extensions.get(file.extension, ''))