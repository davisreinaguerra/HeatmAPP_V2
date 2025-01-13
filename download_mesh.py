import easygui
from brainrender import Scene
import os
import numpy as np

scene = Scene(atlas_name="allen_mouse_25um")
structure_id = easygui.enterbox("Allen Structure Code:", "Input")

print(structure_id)

lowpoly_verts = []
verts = []
com = []
bounds = []

structure = scene.add_brain_region(structure_id)
mesh = structure.mesh
lowpoly_verts = mesh.vertices
subdivided_mesh = mesh.subdivide(method=1, n=3)
subdivided_mesh_verts = subdivided_mesh.vertices
com = subdivided_mesh.center_of_mass()
bounds = subdivided_mesh.bounds()


try:

    print("Lowpoly Verts:")
    print(lowpoly_verts)
    print("Vertices:")
    print(subdivided_mesh_verts)
    print("Center of Mass:")
    print(com)
    print("Bounds:")
    print(bounds)

    base_dir = r"C:\Users\davis\OneDrive\Desktop\heatmAPP_V2\shadows"
    structure_dir = os.path.join(base_dir, structure_id)
    os.makedirs(structure_dir, exist_ok=True)

    np.savetxt(os.path.join(structure_dir, "low_poly.csv"), lowpoly_verts, delimiter=",", header="x,y,z", comments="")
    np.savetxt(os.path.join(structure_dir, "vertices.csv"), subdivided_mesh_verts, delimiter=",", header="x,y,z", comments="")
    np.savetxt(os.path.join(structure_dir, "center_of_mass.csv"), [com], delimiter=",", header="x,y,z", comments="")
    np.savetxt(os.path.join(structure_dir, "bounds.csv"), [bounds], delimiter=",", header="min_x,min_y,min_z,max_x,max_y,max_z", comments="")

    print(f"Data saved to folder: {structure_dir}")

except Exception as e:
    print(f"Check the acronyms at https://mouse.brain-map.org/experiment/thumbnails/100048576?image_type=atlas")
    print("---")
    print(f"Error according to python: {e}")

