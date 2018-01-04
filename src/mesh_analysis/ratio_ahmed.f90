
module ratio
implicit none
contains
 
subroutine test1 (maxi_as)

implicit none
real(8) :: p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z,p4x,p4y,p4z               ! 4 points P(x,y,z) 'the coordinate' of every cell
real(8) :: as, p1p2, p2p3, p3p4, p4p1                                    ! the 4  lengths of the cell
integer :: N
integer :: k,i                                                       
real(8), intent(out) :: maxi_as                                          ! the maximum as for all cells 
character(len=30) :: testfile

  testfile = 'testfile.dat'

open(1,file=testfile)
READ(1,*) N                                                                 ! import the number of cells from the data file    
maxi_as = 0

do i=1, N

read (1,*) k,p1x,p1y,p1z,p2x,p2y,p2z,p3x,p3y,p3z,p4x,p4y,p4z                 ! import the date of points from the data file



p1p2=(((p2x-p1x)**2)+(((p2y-p1y)**2))+(((p2z-p1z)**2)))**0.5
p2p3=(((p3x-p2x)**2)+(((p3y-p2y)**2))+(((p3z-p2z)**2)))**0.5
p3p4=(((p4x-p3x)**2)+(((p4y-p3y)**2))+(((p4z-p3z)**2)))**0.5
p4p1=(((p4x-p1x)**2)+(((p4y-p1y)**2))+(((p4z-p1z)**2)))**0.5


as=(max(p1p2,p2p3,p3p4,p4p1))/(min(p1p2,p2p3,p3p4,p4p1))                    ! the aspect ratio of every cell

maxi_as = max(maxi_as, as)

end do


 close(1)
end subroutine test1

end module ratio

