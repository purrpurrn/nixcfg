{ config, pkgs, ... }: {
  programs.mpv = {
    enable = true;
    
    bindings = {
      # uosc subtitles
      v = "script-message-to uosc subtitles";
      V = "cycle sub-visibility";

      c = "script-binding uosc/chapters"; # uosc chapter menu
      "/" = "script-binding uosc/menu"; # uosc main menu
      w = "script-binding uosc/stream-quality"; # uosc stream quality menu
      W = "script-binding seekto/toggle-seeker"; # Seek to XX:XX
      Q = "script-binding uosc/open-file"; # uosc file menu
      q = "script-binding uosc/playlist"; # uosc playlist menu
      M = "script-binding uosc/audio"; # uosc audio menu

      # Unbinds keys
      e = "ignore";
      ENTER = "ignore";

      # misc
      "Shift+ESC" = "quit";
      U = "cycle sub-ass-vsfilter-aspect-compat"; # toggle stretching SSA/ASS subtitles with anamorphic videos to match the historical rendere cycle deband
      t = "cycle ontop";
      T = "script-binding webtorrent/toggle-info"; # torrent file seeding and download info
      d = "cycle deband";
      D = "cycle deinterlace";
      "]" = "seek 90";
      "}" = "seek -90";

      # playlist forward and prev
      "." = "playlist-next";
      "," = "playlist-prev";
      ">" = "frame-step";
      "<" = "frame-back-step";
    };
    defaultProfiles = [ "gpu-hq" ];
    config = {
      # General & OSD
      keep-open = true;
      save-position-on-quit = true;
      osd-bar = false;
      cursor-autohide = 700;
      osd-fractions = "";
      border = false;

      # Video
      vo = "gpu-next";
      hwdec = "vaapi";

      # Audio
      volume-max = 150;
      subs-with-matching-audio = false;

      # Screenshots
      screenshot-format = "png";
      screenshot-high-bit-depth = true;
      screenshot-png-compression = 6;
      screenshot-template = "%f-#%#00n";

      # Deband
      deband = false;
      deband-iterations = 4;
      deband-threshold = 48;
      deband-range = 16;
      deband-grain = 4;

      # Dither
      dither-depth = "auto";
      dither = "fruit";
      error-diffusion = "sierra-lite";

      # Anti-Ringing
      scale-antiring = 0.7;
      dscale-antiring = 0.7;
      cscale-antiring = 0.7;

      # Subtitles & Audio
      demuxer-mkv-subtitle-preroll = true;
      sub-auto = "fuzzy";
      slang = [ 
        "de"
	"deDE"
	"ger"
	"deu"
	"en"
	"enEN"
	"eng" ];
      alang = [ 
        "de"
        "deDE"
        "ger"
	"jp"
        "jpn"
        "jap"
        "en"
        "enEN"
        "eng"
      ];
    };

    scripts = with pkgs.mpvScripts; [
      uosc
      mpris
      seekTo
      mpv-webm
      autoload
      thumbfast
      webtorrent-mpv-hook
      blacklistExtensions
    ];
    scriptOpts = {
      blacklist_extensions = {
        blacklist = "png, jpg, jpeg, heic";
	oneshot = true;
      };
      thumbfast = {
        max_height = 240;
	max_width = 240;

	network = true;
      };
      webm = {
        keybind = "a";
	target_filesize = 25000;
	crf = 30;
      };
      uosc = {
        progress = "never";
        scale = 1.3; # uosc ui scaling
	proximity_in = 5;
	proximity_out = 35;
	autohide = true; # autohide uosc ui if mouse autohides.
	disable_elements = "volume, pause_indicator, speed";
      };
    };

    profiles = {
      # Loops GIF & similar files
      "extension.gif" = {
        osc = false;
	save-position-on-quit = false;
	no-resume-playback = "";
	loop-file = "";
      };
      "extension.apng" = {
        profile = "extension.gif";
      };
      "extension.png" = {
        profile = "extension.gif";
      };
      "extension.jpg" = {
        profile = "extension.gif";
      };
      "extension.jpeg" = {
        profile = "extension.gif";
      };
      
      "extension.opus" = {
        save-position-on-quit = false;
      };
      "extension.mp3" = {
        profile = "extension.opus";
      };
      "extension.m4a" = {
        profile = "extension.opus";
      };
      "extension.ogg" = {
        profile = "extension.opus";
      };
      "extension.oga" = {
        profile = "extension.opus";
      };
      "extension.flac" = {
        profile = "extension.opus";
      };
      "extension.wav" = {
        profile = "extension.opus";
      };
      "extension.aac" = {
        profile = "extension.opus";
      };
      "extension.mogg" = {
        profile = "extension.opus";
      };
      "extension.wma" = {
        profile = "extension.opus";
      };
    };
  };
}
