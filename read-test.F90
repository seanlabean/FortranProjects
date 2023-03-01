program read_test
  implicit none
  real       :: i, j, k, n
  integer    :: nlines, end
  DOUBLE PRECISION, DIMENSION(:,:), ALLOCATABLE :: coords_dset_data

  open(unit = 55, file = "test.txt", status = 'old')
  print*, "opened file."
  do
    read(55,*,end=999)
    nlines = nlines + 1
  end do
  999 continue
  close(55)

  open(unit = 55, file = "test.txt", status = 'old')
  print*, "num rows: ", nlines
  ALLOCATE(coords_dset_data(3,nlines))
  read(55,*) coords_dset_data(:,:)
  print*, "x: ", coords_dset_data(1,:)
  print*, "y: ", coords_dset_data(2,:)
  print*, "z: ", coords_dset_data(3,:)
end program read_test
