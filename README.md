# fortran_factory_pattern
Open-closed factories in modern Fortran using C bindings.

The implentation allows new modules to add constructors for new derived types without modifying the code of the factory.
To achieve that, the new constructor is registered in the factory inside a subroutine with C bindings.

