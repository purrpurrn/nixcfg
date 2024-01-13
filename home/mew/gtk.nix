{ config, pkgs, ... }: {
  config = {
    gtk = {
      enable = true;
      # Cursor
      cursorTheme.name = "Bibata-Modern-Ice";
      cursorTheme.package = pkgs.bibata-cursors;
    };
  };
}
