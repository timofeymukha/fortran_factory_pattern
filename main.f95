program main
    use base, only : base_t
    use type1, only : type1_t
    use factory, only : make, base_factory
    
    class(base_t), allocatable :: base_type_1
    class(base_t), allocatable :: base_type_2

    ! see if we added the contructors
    write(*,*) "Numeber of types is", base_factory%ntype
        
    !> Allocate derived type using make
    call make(base_type_1, "type1_t")
    
    ! Allocate directly using the factory directly
    call base_factory%constructors(1)%constructor(base_type_2)

    !> Check that we got the right type
    call base_type_1%print_name

    !> Check that we got the right type
    call base_type_2%print_name


end
