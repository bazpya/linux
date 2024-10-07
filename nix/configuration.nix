{ config, pkgs, ... }:

{
  # ============================  General  ============================

  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  imports =
    [
      ./hardware-configuration.nix   # Include the results of the hardware scan.
    ];

  # services.xserver.libinput.enable = true;  # Enable touchpad support (enabled default in most desktopManagers)

  # ============================  Bootloader  ============================

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;  # Time to show generation selection screen

  # ============================  Kernel  ============================

  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;
  # boot.kernelParams = [ "i915.force_probe=46d1" ];

  # ============================  Graphics  ============================

  # hardware.opengl = {
  #     enable = true;
  #     extraPackages = with pkgs; [
  #       # ... # your Open GL, Vulkan and VAAPI drivers
  #       # vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
  #       # onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
  #       intel-media-sdk   # for older GPUs
  #     ];
  #   };

  # ============================  GUI  ============================

  services.xserver = {
    enable = true;  # X11 windowing system
    desktopManager.lxqt.enable = true;  # Desktop environment
  };
  services.displayManager = {
    sddm.enable = true;  # Display manager
    autoLogin.enable = true;
    autoLogin.user = "baz";
  };

  # ============================  Networking  ============================
  networking = {
    networkmanager.enable = true;  # Enable networking
    hostName = "baznix";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    firewall = {
      enable = false;  # Disable the firewall altogether
      # checkReversePath = false;
      # allowedTCPPorts = [ ... ];  # Open ports in the firewall
      # allowedUDPPorts = [ ... ];  # Open ports in the firewall
    };
  };

  # ============================  Language  ============================

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver.xkb = {  # keymap in X11
    layout = "gb";
    variant = "";
  };

  console.keyMap = "uk";  # keymap in console

  # ============================  Sound  ============================

  hardware.pulseaudio.enable = false;  # Enable sound with pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;  # If you want to use JACK applications, uncomment this
  };

  # ============================  Users  ============================

  users.users.baz = {  # Don't forget to set a password with ‘passwd’.
    isNormalUser = true;
    description = "baz";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    ];
  };
  nix.settings.allowed-users = [ "baz" ];

  # ============================  Programs  ============================

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. 
  environment.systemPackages = with pkgs; [  # To search, run: nix search wget
    pkgs.keepassxc
    pkgs.gimp
    pkgs.whatsapp-for-linux
    pkgs.python3
    dropbox
    google-chrome
    vscode
    git
    docker-compose
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.

  programs = {
    git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # ============================  Services  ============================

  # services.openssh.enable = true;  # Enable the OpenSSH daemon
  services.printing.enable = true;  # Enable CUPS to print documents
}
