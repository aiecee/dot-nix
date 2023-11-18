{ ... }: 

{
	services.xserver = {
		enable = true;
		layout = "gb";
		displayManager.sddm = {
			enable = true;
			theme = "catppuccin-frappe";
		};
	};

}
