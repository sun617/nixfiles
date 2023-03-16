{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "solarized_dark";
      editor = {
        cursorline = true;
        true-color = true;
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        indent-guides = {
          render = true;
        };
        soft-wrap = {
          enable = true;
        };
      };
      keys.normal = {
        space.w = ":w";
        space.q = ":qa";
      };
    };
    languages = [
      {
        name = "vue";
        language-server = {
          command = "npx";
          args = [
            "--package"
            "@volar/vue-language-server"
            "vue-language-server"
            "--stdio"
          ];
        };
        config = {
          typescript = {
            tsdk = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib";
          };
        };
      }
    ];
  };
}
