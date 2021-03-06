scriptencoding utf-8
let s:file = {}
let s:system = SpaceVim#api#import('system')

if s:system.isWindows
    let s:file['separator'] = '\'
    let s:file['pathSeparator'] = ';'
else
    let s:file['separator'] = '/'
    let s:file['pathSeparator'] = ':'
endif

let s:file_node_extensions = {
            \  'styl'     : '',
            \  'scss'     : '',
            \  'htm'      : '',
            \  'html'     : '',
            \  'erb'      : '',
            \  'slim'     : '',
            \  'ejs'      : '',
            \  'wxml'      : '',
            \  'css'      : '',
            \  'less'     : '',
            \  'wxss'     : '',
            \  'md'       : '',
            \  'markdown' : '',
            \  'json'     : '',
            \  'js'       : '',
            \  'jsx'      : '',
            \  'rb'       : '',
            \  'php'      : '',
            \  'py'       : '',
            \  'pyc'      : '',
            \  'pyo'      : '',
            \  'pyd'      : '',
            \  'coffee'   : '',
            \  'mustache' : '',
            \  'hbs'      : '',
            \  'conf'     : '',
            \  'ini'      : '',
            \  'yml'      : '',
            \  'bat'      : '',
            \  'jpg'      : '',
            \  'jpeg'     : '',
            \  'bmp'      : '',
            \  'png'      : '',
            \  'gif'      : '',
            \  'ico'      : '',
            \  'twig'     : '',
            \  'cpp'      : '',
            \  'c++'      : '',
            \  'cxx'      : '',
            \  'cc'       : '',
            \  'cp'       : '',
            \  'c'        : '',
            \  'hs'       : '',
            \  'lhs'      : '',
            \  'lua'      : '',
            \  'java'     : '',
            \  'sh'       : '',
            \  'fish'     : '',
            \  'ml'       : 'λ',
            \  'mli'      : 'λ',
            \  'diff'     : '',
            \  'db'       : '',
            \  'sql'      : '',
            \  'dump'     : '',
            \  'clj'      : '',
            \  'cljc'     : '',
            \  'cljs'     : '',
            \  'edn'      : '',
            \  'scala'    : '',
            \  'go'       : '',
            \  'dart'     : '',
            \  'xul'      : '',
            \  'sln'      : '',
            \  'suo'      : '',
            \  'pl'       : '',
            \  'pm'       : '',
            \  't'        : '',
            \  'rss'      : '',
            \  'f#'       : '',
            \  'fsscript' : '',
            \  'fsx'      : '',
            \  'fs'       : '',
            \  'fsi'      : '',
            \  'rs'       : '',
            \  'rlib'     : '',
            \  'd'        : '',
            \  'erl'      : '',
            \  'hrl'      : '',
            \  'vim'      : '',
            \  'ai'       : '',
            \  'psd'      : '',
            \  'psb'      : '',
            \  'ts'       : '',
            \  'jl'       : ''
            \}

let s:file_node_exact_matches = {
            \  'exact-match-case-sensitive-1.txt' : 'X1',
            \  'exact-match-case-sensitive-2'     : 'X2',
            \  'gruntfile.coffee'                 : '',
            \  'gruntfile.js'                     : '',
            \  'gruntfile.ls'                     : '',
            \  'gulpfile.coffee'                  : '',
            \  'gulpfile.js'                      : '',
            \  'gulpfile.ls'                      : '',
            \  'dropbox'                          : '',
            \  '.ds_store'                        : '',
            \  '.gitconfig'                       : '',
            \  '.gitignore'                       : '',
            \  '.bashrc'                          : '',
            \  '.bashprofile'                     : '',
            \  'favicon.ico'                      : '',
            \  'license'                          : '',
            \  'node_modules'                     : '',
            \  'react.jsx'                        : '',
            \  'Procfile'                         : '',
            \  '.vimrc'                           : '',
            \}

let s:file_node_pattern_matches = {
            \ '.*jquery.*\.js$'       : '',
            \ '.*angular.*\.js$'      : '',
            \ '.*backbone.*\.js$'     : '',
            \ '.*require.*\.js$'      : '',
            \ '.*materialize.*\.js$'  : '',
            \ '.*materialize.*\.css$' : '',
            \ '.*mootools.*\.js$'     : ''
            \}


function! s:filetypeIcon(path) abort
    let file = fnamemodify(a:path, ':t')
    if has_key(s:file_node_exact_matches, file)
        return s:file_node_exact_matches[file]
    endif
    for [k, v]  in items(s:file_node_pattern_matches)
        if match(file, k) != -1
            return v
        endif
    endfor
    let ext = fnamemodify(file, ':e')
    if has_key(s:file_node_extensions, ext)
        return s:file_node_extensions[ext]
    endif
    return ''

endfunction

let s:file['fticon'] = function('s:filetypeIcon')

function! SpaceVim#api#file#get() abort
    return deepcopy(s:file)
endfunction



