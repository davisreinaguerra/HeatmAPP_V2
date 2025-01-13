import pandas as pd
import os
import glob
import easygui

def load_and_combine_csv(directory):
    # Find all CSV files in the specified directory
    csv_files = glob.glob(os.path.join(directory, '*.csv'))

    # Combine all CSV files into one DataFrame
    combined_df = pd.concat((pd.read_csv(file) for file in csv_files), ignore_index=True)
    return combined_df

# Prompt user to select a directory
directory_path = easygui.diropenbox(msg="Select the directory containing CSV files")

if directory_path:
    # Load and combine CSV files
    combined_data = load_and_combine_csv(directory_path)

    # Prompt user to specify the output file name
    output_file_name = easygui.filesavebox(msg="Save combined CSV as", default="combined_data.csv", filetypes=["*.csv"])

    if output_file_name:
        # Save the combined DataFrame to a new CSV file
        combined_data.to_csv(output_file_name, index=False)
        print(f"Combined data saved to {output_file_name}")
    else:
        print("No output file name specified.")
else:
    print("No directory selected.")
