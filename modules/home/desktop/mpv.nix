{...}: {
  programs.mpv = {
    enable = true;

    config = {
      autocreate-playlist = "filter";

      audio-file-auto = "fuzzy";
      audio-file-paths = "**";
      sub-auto = "fuzzy";
      sub-file-paths = "**";

      save-watch-history = "yes";
      save-position-on-quit = "yes";
      write-filename-in-watch-later-config = "yes";

      screenshot-directory = "~/Pictures/Mpv Screenshots";
      screenshot-template = "%F-%P";

      cache = "yes";
      cache-secs = 60;
      demuxer-max-bytes = "512MiB";
      demuxer-readahead-secs = 30;

      ytdl-raw-options = "proxy=[http://localhost:10808]";
    };
  };

  xdg.configFile."mpv/scripts/fuzzydir.lua" = {
    source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/sibwaf/mpv-scripts/e4fb662207e024f26d7763c9551e429898267974/fuzzydir.lua";
      sha256 = "0iq13izyzjjvhq9zhl7yyijx25b8j1ardankbxp81r51b1p23mh3";
    };
  };

  xdg.mimeApps.defaultApplications = {
    "video/mp4" = "mpv.desktop";
    "video/x-matroska" = "mpv.desktop";
    "video/webm" = "mpv.desktop";
    "video/avi" = "mpv.desktop";
    "video/x-msvideo" = "mpv.desktop";
    "video/quicktime" = "mpv.desktop";
    "video/mpeg" = "mpv.desktop";
    "video/x-flv" = "mpv.desktop";
    "video/x-ogm+ogg" = "mpv.desktop";
    "video/3gpp" = "mpv.desktop";
    "video/3gpp2" = "mpv.desktop";

    "audio/mp3" = ["mpv.desktop"];
    "audio/mpeg" = ["mpv.desktop"];
    "audio/flac" = ["mpv.desktop"];
    "audio/ogg" = ["mpv.desktop"];
    "audio/wav" = ["mpv.desktop"];
    "audio/aac" = ["mpv.desktop"];
    "audio/m4a" = ["mpv.desktop"];
    "audio/x-matroska" = ["mpv.desktop"];
  };
}
