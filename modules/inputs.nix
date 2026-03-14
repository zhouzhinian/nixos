{inputs, pkgs, ...}: {
      environment.systemPackages = with pkgs; [
	inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
	inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
	 
 ];

}		
