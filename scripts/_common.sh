#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

NODEJS_VERSION="20"

#=================================================
# PERSONAL HELPERS
#=================================================

misskey_build() {
    pushd "$install_dir"
        ynh_use_nodejs
        git submodule update --init 
        corepack enable
        #corepack prepare pnpm@9.5.0 --activate
        ynh_exec_warn_less ynh_exec_as "$app" env "$ynh_node_load_PATH" pnpm install
        #ynh_exec_warn_less ynh_exec_as "$app" env "$ynh_node_load_PATH" pnpm install fluent-emoji -w
        #ynh_exec_warn_less ynh_exec_as "$app" env "$ynh_node_load_PATH" pnpm run build-assets
        ynh_exec_warn_less ynh_exec_as "$app" env "$ynh_node_load_PATH" pnpm run build
        ynh_exec_warn_less ynh_exec_as "$app" env "$ynh_node_load_PATH" pnpm run init
    popd

    ynh_secure_remove --file="$install_dir/.cache"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================
