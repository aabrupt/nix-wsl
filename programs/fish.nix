{pkgs, ...}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza";
      ll = "ls -ahl";
      lt = "ls -hlTL 5";
      rm = "trash put";
      update = "sudo nixos-rebuild switch";
      clear = "clear && pfetch";
      speedtest = "speedtest-rs";
      printpath = "printf %s\\n $PATH | column";
      systempath = "printf %s\\n $PATH | grep -v /mnt | column";
    };

    shellInit = ''
function storePathForWindowsTerminal --on-variable PWD
  if test -n "$WT_SESSION"
    printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
  end
end

function take
  mkdir "$1" -p && cd "$1"
end

fish_config theme choose Nord
    '';

    interactiveShellInit = ''
eval (opam env)
set fish_greeting # Disable greeting

pfetch
    '';
  };
}
