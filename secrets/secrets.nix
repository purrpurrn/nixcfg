let
    mew = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECYYyYEkIbjJ5FBat3Hk6W7HIoFUT+3IFbvRtF8G5mi";
    users = [ mew ];
in {
  "mew_password".publicKeys = [ mew ];
}
