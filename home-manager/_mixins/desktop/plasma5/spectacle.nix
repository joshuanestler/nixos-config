{ config, username, ... }: {
  programs.plasma = {
    
    spectacle.shortcuts = {
      "captureRectangularRegion" = "Meta+Shift+S";
    };

    configFile."spectaclerc" = {
      "General"."autoSaveImage" = true;
      "General"."clipboardGroup" = "PostScreenshotCopyImage";
      
      "Save"."defaultSaveLocation" = "file:///home/${username}/Pictures/Screenshots";
    };
  };
}