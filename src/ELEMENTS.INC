C***********************************************************************
C----------------------------------------------------------------------*
C                                                                      *
C                                                                      *
C                  H Y P L A S   ELEMENTS DATABASE                     *
C                                                                      *
C                                                                      *
C----------------------------------------------------------------------*
C***********************************************************************
C
C
C***********************************************************************
C
C 1. Dimensioning parameters associated with the available elements
C
C***********************************************************************
C
      integer mnode, mdofn, mtotg, mevab, mreprp, mieprp
      PARAMETER( MNODE = 8    )
      PARAMETER( MDOFN = 2    )
      PARAMETER( MTOTG = 9    )
      PARAMETER( MEVAB = 16   )
      PARAMETER( MREPRP = 120 )
      PARAMETER( MIEPRP = 40  )
      parameter( mrestv = 100 )
      parameter( miestv = 10  )
C
C
C   * MNODE  = Maximun number of nodes per element.
C
C   * MDOFN  = Maximun number of degrees of freedom per node.
C
C   * MTOTG  = Maximun number of Gauss points allowed in any element.
C
C   * MEVAB  = Maximun number of element variables (degrees of freedom).
C
C   * MREPRP = Maximun number of real element properties that can be
C              stored in array RELPRP for each element type.
C
C   * MIEPRP = Maximun number of integer element properties that can be
C              stored in array IELPRP for each element type.
C
C   * mrestv = Maximun number of real element state variables that can be
C              stored in array RESTV for each element.
C
C   * miestv = Maximun number of integer element state variables that can be
C              stored in array IESTV for each element.
C
C
C
C***********************************************************************
C
C 2. Element classes enumeration
C
C***********************************************************************
C
      INTEGER  FBAR  ,STDARD  ,wsdisc
      PARAMETER( STDARD = 100 )
      PARAMETER( FBAR   = 101 )
      parameter( wsdisc = 102 )
C
C
C   * STDARD = Standard displacement based isoparametric elements.
C
C   * FBAR   = F-bar type elements.
C
c   * WSDISC = Isoparametric elements enriched with weak or strong
c              discontinuity
C
C
C***********************************************************************
C
C 3. Element types enumeration
C
C***********************************************************************
C
      INTEGER  TRI3, QUAD4 ,QUAD8 ,QUA4FB ,q4wsd
      PARAMETER( TRI3   = 1 )
      PARAMETER( QUAD4  = 2 )
      PARAMETER( QUAD8  = 3 )
      PARAMETER( QUA4FB = 4 )
      parameter( q4wsd  = 5 )
C
C   * TRI3   = Standard linear 3-noded triangle.
C
C   * QUAD4  = Standard bi-linear 4-noded quadrilateral.
C
C   * QUAD8  = Standard quadratic 8-noded quadrilateral.
C
C   * QUA4FB = F-Bar 4-noded quadrilateral.
C
c   * q4wsd  = wsdisc enriched bi-linear 4-noded quadrilateral element
c              with 2 additional sampling points in the centroid
C
C
C***********************************************************************
