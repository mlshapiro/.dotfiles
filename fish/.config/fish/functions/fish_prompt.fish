# Customize prompt
function fish_prompt -d "Write out the prompt"
    printf '🐟 %s%s/%s ❯❯ ' \
        (set_color 00d2f5) (basename $PWD) (set_color normal)
end
