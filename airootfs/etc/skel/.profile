append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
append_path '~/.local/bin'
export PATH
source $HOME/.bashrc
echo "~/.profile has been loaded" > $HOME/.cache/is-my-profile-loaded
