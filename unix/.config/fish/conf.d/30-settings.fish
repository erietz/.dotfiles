# set -g fish_key_bindings fish_vi_key_bindings

# Why This Causes Weirdness

# When you do:

# set -g fish_key_bindings fish_vi_key_bindings


# you are telling fish to run that function at startup, but you are not using
# fish_user_key_bindings, which is the proper extension point.

# Fish initializes key bindings like this:

# It reads fish_key_bindings

# It runs that function

# It later runs fish_user_key_bindings (if defined)

# If you bind keys outside of fish_user_key_bindings, or mix in other bindings
# (like your fzf-history-widget), they can stomp parts of the vi maps.

# That’s why k works initially but breaks after mode switching — the keymaps
# are being re-entered without your overrides applied consistently.

function fish_user_key_bindings
    fish_vi_key_bindings
end
