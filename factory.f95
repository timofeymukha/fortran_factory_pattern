module factory
    use base, only : base_t
    implicit none
      
    !> Bundles a string name with a pointer to a constructor subroutine
    type named_contstructor_t
        procedure(constructor_intrf), pointer, nopass :: constructor
        character(50) :: name = ""
    end type
        
    !> Holds name constructors for all derived types of base_t
    type factory_t
        integer :: ntype = 0
        type(named_contstructor_t) :: constructors(10)
    end type

    !> The singleton factory object for all derived types of base_t
    type(factory_t) :: base_factory
        
    !> The interface for the run-time selectable constructor
    abstract interface
        subroutine constructor_intrf(object)
            import base_t
            implicit none
            class(base_t), allocatable :: object
        end subroutine
    end interface
        
        
    contains
        !> Register a constructor for a dervied type in the factory
        subroutine register(constructor, name)
            procedure(constructor_intrf) :: constructor
            character(*) :: name
            integer :: ntype
            
            base_factory%ntype = base_factory%ntype + 1
            ntype = base_factory%ntype

            base_factory%constructors(ntype)%constructor => constructor
            base_factory%constructors(ntype)%name = trim(name)
        end
    
        !> Create an object of derived type, given its name
        subroutine make(object, name)
            class(base_t), allocatable :: object
            character(*) :: name
            integer i
    
            ! Just a linear search through names
            do i = 1, base_factory%ntype
                if (base_factory%constructors(i)%name == name) then
                    call base_factory%constructors(i)%constructor(object)
                end if
            end do
        end
end module