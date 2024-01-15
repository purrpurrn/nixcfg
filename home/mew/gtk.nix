{ config, pkgs, ... }: {
  config = {
    gtk = {
      enable = true;
      # Cursor
      cursorTheme.name = "Bibata-Modern-Ice";
      cursorTheme.package = pkgs.bibata-cursors;

      theme.name = "adw-gtk3";
      theme.package = pkgs.adw-gtk3;

      iconTheme.name = "adwaita-icon-theme";
      iconTheme.package = pkgs.gnome.adwaita-icon-theme;

      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
	'';
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
	'';
      };
    };

    qt = {
      platformTheme = "gtk";
      style.name = "adwaita-dark";
      style.package = pkgs.adwaita-qt;
    };

    home.sessionVariables.GTK_THEME = "adw-gtk3";
    home.packages = [
      pkgs.libadwaita
      pkgs.glib
    ];
  };
}
