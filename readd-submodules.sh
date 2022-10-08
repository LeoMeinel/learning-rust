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
git submodule init
git submodule update
{
    git submodule deinit -f --all
    rm -rf "${DIR:?}/"0_template
    rm -rf "${DIR:?}/"app_cli_iterators
    rm -rf "${DIR:?}/"app_cli
    rm -rf "${DIR:?}/"box_smart_pointer
    rm -rf "${DIR:?}/"closures
    rm -rf "${DIR:?}/"collections
    rm -rf "${DIR:?}/"deref_trait
    rm -rf "${DIR:?}/"drop_trait
    rm -rf "${DIR:?}/"enums
    rm -rf "${DIR:?}/"error_handling
    rm -rf "${DIR:?}/"generic_types
    rm -rf "${DIR:?}/"guessing_game
    rm -rf "${DIR:?}/"hello_world
    rm -rf "${DIR:?}/"iterators
    rm -rf "${DIR:?}/"leomeinel_sample
    rm -rf "${DIR:?}/"lifetimes
    rm -rf "${DIR:?}/"module_system
    rm -rf "${DIR:?}/"ownership
    rm -rf "${DIR:?}/"testing
    rm -rf "${DIR:?}/"traits
    rm -rf "${DIR:?}/"variables
    rm -rf "${DIR:?}/"workspaces
    rm -rf "${DIR:?}/".git/modules/0_template
    rm -rf "${DIR:?}/".git/modules/app_cli_iterators
    rm -rf "${DIR:?}/".git/modules/app_cli
    rm -rf "${DIR:?}/".git/modules/box_smart_pointer
    rm -rf "${DIR:?}/".git/modules/closures
    rm -rf "${DIR:?}/".git/modules/collections
    rm -rf "${DIR:?}/".git/modules/deref_trait
    rm -rf "${DIR:?}/".git/modules/drop_trait
    rm -rf "${DIR:?}/".git/modules/enums
    rm -rf "${DIR:?}/".git/modules/error_handling
    rm -rf "${DIR:?}/".git/modules/generic_types
    rm -rf "${DIR:?}/".git/modules/guessing_game
    rm -rf "${DIR:?}/".git/modules/hello_world
    rm -rf "${DIR:?}/".git/modules/iterators
    rm -rf "${DIR:?}/".git/modules/leomeinel_sample
    rm -rf "${DIR:?}/".git/modules/lifetimes
    rm -rf "${DIR:?}/".git/modules/module_system
    rm -rf "${DIR:?}/".git/modules/ownership
    rm -rf "${DIR:?}/".git/modules/testing
    rm -rf "${DIR:?}/".git/modules/traits
    rm -rf "${DIR:?}/".git/modules/variables
    rm -rf "${DIR:?}/".git/modules/workspaces
    rm -rf "${DIR:?}/".gitmodules
} || echo "Warning: No submodules to deinitialize!"
git add .
git commit -m "Remove submodules"
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
git commit -m "Add submodules"
