{ config, pkgs, lib, ... }: {
  config = {
    services.miniflux = {
       enable = true;
       createDatabaseLocally = true;
       adminCredentialsFile = pkgs.writeText "admin-credentials" ''
         ADMIN_USERNAME=admin
	 ADMIN_PASSWORD=password
       '';
    };
  };
}
