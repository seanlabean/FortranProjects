import numpy as np
import h5py

outfile = np.zeros((5,2))
for i in range(5):
    outfile[i] = i

print(outfile)
print(outfile.dtype)

f = h5py.File('TF.hdf5', 'w')
group = f.create_group('MyGroup')
dset = group.create_dataset('FT', data = outfile, dtype = 'd')
