{ config, pkgs, ... }:

{
  home.username = "iijima";
  home.homeDirectory = "/home/iijima";
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.bash-completion
    pkgs.bats
    pkgs.conftest

    pkgs.tenv

    pkgs.aws-vault
    pkgs.google-cloud-sdk
    pkgs.azure-cli

    pkgs.rye
    pkgs.rustup
    pkgs.go
    pkgs.volta

    pkgs.containerd
    pkgs.nerdctl

    pkgs.kubernetes-helm
    pkgs.kubectl
    pkgs.k3d
    pkgs.crossplane-cli
    pkgs.skaffold
    pkgs.tilt

    pkgs.jq
    pkgs.yq
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      k = "kubectl";
    };
    bashrcExtra = ''
      source <(kubectl completion bash)
      complete -o default -F __start_kubectl k
      source <(helm completion bash)
    '';
    profileExtra = ''
      if [ -e /home/iijima/.nix-profile/etc/profile.d/nix.sh ]; then . /home/iijima/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
    '';
  };

  programs.git = {
    enable = true;
    userName = "Kazuyuki Iijima";
    userEmail = "iijimakazuyuki@gmail.com";
    signing = {
      key = "E652F98017AF48B4";
      signByDefault = true;
    };
    extraConfig = {
      core = {
        autocrlf = false;
        filemode = false;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.awscli = {
    enable = true;
    settings = {
      default = {
        region = "ap-norhteast-1";
        output = "json";
      };
    };
  };

  programs.powerline-go = {
    enable = true;
    modules = [ "venv" "user" "host" "ssh" "cwd" "perms" "git" "jobs" "exit" "root" "kube" ];
  };

  programs.rbenv = {
    enable = true;
  };

  programs.vim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.vim-airline
    ];
    settings = {
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      number = true;
    };
    defaultEditor = true;
    extraConfig = ''
      set nocompatible
      set noswapfile
      set autoindent
      set smartindent
      set nobackup
      set softtabstop=4
      set laststatus=2
      set noshowmode
    '';
  };
}
