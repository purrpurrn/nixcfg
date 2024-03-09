{ config, lib, pkgs, modulesPath, ... }: {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelPackages = pkgs.linuxPackages; # Kernel
  # Audio
  boot.extraModprobeConfig = ''
    options snd-hda-intel patch=hda-jack-retask.fw
  ''; 
  hardware.firmware = [
    (pkgs.callPackage ./audio {})
  ];

  # impermanence 
  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=2G" "mode=755" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5304-83E9";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/2c39a04e-afcf-4e5c-bd1f-d0aebca282a9";
      fsType = "btrfs";
      neededForBoot = true;
    };

  fileSystems."/etc/nixos" =
    { device = "/nix/persist/etc/nixos";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/home/mew/.ssh" =
    { device = "/nix/persist/home/mew/.ssh";
      fsType = "none";
      depends = [ "/nix/persist" ];
      options = [ "bind" ];
    };

  fileSystems."/etc/sshd" =
    { device = "/nix/persist/etc/sshd";
      fsType = "none";
      depends = [ "/nix/persist" ];
      options = [ "bind" ];
    };

  fileSystems."/var/log" =
    { device = "/nix/persist/var/log";
      fsType = "none";
      options = [ "bind" ];
    };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Sound/Speaker Settings
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Swap
  swapDevices = [{
    device = "/dev/nvme0n1p5";
    randomEncryption.enable = true;
  }];

  # vulkan fix
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [
      pkgs.vulkan-loader
      pkgs.vulkan-validation-layers
      pkgs.vulkan-extension-layer
    ];
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
