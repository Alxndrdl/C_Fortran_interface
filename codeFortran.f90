! Example 1 : Call a Fortran function that returns an int

FUNCTION functionThatReturnsAnInt() bind(c, name="functionThatReturnsAnInt")
	IMPLICIT NONE
	INTEGER :: functionThatReturnsAnInt

	functionThatReturnsAnInt = 123
END

! Example 2 : Call a Fortran subroutine that takes an array as parameter

SUBROUTINE subroutineThatTakesAnArray(array) bind(c, name="subroutineThatTakesAnArray")
	IMPLICIT NONE
	INTEGER,PARAMETER :: DBL=KIND(0.0D0)
	
	REAL(KIND=DBL),DIMENSION(3,2) :: array
	INTEGER :: i,j
	
	DO i = 1,3
		DO j = 1,2
			array(i,j) = i+(j-1)*3;
		END DO
	END DO
	
END

! Example 3 : Call a Fortran subroutine that takes a complex as parameter

SUBROUTINE subroutineThatTakesAComplex(ioComplex) bind(c, name="subroutineThatTakesAComplex")
	IMPLICIT NONE
	INTEGER,PARAMETER :: CDBL=KIND((0.0D0,0.0D0))
	COMPLEX(KIND=CDBL) :: ioComplex
	
	ioComplex = (7.0, -5.0)
	
END

! Example 4 : Call a C function with its name from Fortran code

FUNCTION callMyCfunction() bind(c, name="callMyCfunction")
	IMPLICIT NONE
	INTEGER :: callMyCfunction
	INTEGER :: res

	call mycfunction(res)
	callMyCfunction = res
END

! Example 5 : Call a C function with its pointer from Fortran code

SUBROUTINE callMyfunctionPtr(functionPtr) bind(c, name="callMyfunctionPtr")
	ABSTRACT INTERFACE
	  SUBROUTINE functionProto(myInt) bind(c)
		INTEGER :: myInt
	  END SUBROUTINE functionProto
	END INTERFACE
	procedure (functionProto), pointer :: functionPtr
	
	call functionPtr(35)
END
