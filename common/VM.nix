{ config, pkgs, lib, ... }: let
  gpuIDs = [
    "1002:15d8" # Graphics
    "1022:15e3" # Audio
  ];
in {
  config = {
    boot.kernelParams = [ 
      "amd_iommu=on" 
      #("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs) 
    ];

    boot.initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
    ];

    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
