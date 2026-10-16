{ config, lib, pkgs, ... }:

 {
  programs.nano.enable = true;
  programs.nano.syntaxHighlight = true;
  programs.nano.nanorc = "
 set linenumbers
 set tabsize 8
 set titlecolor bold,white,blue
 set promptcolor lightwhite,grey
 set statuscolor bold,white,green
 set errorcolor bold,white,red
 set spotlightcolor black,lightyellow
 set selectedcolor lightwhite,magenta
 set stripecolor ,#444
 set scrollercolor cyan
 set numbercolor cyan
 set keycolor cyan
 set functioncolor green

## In root's .nanorc you might want to use:
 set titlecolor bold,white,magenta
 set promptcolor black,yellow
 set statuscolor bold,white,magenta
 set errorcolor bold,white,red
 set spotlightcolor black,orange
 set selectedcolor lightwhite,cyan
 set stripecolor ,yellow
 set scrollercolor magenta
 set numbercolor magenta
 set keycolor lightmagenta
 set functioncolor magenta
";
}
