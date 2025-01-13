import easygui
import os
import pandas as pd

combined_bounds = []
combined_low_poly = []
combined_vertices = []
combined_center_of_mass = []

base_directory = os.path.dirname(__file__)
shadows_directory = os.path.join(base_directory, 'shadows')
contents = os.listdir(shadows_directory)
print("Contents of shadows_directory:", contents)

structure_ids = easygui.enterbox("Names of Structures:", "Input")
structure_ids_array = structure_ids.split(",")

new_folder_name = easygui.enterbox("Enter the name of the new folder:")
new_folder_path = os.path.join(shadows_directory, new_folder_name)
os.makedirs(new_folder_path, exist_ok=True)

for structure in structure_ids_array:
    selected_dir = os.path.join(shadows_directory, structure)
    bounds_path = os.path.join(selected_dir, "bounds.csv")
    combined_bounds.append(pd.read_csv(bounds_path))
    low_poly_path = os.path.join(selected_dir, "low_poly.csv")
    combined_low_poly.append(pd.read_csv(low_poly_path))
    vertices_path = os.path.join(selected_dir, "vertices.csv")
    combined_vertices.append(pd.read_csv(vertices_path))
    center_of_mass_path = os.path.join(selected_dir, "center_of_mass.csv")
    combined_center_of_mass.append(pd.read_csv(center_of_mass_path))

os.chdir(new_folder_path)

# Bounds
combined_bounds = pd.concat(combined_bounds, ignore_index=True)

collapsed_bounds = {
    'min_x': combined_bounds['min_x'].min(),
    'min_y': combined_bounds['min_y'].min(),
    'min_z': combined_bounds['min_z'].min(),
    'max_x': combined_bounds['max_x'].max(),
    'max_y': combined_bounds['max_y'].max(),
    'max_z': combined_bounds['max_z'].max()
}
bounds = pd.DataFrame([collapsed_bounds])
bounds.to_csv("bounds.csv", index=False)

# lowpoly
combined_low_poly = pd.concat(combined_low_poly, ignore_index=True)
combined_low_poly.to_csv("low_poly.csv", index=False)

# vertices
combined_vertices = pd.concat(combined_vertices, ignore_index=True)
combined_vertices.to_csv("vertices.csv", index=False)

# center of mass
combined_center_of_mass = pd.concat(combined_center_of_mass, ignore_index=True)
combined_center_of_mass.to_csv("center_of_mass.csv", index=False)



