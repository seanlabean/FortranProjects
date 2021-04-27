PROGRAM read_file

USE HDF5

USE HDF5 ! This module contains all necessary modules

IMPLICIT NONE

CHARACTER(LEN=16), PARAMETER  :: filename = "snap_250.hdf5" ! File name
CHARACTER(LEN=16), PARAMETER  :: dsetname = "Coordinates"     ! Dataset name
CHARACTER(LEN=16), PARAMETER :: group1name = "PartType0" ! Group name

INTEGER(HID_T) :: file_id        ! File identifier
INTEGER(HID_T) :: group1_id      ! Group1 identifier
INTEGER(HID_T) :: dset_id        ! Dataset identifier
INTEGER(HID_T) :: space_id       ! Dataspace identifier
INTEGER(HID_T) :: dtype_id       ! Dataspace identifier


INTEGER(KIND=4)     ::   error ! Error flag
INTEGER     ::  i, j, cols, rows

DOUBLE PRECISION, DIMENSION(:,:), ALLOCATABLE :: dset_data
INTEGER(HSIZE_T), DIMENSION(2) :: data_dims
INTEGER(HSIZE_T), DIMENSION(2) :: max_dims                  

print *, 'Starting HDF5 Fortran Read'

print*, 'Initialize FORTRAN interface.'
CALL h5open_f(error)

print*, 'Open the file: ', filename
CALL h5fopen_f (filename, H5F_ACC_RDWR_F, file_id, error)

print*, 'Open the group: ', group1name
CALL h5gopen_f (file_id, group1name, group1_id, error)

print*, 'Open the dataset: ', dsetname
CALL h5dopen_f(group1_id, dsetname, dset_id, error)

print*, 'Get dataspace ID and dimensions.'
!Get dataspace ID
CALL h5dget_space_f(dset_id, space_id, error)

!Get dataspace dims
CALL h5sget_simple_extent_dims_f(space_id,data_dims, max_dims, error)

cols = data_dims(1)
rows = data_dims(2)

print*, 'Number of columns and rows:', cols, rows

print*, ' Dynamically allocate dimensions to dset_data for reading.'
ALLOCATE(dset_data(cols, rows))

print*, 'Reading data...'
CALL h5dread_f(dset_id, H5T_NATIVE_DOUBLE, dset_data, data_dims, error)
print *, 'Data points (0,0), (0,1), (0,2): ', dset_data(0,0), dset_data(0,1), dset_data(0,2)
print *, 'Data points (1,0), (1,1), (1,2): ', dset_data(1,0), dset_data(1,1), dset_data(1,2)

CALL h5gclose_f(group1_id,error)
CALL h5fclose_f(file_id,error)
CALL h5close_f(error)


END PROGRAM read_file
