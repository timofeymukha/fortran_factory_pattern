module base
    implicit none
    
    !> The base class
    type, abstract :: base_t
        integer :: a = 1
        contains
            procedure, nopass :: print_name
    end type
contains
    subroutine print_name()
        write(*,*) "I am base_t"
    end subroutine


end module
