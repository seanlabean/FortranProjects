import numpy as np
import h5py

# This script is built to create a bare-bones representation of the
# data structure in an AREPO output (specifically the cell Coordinates).
# Result: Makes an hdf5 file with an array of 10 3D vectors.
# HDF5 structure - arepo_test.hdf5/PartType0/Coordinates

outfile = np.zeros((10,3))
for i in range(10):
    outfile[i] = [-1.5, 1.5, 0.0]

print(outfile)
print(outfile.dtype)

f = h5py.File('arepo_test.hdf5', 'w')
group = f.create_group('PartType0')
dset = group.create_dataset('Coordinates', data = outfile, dtype = 'd')
