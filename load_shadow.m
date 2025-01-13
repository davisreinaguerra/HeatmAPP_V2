home = pwd();
folder_path_shadow = uigetdir("shadows\", "Load Shadow");
cd(folder_path_shadow);
load("shadow.mat")
cd(home)