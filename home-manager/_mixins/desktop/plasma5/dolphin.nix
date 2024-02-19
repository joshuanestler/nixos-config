{config, ...}: {
  programs.plasma = {
    configFile."dolphinrc" = {
      "DetailsMode"."ExpandableFolders" = false;
      "DetailsMode"."PreviewSize" = 22;
      "DetailsMode"."SidePadding" = 0;
      
      "General"."GlobalViewProps" = false;
      "General"."ShowSpaceInfo" = false;
      "General"."ShowZoomSlider" = false;
      
      "IconsMode"."PreviewSize" = 80;
      
      "KFileDialog Settings"."Places Icons Auto-resize" = false;
      "KFileDialog Settings"."Places Icons Static Size" = 22;

      "MainWindow"."MenuBar" = false;
      "MainWindow"."ToolBarsMovable" = false;
      
      "PreviewSettings"."Plugins" = "audiothumbnail,blenderthumbnail,comicbookthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,directorythumbnail,fontthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,mobithumbnail,opendocumentthumbnail,gsthumbnail,rawthumbnail,svgthumbnail,ffmpegthumbs";
      
      "VersionControl"."enabledPlugins" = "Git";
    };
  };
}