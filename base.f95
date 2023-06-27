module base
    implicit none
    
    !> The base class
    type, abstract :: base_t
        contains
            procedure, nopass :: print_name
    end type
contains
    subroutine print_name()
        write(*,*) "I am type1_t"
    end subroutine


end module
