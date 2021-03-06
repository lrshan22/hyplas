      SUBROUTINE ORVMMX
     1(   DGAMA   ,NOUTF1   ,NOUTF2  ,NTYPE   ,RSTAVA   ,STRES,
     2    IELEM   ,IINCS    ,IGAUSP  ,OUTDA)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      PARAMETER(IPHARD=4  ,MSTRE=4)
C Arguments
      DIMENSION  RSTAVA(2*MSTRE+1), STRES(*)
C Local arrays and variables
      DIMENSION  BACSTR(MSTRE)
      DATA   R2   ,R3    / 2.0D0,3.0D0 /
C***********************************************************************
C OUTPUT RESULTS (INTERNAL AND ALGORITHMIC VARIABLES) FOR VON MISES
C ELASTO-PLASTIC MATERIAL WITH NON-LINEAR MIXED HARDENING
C***********************************************************************
 1000 FORMAT(' b-xx  = ',G12.4,' b-yy  = ',G12.4,' b-xy  = ',G12.4,
     1       ' b-zz  = ',G12.4)
 1100 FORMAT(' S-eff = ',G12.4,' Eps.  = ',G12.4,' dgama = ',G12.4)
 1205 FORMAT('Result "BACK-STRESS-VARIABLES" "LOAD ANALYSIS"',I3,
     1       ' Vector OnGaussPoints "Board gauss internal"',/,
     2       'ComponentNames "B-XX", "B-YY", "B-XY", "B-ZZ"',/,
     3       'Values')
 1206 FORMAT('Result "INTERNAL-VARIABLES" "LOAD ANALYSIS"',I3,
     1       ' Vector OnGaussPoints "Board gauss internal"',/,
     2       'ComponentNames "S-EFF", "EPS", "DGAMA"',/,
     3       'Values')
 1207 FORMAT('Result "BACK-STRESS-VARIABLES" "LOAD ANALYSIS"',I3,
     1       ' Vector OnNodes ',/,
     2       'ComponentNames "B-XX", "B-YY", "B-XY", "B-ZZ"',/,
     3       'Values')
 1208 FORMAT('Result "INTERNAL-VARIABLES-MAT" "LOAD ANALYSIS"',I3,
     1       ' Vector OnNodes ',/,
     2       'ComponentNames "S-EFF", "EPS", "DGAMA"',/,
     3       'Values')
 1211 FORMAT(I5,2X,3G15.6)
 1213 FORMAT(I5,2X,4G15.6)
 1212 FORMAT(7X,3G15.6)
 1214 FORMAT(7X,4G15.6)
C
C Plane strain and axisymmetric only
      IF(NTYPE.NE.2.AND.NTYPE.NE.3)CALL ERRPRT('EI0050')
C Print backstress tensor
      BACSTR(1)=RSTAVA(6)
      BACSTR(2)=RSTAVA(7)
      BACSTR(3)=RSTAVA(8)
      BACSTR(4)=RSTAVA(9)
	IF(OUTDA.EQ.1)THEN
        WRITE(NOUTF1,1000)BACSTR(1),BACSTR(2),BACSTR(3),BACSTR(4)
c	ELSE
c	   IF(IELEM.EQ.1.AND.IGAUSP.EQ.1.AND.OUTDA.EQ.2)THEN
c	      WRITE(NOUTF2,1205)IINCS
c	   ENDIF
c        WRITE(NOUTF2,1214)BACSTR(1),BACSTR(2),BACSTR(3),BACSTR(4)	  
	ENDIF
C Compute effective stress
      IF(NTYPE.EQ.2.OR.NTYPE.EQ.3)THEN
        P=(STRES(1)+STRES(2)+STRES(4))/R3
        EFFST=SQRT(R3/R2*((STRES(1)-P)**2+(STRES(2)-P)**2+
     1                     R2*STRES(3)**2+(STRES(4)-P)**2))
      ENDIF
      EPBAR=RSTAVA(MSTRE+1)
	IF(IELEM.EQ.1.AND.IGAUSP.EQ.1.AND.OUTDA.EQ.2)THEN
	WRITE(NOUTF2,1206)IINCS
	ELSEIF(IELEM.EQ.1.AND.OUTDA.EQ.3)THEN
	WRITE(NOUTF2,1208)IINCS
	ENDIF
C Write to output file and GiD output file
	   IF(OUTDA.EQ.1)THEN
           WRITE(NOUTF1,1100)EFFST,EPBAR,DGAMA
	   ELSEIF(OUTDA.EQ.2)THEN  
		  IF(IGAUSP.EQ.1)THEN
	        WRITE(NOUTF2,1211)IELEM,EFFST,EPBAR,DGAMA
		  ELSE
		    WRITE(NOUTF2,1212)EFFST,EPBAR,DGAMA
		  ENDIF
	   ELSEIF(OUTDA.EQ.3)THEN
	        WRITE(NOUTF2,1211)IELEM,EFFST,EPBAR,DGAMA
	   ENDIF
      RETURN
      END
