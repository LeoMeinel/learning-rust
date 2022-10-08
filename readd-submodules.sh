#!/bin/bash
###
# File: readd-submodules.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2022 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

set -eu

DIR=$(dirname "$0")
cd "${DIR:?}"
readarray -t SUBMODULES < <(git submodule status | cut -d' ' -f2 | tr -d "[:blank:]")
SUBMODULES_LENGTH="${#SUBMODULES[@]}"
git submodule init
git submodule update
git submodule deinit -f --all
for ((i = 0; i < SUBMODULES_LENGTH; i++)); do
    rm -rf "${DIR:?}/${SUBMODULES[$i]}"
    rm -rf "${DIR:?}/.git/modules/${SUBMODULES[$i]}"
    {
        unset 'SUBMODULES[$i]'
        continue
    }
    SUBMODULES=("${SUBMODULES[@]}")
done
rm -rf "${DIR:?}/.gitmodules"
git add .
git commit -m "Remove submodules" || true
git submodule add git@github.com:LeoMeinel/0_template.git
git submodule add git@github.com:LeoMeinel/app_cli_iterators.git
git submodule add git@github.com:LeoMeinel/app_cli.git
git submodule add git@github.com:LeoMeinel/box_smart_pointer.git
git submodule add git@github.com:LeoMeinel/closures.git
git submodule add git@github.com:LeoMeinel/collections.git
git submodule add git@github.com:LeoMeinel/deref_trait.git
git submodule add git@github.com:LeoMeinel/drop_trait.git
git submodule add git@github.com:LeoMeinel/enums.git
git submodule add git@github.com:LeoMeinel/error_handling.git
git submodule add git@github.com:LeoMeinel/generic_types.git
git submodule add git@github.com:LeoMeinel/guessing_game.git
git submodule add git@github.com:LeoMeinel/hello_world.git
git submodule add git@github.com:LeoMeinel/iterators.git
git submodule add git@github.com:LeoMeinel/leomeinel_sample.git
git submodule add git@github.com:LeoMeinel/lifetimes.git
git submodule add git@github.com:LeoMeinel/module_system.git
git submodule add git@github.com:LeoMeinel/ownership.git
git submodule add git@github.com:LeoMeinel/testing.git
git submodule add git@github.com:LeoMeinel/traits.git
git submodule add git@github.com:LeoMeinel/variables.git
git submodule add git@github.com:LeoMeinel/workspaces.git
git submodule init
git submodule sync
git submodule update --remote --merge
git add .
git commit -m "Add submodules" || true
