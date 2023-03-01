import numpy as np
import h5py

# This script is built to create a bare-bones representation of the
# data structure in an AREPO output (specifically the cell Coordinates).
# Result: Makes an hdf5 file with an array of 10 3D vectors.
# HDF5 structure - arepo_test.hdf5/PartType0/Coordinates

coords = np.zeros((4,3))
vels = np.zeros((4,3))
mass = np.zeros(4)
dens = np.zeros(4)
eint = np.zeros(4)
#for i in range(len(mass)):
#    coords[i] = [-1.5, 1.5, 0.0]
#    mass[i] = 10.0
coords[0] = [307.58379038431644, 296.06670264057715, 300.0282243435139]
coords[1] = [307.58379038431644, 296.06670264057715, 300.0282243435139]
coords[2] = [306.8695046700308,  295.3524169262915, 300.0282243435139]
coords[3] = [306.8695046700308,  295.3524169262915, 300.0282243435139]

mass[0] = 3.0e-7
mass[1] = 3.0e-7
mass[2] = 4.0e-9
mass[3] = 4.0e-9

vels[0] = [500., 500., 500.]
vels[1] = [500., 500., 500.]
vels[2] = [-600., -600., -600.]
vels[3] = [-600., -600., -600.]

dens[0] = 1.0e-21
dens[1] = 1.0e-21
dens[2] = 2.0e-19
dens[3] = 2.0e-19

eint[0] = 7.0e-3
eint[1] = 7.0e-3
eint[2] = 8.0e-5
eint[3] = 8.0e-5
print(coords, coords.dtype)
print(vels, vels.dtype)
print(mass, mass.dtype)
print(dens, dens.dtype)
print(eint, eint.dtype)

f = h5py.File('voramr_test.hdf5', 'w')
group = f.create_group('PartType0')
dset = group.create_dataset('Coordinates', data = coords, dtype = 'd')
dset = group.create_dataset('Velocities', data = vels, dtype = 'd')
dset = group.create_dataset('Masses', data = mass, dtype = 'd')
dset = group.create_dataset('Density', data = dens, dtype = 'd')
dset = group.create_dataset('InternalEnergy', data = eint, dtype = 'd')
