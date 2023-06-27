program main
    use base, only : base_t
    use type1, only : type1_t
    use factory, only : make
    
    class(base_t), allocatable :: base_type
        
    !> Allocate derived type
    call make(base_type, "type_1_t")
    
    !> Check that we got the right type
    call base_type%print_name

end
