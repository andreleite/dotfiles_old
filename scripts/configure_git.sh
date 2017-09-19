#!/bin/bash

git config --global color.ui true
git config --global user.name 'Andre Leite'
git config --global user.email andre@andre.io
git config --global push.default simple
git config --global push.followTags true
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false
git config --global core.excludesfile '~/.gitignore_global'
git config --global http.sslVerify false
