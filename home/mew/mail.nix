{ config, pkgs, ... }: {
  config = {
    accounts.email.accounts.personal = {
      primary = true;
      #folders = {
      #  inbox = "Inbox";
      #};
      realName = "meow";
      userName = "meow";
      address = "scrcpynovideoaudiocodecraw@gmail.com";
      maildir.path = "Personal";
      notmuch.enable = true;
      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
      };
      msmtp = {
        enable = true;
      };
      neomutt = {
        enable = true;
      };
      imap = {
        tls = {
          enable = true;
	  useStartTls = true;
	};
	host = "mail.gmail.com";
	port = 993;
      };
      smtp = {
        tls = {
          enable = true;
	  useStartTls = true;
	};
        host = "smtp.gmail.com";
	port = 587;
      };
    };
  };
}
