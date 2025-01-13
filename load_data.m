warnState = warning('off', 'MATLAB:table:ModifiedAndSavedVarnames');
home = pwd();
data = struct();
folder_path_data = uigetdir("data\", "Load Data");
contents = dir(folder_path_data);
contents = contents([contents.isdir] & ~ismember({contents.name}, {'.', '..'}));
for i = 1:length(contents)
    savepoint = pwd();
    indiv_dir = fullfile(folder_path_data, contents(i).name);
    cd(indiv_dir);
    csv_files = dir('*.csv');
    for j = 1:length(csv_files)
        name = erase(csv_files(j).name, ".csv");
        array = table2array(readtable(csv_files(j).name));
        data.(name).raw = array * 1000;
    end
    cd(savepoint);
end
cd(home);
clearvars -except folder_path_data data