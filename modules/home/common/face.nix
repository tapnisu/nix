{pkgs, ...}: let
  githubAvatar = pkgs.fetchurl {
    url = "https://gravatar.com/userimage/251261816/ba46dc9d62611888e26ba7ccc3bcbb76.jpeg?v=1769899883000&size=1024";
    hash = "sha256-UNabYZ5fKJs8uZhxIJL7xKNokaf5jsCV+qoZ9LdkewM=";
  };
in {
  home.file.".face".source = githubAvatar;
  home.file.".face.icon".source = githubAvatar;
}
