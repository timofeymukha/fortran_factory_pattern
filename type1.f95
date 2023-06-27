module type1
    use iso_c_binding
    use base, only: base_t
    use factory
    implicit none

    type, extends(base_t) :: type1_t
        contains
            procedure, nopass :: print_name
    end type

contains
    
    subroutine make_type1(object)
        class(base_t), allocatable :: object

        write(*,*) "Making type1_t"
        allocate(type1_t :: object)
    end subroutine
    

    function register_type1_constructor() result(err) bind(c)
        integer(c_int) :: err
        
        call register(make_type1, "type1_t")
        write(*,*) "Registered type_1_t"
        err = 0
    end

    subroutine print_name()
        write(*,*) "I am type1_t"
    end subroutine
        
end module
