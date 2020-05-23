í
QC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Base\BaseRequest.cs
	namespace 	
Application
 
. 
Base 
{ 
public 

abstract 
class 
BaseRequest %
{ 
} 
public 

abstract 
class 
Request !
<! "
T" #
># $
:% &
BaseRequest' 2
,2 3
IRequest4 <
<< =
T= >
>> ?
{		 
public

 
virtual

 
T

 
Id

 
{

 
get

 !
;

" #
set

$ '
;

( )
}

* +
} 
} Á
MC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Base\IEntity.cs
	namespace 	
Application
 
. 
Base 
{ 
public 

	interface 
IRequest 
< 
T 
>  
{ 
T 	
Id
 
{ 
get 
; 
set 
; 
} 
} 
} Ê!
^C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\CompraDetallesRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class  
CompraDetalleRequest %
{ 
public 
double 
Valor 
{ 
get !
;! "
set# &
;& '
}( )
public		 
double		 
Cantidad		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Producto

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public  
CompraDetalleRequest #
(# $
)$ %
{ 	
} 	
public  
CompraDetalleRequest #
(# $'
CompraDetalleRequestBuilder$ ?'
compraDetalleRequestBuilder@ [
)[ \
{ 	
this 
. 
Cantidad 
= '
compraDetalleRequestBuilder 7
.7 8
Cantidad8 @
;@ A
this 
. 
Valor 
= '
compraDetalleRequestBuilder 4
.4 5
Valor5 :
;: ;
this 
. 
Producto 
= '
compraDetalleRequestBuilder 7
.7 8
Producto8 @
.@ A
ToUpperA H
(H I
)I J
;J K
} 	
public  
CompraDetalleRequest #
Map$ '
(' (
CompraDetalle( 5
detalle6 =
)= >
{ 	
this 
. 
Valor 
= 
detalle  
.  !
Valor! &
;& '
this 
. 
Cantidad 
= 
detalle #
.# $
Cantidad$ ,
;, -
this 
. 
Producto 
= 
detalle #
.# $
Producto$ ,
., -
Nombre- 3
;3 4
return 
this 
; 
} 	
public 
class '
CompraDetalleRequestBuilder 0
{   	
public!! 
double!! 
Valor!! 
{!!  !
get!!" %
;!!% &
private!!' .
set!!/ 2
;!!2 3
}!!4 5
public"" 
double"" 
Cantidad"" "
{""# $
get""% (
;""( )
private""* 1
set""2 5
;""5 6
}""7 8
public## 
string## 
Producto## "
{### $
get##% (
;##( )
private##* 1
set##2 5
;##5 6
}##7 8
public$$ '
CompraDetalleRequestBuilder$$ .
($$. /
string$$/ 5
producto$$6 >
)$$> ?
{%% 
this&& 
.&& 
Producto&& 
=&& 
producto&&  (
;&&( )
}'' 
public(( '
CompraDetalleRequestBuilder(( .
SetValor((/ 7
(((7 8
double((8 >
valor((? D
)((D E
{)) 
this** 
.** 
Valor** 
=** 
valor** "
;**" #
return++ 
this++ 
;++ 
},, 
public-- '
CompraDetalleRequestBuilder-- .
SetCantidad--/ :
(--: ;
double--; A
cantidad--B J
)--J K
{.. 
this// 
.// 
Cantidad// 
=// 
cantidad//  (
;//( )
return00 
this00 
;00 
}11 
public22  
CompraDetalleRequest22 '
Build22( -
(22- .
)22. /
{33  
CompraDetalleRequest44 $
compraDetalle44% 2
=443 4
new445 8 
CompraDetalleRequest449 M
(44M N
this44N R
)44R S
;44S T
return55 
compraDetalle55 $
;55$ %
}66 
}77 	
}88 
}99 Ÿ.
VC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\CompraRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class 
CompraRequest 
:  
Request! (
<( )
int) ,
>, -
{		 
public

 
string

 
NitProvedor

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
Usuario 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Total 
{ 
get !
;! "
set# &
;& '
}( )
public 
DateTime 
Fecha 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
<  
CompraDetalleRequest (
>( )
Detalles* 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
CompraRequest 
( 
) 
{ 	
Detalles 
= 
new 
List 
<   
CompraDetalleRequest  4
>4 5
(5 6
)6 7
;7 8
} 	
public 
CompraRequest 
(  
CompraRequestBuilder 1
builder2 9
)9 :
{ 	
this 
. 
Usuario 
= 
builder "
." #
Usuario# *
.* +
ToUpper+ 2
(2 3
)3 4
;4 5
this 
. 
NitProvedor 
= 
builder &
.& '
NitProvedor' 2
;2 3
this 
. 
Fecha 
= 
builder  
.  !
Fecha! &
;& '
this 
. 
Detalles 
= 
builder #
.# $
Detalles$ ,
;, -
} 	
public 
CompraRequest 
Map  
(  !
Compra! '
compra( .
). /
{ 	
this 
. 
Id 
= 
compra 
. 
Id 
;  
this 
. 
NitProvedor 
= 
compra %
.% &
	Proveedor& /
./ 0
Tercero0 7
.7 8
Nit8 ;
;; <
this   
.   
Usuario   
=   
compra   !
.  ! "
Usuario  " )
.  ) *
Usuario  * 1
;  1 2
this!! 
.!! 
Total!! 
=!! 
compra!! 
.!!  
Total!!  %
;!!% &
compra"" 
."" 
DetallesCompra"" !
.""! "
ForEach""" )
("") *
(""* +
detalle""+ 2
)""2 3
=>""4 6
{## 
this$$ 
.$$ 
Detalles$$ 
.$$ 
Add$$ !
($$! "
new$$" % 
CompraDetalleRequest$$& :
($$: ;
)$$; <
.$$< =
Map$$= @
($$@ A
detalle$$A H
)$$H I
)$$I J
;$$J K
}%% 
)%% 
;%% 
return&& 
this&& 
;&& 
}'' 	
public(( 
class((  
CompraRequestBuilder(( )
{)) 	
public** 
string** 
NitProvedor** %
{**& '
get**( +
;**+ ,
private**- 4
set**5 8
;**8 9
}**: ;
public++ 
string++ 
Usuario++ !
{++" #
get++$ '
;++' (
private++) 0
set++1 4
;++4 5
}++6 7
public,, 
DateTime,, 
Fecha,, !
{,," #
get,,$ '
;,,' (
private,,) 0
set,,1 4
;,,4 5
},,6 7
public-- 
List-- 
<--  
CompraDetalleRequest-- ,
>--, -
Detalles--. 6
{--7 8
get--9 <
;--< =
private--> E
set--F I
;--I J
}--K L
public..  
CompraRequestBuilder.. '
(..' (
string..( .
nitProvedor../ :
,..: ;
string..; A
usuario..B I
)..I J
{// 
this00 
.00 
NitProvedor00  
=00! "
nitProvedor00# .
;00. /
this11 
.11 
Usuario11 
=11 
usuario11 &
;11& '
this22 
.22 
Fecha22 
=22 
DateTime22 %
.22% &
Now22& )
;22) *
}33 
public44  
CompraRequestBuilder44 '
SetDetalles44( 3
(443 4
List444 8
<448 9 
CompraDetalleRequest449 M
>44M N
compraDetalles44O ]
)44] ^
{55 
this66 
.66 
Detalles66 
=66 
compraDetalles66  .
;66. /
return77 
this77 
;77 
}88 
public99 
CompraRequest99  
Build99! &
(99& '
)99' (
{:: 
CompraRequest;; 
compra;; $
=;;$ %
new;;& )
CompraRequest;;* 7
(;;7 8
this;;8 <
);;< =
;;;= >
return<< 
compra<< 
;<< 
}== 
}>> 	
}?? 
}@@ ì'
bC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\FabricacionDetalleRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class %
FabricacionDetalleRequest *
{ 
public		 
int		 
IdMateriaPrima		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
private

 
string

 
_nombreMateriaPrima

 *
;

* +
public 
string 
NombreMateriaPrima (
{ 	
get 
=> 
_nombreMateriaPrima &
;& '
set 
=> 
_nombreMateriaPrima &
=' (
value) .
.. /
ToUpper/ 6
(6 7
)7 8
;8 9
} 	
public 
double  
CantidadMateriaPrima *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public %
FabricacionDetalleRequest (
(( )
string) /
nombreMateriaPrima0 B
,B C
double  
cantidadMateriaPrima '
)' (
{ 	
NombreMateriaPrima 
=  
nombreMateriaPrima! 3
;3 4 
CantidadMateriaPrima  
=! " 
cantidadMateriaPrima# 7
;7 8
} 	
public %
FabricacionDetalleRequest (
(( )
)) *
{ 	
} 	
public %
FabricacionDetalleRequest (
(( ),
 FabricacionDetalleRequestBuilder) I
builderJ Q
)Q R
{ 	
this 
. 
NombreMateriaPrima #
=$ %
builder& -
.- .
NombreMateriaPrima. @
;@ A
this   
.   
IdMateriaPrima   
=    !
builder  " )
.  ) *
IdMateriaPrima  * 8
;  8 9
this!! 
.!!  
CantidadMateriaPrima!! %
=!!& '
builder!!( /
.!!/ 0 
CantidadMateriaPrima!!0 D
;!!D E
}"" 	
public$$ %
FabricacionDetalleRequest$$ (
Map$$) ,
($$, -
FabricacionDetalle$$- ?
detalle$$@ G
)$$G H
{%% 	
this&& 
.&& 
IdMateriaPrima&& 
=&&  !
detalle&&" )
.&&) *
MateriaPrimaId&&* 8
;&&8 9 
CantidadMateriaPrima''  
=''! "
detalle''# *
.''* +
Cantidad''+ 3
;''3 4
NombreMateriaPrima(( 
=((  
detalle((! (
.((( )
MateriaPrima(() 5
.((5 6
Nombre((6 <
;((< =
return)) 
this)) 
;)) 
}** 	
public++ 
class++ ,
 FabricacionDetalleRequestBuilder++ 5
{,, 	
public-- 
int-- 
IdMateriaPrima-- %
{--& '
get--( +
;--+ ,
set--- 0
;--0 1
}--2 3
private.. 
string.. 
_nombreMateriaPrima.. .
;... /
public// 
string// 
NombreMateriaPrima// ,
{00 
get11 
=>11 
_nombreMateriaPrima11 *
;11* +
set22 
=>22 
_nombreMateriaPrima22 *
=22+ ,
value22- 2
.222 3
ToUpper223 :
(22: ;
)22; <
;22< =
}33 
public44 
double44  
CantidadMateriaPrima44 .
{44/ 0
get441 4
;444 5
set446 9
;449 :
}44; <
public55 ,
 FabricacionDetalleRequestBuilder55 3
(553 4
int554 7
id558 :
,55: ;
double55< B
cantidad55C K
)55K L
{66 
this77 
.77 
IdMateriaPrima77 #
=77$ %
id77& (
;77( )
this88 
.88  
CantidadMateriaPrima88 )
=88* +
cantidad88, 4
;884 5
}99 
public:: ,
 FabricacionDetalleRequestBuilder:: 3
	SetNombre::4 =
(::= >
string::> D
nombre::E K
)::K L
{;; 
this<< 
.<< 
NombreMateriaPrima<< '
=<<( )
nombre<<* 0
;<<0 1
return== 
this== 
;== 
}>> 
public?? %
FabricacionDetalleRequest?? ,
Build??- 2
(??2 3
)??3 4
{@@ %
FabricacionDetalleRequestAA )
fabricacionDetalleAA* <
=AA= >
newAA? B%
FabricacionDetalleRequestAAC \
(AA\ ]
thisAA] a
)AAa b
;AAb c
returnBB 
fabricacionDetalleBB )
;BB) *
}CC 
}DD 	
}EE 
}FF Ð$
[C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\FabricacionRequest.cs
	namespace		 	
Application		
 
.		 
Request		 
{

 
public 

class 
FabricacionRequest #
:$ %
Request& -
<- .
int. 1
>1 2
{ 
public 
string 
NitEmpleado !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 

IdProducto 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Cantidad 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
Costo 
{ 
get !
;! "
set# &
;& '
}( )
public 
Especificacion 
Especificacion ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< %
FabricacionDetalleRequest -
>- .&
FabricacionDetallesRequest/ I
{J K
getL O
;O P
setQ T
;T U
}V W
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
FabricacionRequest !
(! "
string" (
nitEmpleado) 4
,4 5
int5 8

IdProducto9 C
,C D
double 
cantidad 
, 
double #
costo$ )
,) *
Especificacion+ 9
especificacion: H
,H I
List 
< %
FabricacionDetalleRequest *
>* +&
fabricacionDetallesRequest, F
)F G
{ 	
this 
. 

IdProducto 
= 

IdProducto (
;( )
NitEmpleado 
= 
nitEmpleado %
;% &
Cantidad 
= 
cantidad 
;  
Costo 
= 
costo 
; 
Especificacion 
= 
especificacion +
;+ ,&
FabricacionDetallesRequest &
=' (&
fabricacionDetallesRequest) C
;C D
} 	
public   
FabricacionRequest   !
(  ! "
)  " #
{!! 	
this"" 
."" &
FabricacionDetallesRequest"" +
="", -
new"". 1
List""2 6
<""6 7%
FabricacionDetalleRequest""7 P
>""P Q
(""Q R
)""R S
;""S T
}## 	
public$$ 
FabricacionRequest$$ !
Map$$" %
($$% &
Fabricacion$$& 1
fabricacion$$2 =
)$$= >
{%% 	
this&& 
.&& 
Id&& 
=&& 
fabricacion&& !
.&&! "
Id&&" $
;&&$ %
NitEmpleado'' 
='' 
fabricacion'' %
.''% &
TerceroEmpleado''& 5
.''5 6
Tercero''6 =
.''= >
Nit''> A
;''A B
Cantidad(( 
=(( 
fabricacion(( "
.((" #
Cantidad((# +
;((+ ,
Costo)) 
=)) 
fabricacion)) 
.))  
Costo))  %
;))% &
this** 
.** 
FechaCreacion** 
=**  
fabricacion**! ,
.**, -
FechaCreacion**- :
;**: ;
if++ 
(++ 
fabricacion++ 
.++ 
FabricacionDetalles++ /
!=++0 2
null++3 7
)++7 8
{,, 
fabricacion-- 
.-- 
FabricacionDetalles-- /
.--/ 0
ForEach--0 7
(--7 8
(--8 9
detalle--9 @
)--@ A
=>--B D
{.. 
this// 
.// &
FabricacionDetallesRequest// 3
.//3 4
Add00 
(00 
new00 %
FabricacionDetalleRequest00 5
(005 6
)006 7
.007 8
Map008 ;
(00; <
detalle00< C
)00C D
)00D E
;00E F
}11 
)11 
;11 
}22 
return33 
this33 
;33 
}44 	
}55 
}66 ¬a
XC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\ProductoRequest.cs
	namespace 	
Application
 
. 
Services 
{ 
public		 

class		 
ProductoRequest		  
:		! "
Request		# *
<		* +
int		+ .
>		. /
{

 
private 
string 
_nombreProducto &
;& '
public 
string 
NombreProducto $
{ 	
get 
=> 
_nombreProducto "
;" #
set 
=> 
_nombreProducto "
=# $
value% *
.* +
ToUpper+ 2
(2 3
)3 4
;4 5
} 	
public 
double 
CantidadProducto &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
double !
CostoUnitarioProducto +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
UnidadDeMedida "
UnidadDeMedidaProducto 4
{ 	
get 
; 
set 
; 
} 	
public 
double (
PorcentajeDeUtilidadProducto 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
Especificacion 
Especificacion ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
Tipo 
Tipo 
{ 
get 
; 
set  #
;# $
}% &
public 
List 
< 
FabricacionRequest &
>& ' 
FabricacionesRequest( <
{= >
get? B
;B C
setD G
;G H
}I J
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
SubCategoria "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
ProductoRequest 
( 
)  
{   	 
FabricacionesRequest!!  
=!!! "
new!!# &
List!!' +
<!!+ ,
FabricacionRequest!!, >
>!!> ?
(!!? @
)!!@ A
;!!A B
}"" 	
public$$ 
ProductoRequest$$ 
($$ "
ProductoRequestBuilder$$ 5"
productoRequestBuilder$$6 L
)$$L M
{%% 	
this&& 
.&& 
Id&& 
=&& "
productoRequestBuilder&& ,
.&&, -
Id&&- /
;&&/ 0
this'' 
.'' 
CantidadProducto'' !
=''" #"
productoRequestBuilder''$ :
.'': ;
CantidadProducto''; K
;''K L
this(( 
.(( 
Especificacion(( 
=((  !"
productoRequestBuilder((" 8
.((8 9
Especificacion((9 G
;((G H
this)) 
.)) 
Tipo)) 
=)) "
productoRequestBuilder)) .
.)). /
Tipo))/ 3
;))3 4
this** 
.** !
CostoUnitarioProducto** &
=**' ("
productoRequestBuilder**) ?
.**? @!
CostoUnitarioProducto**@ U
;**U V
this++ 
.++ 
FechaCreacion++ 
=++  "
productoRequestBuilder++! 7
.++7 8
FechaCreacion++8 E
;++E F
this,, 
.,, 
NombreProducto,, 
=,,  !"
productoRequestBuilder,," 8
.,,8 9
NombreProducto,,9 G
;,,G H
this-- 
.-- (
PorcentajeDeUtilidadProducto-- -
=--. /"
productoRequestBuilder--0 F
.--F G(
PorcentajeDeUtilidadProducto--G c
;--c d
this.. 
... 
SubCategoria.. 
=.. "
productoRequestBuilder..  6
...6 7
SubCategoria..7 C
;..C D 
FabricacionesRequest//  
=//! "
new//# &
List//' +
<//+ ,
FabricacionRequest//, >
>//> ?
(//? @
)//@ A
;//A B
}00 	
public22 
ProductoRequest22 
Map22 "
(22" #
Producto22# +
producto22, 4
)224 5
{33 	
this44 
.44 
Id44 
=44 
producto44 
.44 
Id44 !
;44! "
Especificacion55 
=55 
producto55 %
.55% &
Especificacion55& 4
;554 5
Tipo66 
=66 
producto66 
.66 
Tipo66  
;66  !
NombreProducto77 
=77 
producto77 %
.77% &
Nombre77& ,
;77, -
CantidadProducto88 
=88 
producto88 '
.88' (
Cantidad88( 0
;880 1!
CostoUnitarioProducto99 !
=99" #
producto99$ ,
.99, -
CostoUnitario99- :
;99: ;"
UnidadDeMedidaProducto:: "
=::# $
producto::% -
.::- .
UnidadDeMedida::. <
;::< =(
PorcentajeDeUtilidadProducto;; (
=;;) *
producto;;+ 3
.;;3 4 
PorcentajeDeUtilidad;;4 H
;;;H I
FechaCreacion<< 
=<< 
producto<< $
.<<$ %
FechaCreacion<<% 2
;<<2 3
if== 
(== 
producto== 
.== 
Fabricaciones== &
!===' )
null==* .
)==. /
{>> 
producto?? 
.?? 
Fabricaciones?? &
.??& '
ForEach??' .
(??. /
(??/ 0
fabricacion??0 ;
)??; <
=>??= ?
{@@ 
thisAA 
.AA  
FabricacionesRequestAA -
.AA- .
AddAA. 1
(AA1 2
newAA2 5
FabricacionRequestAA6 H
(AAH I
)AAI J
.BB 
MapBB 
(BB 
fabricacionBB (
)BB( )
)BB) *
;BB* +
}CC 
)CC 
;CC 
}EE 
returnFF 
thisFF 
;FF 
}GG 	
publicII 
classII "
ProductoRequestBuilderII +
{JJ 	
publicKK 
intKK 
IdKK 
{KK 
getKK 
;KK  
privateKK! (
setKK) ,
;KK, -
}KK. /
publicLL 
stringLL 
NombreProductoLL (
{MM 
getNN 
;NN 
privateOO 
setOO 
;OO 
}PP 
publicQQ 
doubleQQ 
CantidadProductoQQ *
{QQ+ ,
getQQ- 0
;QQ0 1
privateQQ2 9
setQQ: =
;QQ= >
}QQ? @
publicRR 
doubleRR !
CostoUnitarioProductoRR /
{RR0 1
getRR2 5
;RR5 6
privateRR7 >
setRR? B
;RRB C
}RRD E
publicSS 
UnidadDeMedidaSS !"
UnidadDeMedidaProductoSS" 8
{TT 
getUU 
;UU 
privateVV 
setVV 
;VV 
}WW 
publicXX 
doubleXX (
PorcentajeDeUtilidadProductoXX 6
{XX7 8
getXX9 <
;XX< =
privateXX> E
setXXF I
;XXI J
}XXK L
publicYY 
EspecificacionYY !
EspecificacionYY" 0
{YY1 2
getYY3 6
;YY6 7
privateYY8 ?
setYY@ C
;YYC D
}YYE F
publicZZ 
TipoZZ 
TipoZZ 
{ZZ 
getZZ "
;ZZ" #
privateZZ$ +
setZZ, /
;ZZ/ 0
}ZZ1 2
public[[ 
DateTime[[ 
FechaCreacion[[ )
{[[* +
get[[, /
;[[/ 0
private[[1 8
set[[9 <
;[[< =
}[[> ?
public\\ 
string\\ 
SubCategoria\\ &
{\\' (
get\\) ,
;\\, -
private\\. 5
set\\6 9
;\\9 :
}\\; <
public]] "
ProductoRequestBuilder]] )
(]]) *
int]]* -
id]]. 0
,]]0 1
string]]2 8
nombre]]9 ?
)]]? @
{^^ 
this__ 
.__ 
NombreProducto__ #
=__$ %
nombre__& ,
.__, -
ToUpper__- 4
(__4 5
)__5 6
;__6 7
this`` 
.`` 
Id`` 
=`` 
id`` 
;`` 
}aa 
publiccc "
ProductoRequestBuildercc )
SetCantidadcc* 5
(cc5 6
doublecc6 <
cantidadcc= E
)ccE F
{dd 
thisee 
.ee 
CantidadProductoee %
=ee& '
cantidadee( 0
;ee0 1
returnff 
thisff 
;ff 
}gg 
publichh "
ProductoRequestBuilderhh )
SetCostoUnitariohh* :
(hh: ;
doublehh; A
costohhB G
)hhG H
{ii 
thisjj 
.jj !
CostoUnitarioProductojj *
=jj+ ,
costojj- 2
;jj2 3
returnkk 
thiskk 
;kk 
}ll 
publicmm "
ProductoRequestBuildermm )
SetUnidadDeMedidamm* ;
(mm; <
UnidadDeMedidamm< J
medidammK Q
)mmQ R
{nn 
thisoo 
.oo "
UnidadDeMedidaProductooo +
=oo, -
medidaoo. 4
;oo4 5
returnpp 
thispp 
;pp 
}qq 
publicrr "
ProductoRequestBuilderrr )#
SetPorcentajeDeUtilidadrr* A
(rrA B
doublerrB H 
porcentajeDeUtilidadrrI ]
)rr] ^
{ss 
thistt 
.tt (
PorcentajeDeUtilidadProductott 1
=tt2 3 
porcentajeDeUtilidadtt4 H
;ttH I
returnuu 
thisuu 
;uu 
}vv 
publicww "
ProductoRequestBuilderww )
SetEspecificacionww* ;
(ww; <
Especificacionww< J
especificacionwwK Y
)wwY Z
{xx 
thisyy 
.yy 
Especificacionyy #
=yy$ %
especificacionyy& 4
;yy4 5
returnzz 
thiszz 
;zz 
}{{ 
public|| "
ProductoRequestBuilder|| )
SetTipo||* 1
(||1 2
Tipo||2 6
tipo||7 ;
)||; <
{}} 
this~~ 
.~~ 
Tipo~~ 
=~~ 
tipo~~  
;~~  !
return 
this 
; 
}
€€ 
public
 $
ProductoRequestBuilder
 )
SetFechaCreacion
* :
(
: ;
DateTime
; C
fechaCreacion
D Q
)
Q R
{
‚‚ 
this
ƒƒ 
.
ƒƒ 
FechaCreacion
ƒƒ "
=
ƒƒ# $
fechaCreacion
ƒƒ% 2
;
ƒƒ2 3
return
„„ 
this
„„ 
;
„„ 
}
…… 
public
†† $
ProductoRequestBuilder
†† )
SetSubCategoria
††* 9
(
††9 :
string
††: @
subcategoria
††A M
)
††M N
{
‡‡ 
this
ˆˆ 
.
ˆˆ 
SubCategoria
ˆˆ !
=
ˆˆ" #
subcategoria
ˆˆ$ 0
;
ˆˆ0 1
return
‰‰ 
this
‰‰ 
;
‰‰ 
}
ŠŠ 
public
‹‹ 
ProductoRequest
‹‹ "
Build
‹‹# (
(
‹‹( )
)
‹‹) *
{
ŒŒ 
ProductoRequest
 
productoRequest
  /
=
0 1
new
2 5
ProductoRequest
6 E
(
E F
this
F J
)
J K
;
K L
return
ŽŽ 
productoRequest
ŽŽ &
;
ŽŽ& '
}
 
}
 	
}
‘‘ 
}’’ Í
QC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\Response.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class 
Response 
{ 
public 
string 
Mensaje 
{ 
get  #
;# $
set% (
;( )
}* +
public 
object 
Data 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 î
_C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroEmpleadoRequest.cs
	namespace 	
Application
 
. 
Request 
{		 
public

 

class

 "
TerceroEmpleadoRequest

 '
:

( )
Request

* 1
<

1 2
int

2 5
>

5 6
{ 
public 
TerceroRequest	 
TerceroRequest &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string	 

NitTercero 
{ 
get 
; 
set 

;
 
} 
public "
TerceroEmpleadoRequest	 
(  
string  &

nitTercero' 1
)1 2
{ 

NitTercero 
= 

nitTercero 
; 
} 
public "
TerceroEmpleadoRequest	 
(  
)  !
{ 
} 
public "
TerceroEmpleadoRequest	 
Map  #
(# $
TerceroEmpleado$ 3
empleado4 <
)< =
{ 
this 
. 
Id 

= 
empleado 
. 
Id 
; 
this 
. 

NitTercero 
= 
empleado 
. 
Tercero %
.% &
Nit& )
;) *
FechaCreacion   
=   
empleado   
.   
FechaCreacion   )
;  ) *
TerceroRequest!! 
=!! 
new!! 
TerceroRequest!! &
(!!& '
)!!' (
.!!( )
Map!!) ,
(!!, -
empleado!!- 5
.!!5 6
Tercero!!6 =
)!!= >
;!!> ?
return"" 	
this""
 
;"" 
}## 
}$$ 
}'' ‚
_C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroProvedorRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class "
TerceroProvedorRequest '
:( )
Request* 1
<1 2
int2 5
>5 6
{ 
public		 
TerceroRequest		 
Tercero		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
string

 

NitTercero

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public "
TerceroProvedorRequest %
(% &
TerceroRequest& 4
tercero5 <
)< =
{ 	
this 
. 
Tercero 
= 
tercero "
;" #
this 
. 

NitTercero 
= 
tercero %
.% &

NitTercero& 0
;0 1
} 	
public "
TerceroProvedorRequest %
(% &
)& '
{ 	
} 	
internal "
TerceroProvedorRequest '
Map( +
(+ ,
TerceroProveedor, <
provedor= E
)E F
{ 	
this 
. 
Id 
= 
provedor 
. 
Id !
;! "
this 
. 
FechaCreacion 
=  
FechaCreacion! .
;. /
this 
. 
Tercero 
= 
new 
TerceroRequest -
(- .
). /
./ 0
Map0 3
(3 4
provedor4 <
.< =
Tercero= D
)D E
;E F
return 
this 
; 
} 	
} 
} ñ$
WC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class 
TerceroRequest 
:  !
Request" )
<) *
int* -
>- .
{		 
public

 
string

 

NitTercero

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
private 
string 
_razonSocial #
;# $
public 
string 
RazonSocialTercero (
{ 	
get 
=> 
_razonSocial 
;  
set 
=> 
_razonSocial 
=  !
value" '
.' (
ToUpper( /
(/ 0
)0 1
;1 2
} 	
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
List 
< 
ContactoRequest #
># $
ContactosTercero% 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
TerceroRequest 
( 
) 
{ 	
} 	
public 
TerceroRequest 
( 
string $

nitTercero% /
,/ 0
string1 7
razonSocialTercero8 J
)J K
{ 	

NitTercero 
= 

nitTercero #
;# $
RazonSocialTercero 
=  
razonSocialTercero! 3
;3 4
ContactosTercero 
= 
new "
List# '
<' (
ContactoRequest( 7
>7 8
(8 9
)9 :
;: ;
} 	
public 
TerceroRequest 
Map !
(! "
Tercero" )
tercero* 1
)1 2
{   	
this!! 
.!! 
Id!! 
=!! 
tercero!! 
.!! 
Id!!  
;!!  !
FechaCreacion"" 
="" 
FechaCreacion"" )
;"") *

NitTercero## 
=## 
tercero##  
.##  !
Nit##! $
;##$ %
RazonSocialTercero$$ 
=$$  
tercero$$! (
.$$( )
RazonSocial$$) 4
;$$4 5
if%% 
(%% 
ContactosTercero%%  
!=%%! #
null%%$ (
)%%( )
{&& 
tercero'' 
.'' 
	Contactos'' !
.''! "
ForEach''" )
('') *
(''* +
contacto''+ 3
)''3 4
=>''5 7
{(( 
ContactosTercero)) $
.))$ %
Add))% (
())( )
new))) ,
ContactoRequest))- <
())< =
)))= >
.))> ?
Map** 
(** 
contacto** $
)**$ %
)**% &
;**& '
}++ 
)++ 
;++ 
},, 
return-- 
this-- 
;-- 
}.. 	
}// 
public11 

class11 
ContactoRequest11  
:11! "
Request11# *
<11* +
int11+ .
>11. /
{22 
public33 
string33 
TerceroDireccion33 &
{33' (
get33) ,
;33, -
set33. 1
;331 2
}333 4
public44 
string44  
TerceroNumeroCelular44 *
{44+ ,
get44- 0
;440 1
set442 5
;445 6
}447 8
public55 
string55 
TerceroEmail55 "
{55# $
get55% (
;55( )
internal55* 2
set553 6
;556 7
}558 9
public77 
ContactoRequest77 
Map77 "
(77" #
Contacto77# +
contacto77, 4
)774 5
{88 	
this99 
.99 
TerceroDireccion99 !
=99" #
contacto99$ ,
.99, -
	Direccion99- 6
;996 7
this:: 
.::  
TerceroNumeroCelular:: %
=::& '
contacto::( 0
.::0 1
NumeroCelular::1 >
;::> ?
this;; 
.;; 
TerceroEmail;; 
=;; 
contacto;;  (
.;;( )
Email;;) .
;;;. /
return<< 
this<< 
;<< 
}== 	
}>> 
}?? ®)
^C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroUsuarioRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class !
TerceroUsuarioRequest &
:' (
Request) 0
<0 1
int1 4
>4 5
{		 
public

 
string

 

NitTercero

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
private 
string 
_usuarioTercero &
;& '
public 
string 
UsuarioTercero $
{% &
get' *
=>+ -
_usuarioTercero. =
;= >
set? B
=>C E
_usuarioTerceroF U
=V W
valueX ]
.] ^
ToUpper^ e
(e f
)f g
;g h
}i j
public 
string 
PasswordTercero %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public !
TerceroUsuarioRequest $
($ %
)% &
{ 	
} 	
public !
TerceroUsuarioRequest $
($ %!
TerceroUsuarioBuilder% :!
terceroUsuarioBuilder; P
)P Q
{ 	
this 
. 

NitTercero 
= !
terceroUsuarioBuilder 3
.3 4

NitTercero4 >
;> ?
this 
. 
UsuarioTercero 
=  !!
terceroUsuarioBuilder" 7
.7 8
UsuarioTercero8 F
;F G
this 
. 
PasswordTercero  
=! "!
terceroUsuarioBuilder# 8
.8 9
PasswordTercero9 H
;H I
} 	
public !
TerceroUsuarioRequest $
Map% (
(( )
TerceroUsuario) 7
usuario8 ?
)? @
{ 	
this 
. 
Id 
= 
usuario 
. 
Id  
;  !
this 
. 
FechaCreacion 
=  
usuario! (
.( )
FechaCreacion) 6
;6 7

NitTercero 
= 
usuario  
.  !
Tercero! (
.( )
Nit) ,
;, -
UsuarioTercero   
=   
usuario   $
.  $ %
Usuario  % ,
;  , -
PasswordTercero!! 
=!! 
usuario!! %
.!!% &
Password!!& .
;!!. /
return"" 
this"" 
;"" 
}## 	
public%% 
class%% !
TerceroUsuarioBuilder%% *
{&& 	
public'' 
string'' 

NitTercero'' $
{''% &
get''' *
;''* +
private'', 3
set''4 7
;''7 8
}''9 :
public(( 
string(( 
UsuarioTercero(( (
{(() *
get((+ .
;((. /
private((0 7
set((8 ;
;((; <
}((= >
public)) 
string)) 
PasswordTercero)) )
{))* +
get)), /
;))/ 0
private))1 8
set))9 <
;))< =
}))> ?
public** !
TerceroUsuarioBuilder** (
(**( )
TerceroRequest**) 7
terceroDuvan**8 D
)**D E
{++ 
this,, 
.,, 

NitTercero,, 
=,,  !
terceroDuvan,," .
.,,. /

NitTercero,,/ 9
;,,9 :
}-- 
public// !
TerceroUsuarioBuilder// (

SetUsuario//) 3
(//3 4
string//4 :
usuario//; B
)//B C
{00 
this11 
.11 
UsuarioTercero11 #
=11$ %
usuario11& -
;11- .
return22 
this22 
;22 
}33 
public44 !
TerceroUsuarioBuilder44 (
SetPassword44) 4
(444 5
string445 ;
password44< D
)44D E
{55 
this66 
.66 
PasswordTercero66 $
=66% &
password66' /
;66/ 0
return77 
this77 
;77 
}88 
public99 !
TerceroUsuarioRequest99 (
Build99) .
(99. /
)99/ 0
{:: !
TerceroUsuarioRequest;; %
usuario;;& -
=;;. /
new;;0 3!
TerceroUsuarioRequest;;4 I
(;;I J
this;;J N
);;N O
;;;O P
return<< 
usuario<< 
;<< 
}== 
}>> 	
}?? 
public@@ 

class@@ 

RolRequest@@ 
{AA 
publicBB 
stringBB 
NombreBB 
{BB 
getBB "
;BB" #
setBB$ '
;BB' (
}BB) *
}CC 
}DD ÕC
WC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\CompraService.cs
	namespace 	
Application
 
. 
Services 
{ 
public 

class 
CompraService 
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
CompraService 
( 
IUnitOfWork (

unitOfWork) 3
)3 4
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
HacerCompraService *
(* +
CompraRequest+ 8
request9 @
)@ A
{ 	
TerceroProveedor 
	proveedor &
=' (
this) -
.- .
_unitOfWork. 9
.9 :%
TerceroProvedorRepository: S
.S T
FindBy 
( 
provedor 
=>  "
provedor# +
.+ ,
Tercero, 3
.3 4
Nit4 7
==8 :
request; B
.B C
NitProvedorC N
,N O
includeProperties !
:! "
$str# ,
), -
.- .
FirstOrDefault. <
(< =
)= >
;> ?
if 
( 
	proveedor 
== 
null !
)! "
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$"  ,
 El provedor con identificaciÃ³n   ?
{? @
request@ G
.G H
NitProvedorH S
}S T
"T U
+V W
$"   >
2 no fue encontrado en el sistema, agrÃ©guelo antes   G
"  G H
}!! 
;!! 
}"" 
TerceroUsuario## 
usuario## "
=### $
this##% )
.##) *
_unitOfWork##* 5
.##5 6$
TerceroUsuarioRepository##6 N
.##N O
FindFirstOrDefault$$ "
($$" #
usuario$$# *
=>$$+ -
usuario$$. 5
.$$5 6
Usuario$$6 =
==$$> @
request$$A H
.$$H I
Usuario$$I P
)$$P Q
;$$Q R
if'' 
('' 
usuario'' 
=='' 
null'' 
)''  
{(( 
return)) 
new)) 
Response)) #
{** 
Mensaje++ 
=++ 
$"++  
El usuario ++  +
{+++ ,
request++, 3
.++3 4
Usuario++4 ;
}++; <
"++< =
+++> ?
$",, >
2 no fue encontrado en el sistema, agrÃ©guelo antes,, G
",,G H
}-- 
;-- 
}.. 
var// 
errores// 
=// "
PuedeRegistrarDetalles// 0
(//0 1
request//1 8
.//8 9
Detalles//9 A
)//A B
;//B C
if00 
(00 
errores00 
.00 
Any00 
(00 
)00 
)00 
{11 
return22 
new22 
Response22 #
{33 
Mensaje44 
=44 
string44 $
.44$ %
Join44% )
(44) *
$str44* .
,44. /
errores440 7
)447 8
}55 
;55 
}66 
Compra77 
compra77 
=77 
new77 
Compra77  &
.77& '
CompraBuilder77' 4
(774 5
	proveedor775 >
,77> ?
usuario77@ G
)77G H
.77H I
Build77I N
(77N O
)77O P
;77P Q
request88 
.88 
Detalles88 
.88 
ForEach88 $
(88$ %
(88% &
detalle88& -
)88- .
=>88/ 1
{99 
Producto:: 
producto:: !
=::" #
this::$ (
.::( )
_unitOfWork::) 4
.::4 5
ProductoRepository::5 G
.::G H
FindBy;; 
(;; 
producto;; 
=>;;  "
producto;;# +
.;;+ ,
Nombre;;, 2
==;;3 5
detalle;;6 =
.;;= >
Producto;;> F
,;;F G
includeProperties<< !
:<<! "
$str<<# :
)<<: ;
.<<; <
FirstOrDefault<<< J
(<<J K
)<<K L
;<<L M
CompraDetalle>> 
compraDetalle>> +
=>>, -
new>>. 1
CompraDetalle>>2 ?
.>>? @ 
CompraDetalleBuilder>>@ T
(>>T U
producto>>U ]
,>>] ^
compra>>_ e
)>>e f
.>>f g
SetCantidad?? 
(??  
detalle??  '
.??' (
Cantidad??( 0
)??0 1
.??1 2
SetCostoUnitario??2 B
(??B C
detalle??C J
.??J K
Valor??K P
)??P Q
.??Q R
Build??R W
(??W X
)??X Y
;??Y Z
compraAA 
.AA 

AddDetalleAA !
(AA! "
compraDetalleAA" /
)AA/ 0
;AA0 1
productoBB 
.BB 
AddCompraDetalleBB )
(BB) *
compraDetalleBB* 7
)BB7 8
;BB8 9
}CC 
)CC 
;CC 
thisEE 
.EE 
_unitOfWorkEE 
.EE 
CompraRepositoryEE -
.EE- .
AddEE. 1
(EE1 2
compraEE2 8
)EE8 9
;EE9 :
thisFF 
.FF 
_unitOfWorkFF 
.FF 
CommitFF #
(FF# $
)FF$ %
;FF% &
returnGG 
newGG 
ResponseGG 
{HH 
MensajeII 
=II 
$strII 7
,II7 8
DataJJ 
=JJ 
newJJ 
CompraRequestJJ (
(JJ( )
)JJ) *
.JJ* +
MapJJ+ .
(JJ. /
compraJJ/ 5
)JJ5 6
}KK 
;KK 
}LL 	
privateMM 
IReadOnlyListMM 
<MM 
stringMM $
>MM$ %"
PuedeRegistrarDetallesMM& <
(MM< =
ListMM= A
<MMA B 
CompraDetalleRequestMMB V
>MMV W
detallesMMX `
)MM` a
{NN 	
ListOO 
<OO 
stringOO 
>OO 
erroresOO  
=OO! "
newOO# &
ListOO' +
<OO+ ,
stringOO, 2
>OO2 3
(OO3 4
)OO4 5
;OO5 6
detallesPP 
.PP 
ForEachPP 
(PP 
(PP 
detallePP %
)PP% &
=>PP' )
{QQ 
ProductoRR 
productoRR !
=RR" #
thisRR$ (
.RR( )
_unitOfWorkRR) 4
.RR4 5
ProductoRepositoryRR5 G
.RRG H
FindFirstOrDefaultSS "
(SS" #
productoSS# +
=>SS, .
productoSS/ 7
.SS7 8
NombreSS8 >
==SS? A
detalleSSB I
.SSI J
ProductoSSJ R
)SSR S
;SSS T
ifTT 
(TT 
productoTT 
==TT 
nullTT  $
)TT$ %
erroresUU 
.UU 
AddUU 
(UU  
$"UU  "
El producto UU" .
{UU. /
detalleUU/ 6
.UU6 7
ProductoUU7 ?
}UU? @

 no existeUU@ J
"UUJ K
)UUK L
;UUL M
ifVV 
(VV 
detalleVV 
.VV 
CantidadVV $
<=VV% '
$numVV( )
)VV) *
erroresWW 
.WW 
AddWW 
(WW  
$"WW  "
La cantidad de WW" 1
{WW1 2
detalleWW2 9
.WW9 :
ProductoWW: B
}WWB C
 es invalidaWWC O
"WWO P
)WWP Q
;WWQ R
ifXX 
(XX 
detalleXX 
.XX 
ValorXX !
<=XX" $
$numXX$ %
)XX% &
erroresYY 
.YY 
AddYY 
(YY  
$"YY  "
El valor de YY" .
{YY. /
detalleYY/ 6
.YY6 7
ProductoYY7 ?
}YY? @
 es invalidaYY@ L
"YYL M
)YYM N
;YYN O
}ZZ 
)ZZ 
;ZZ 
return[[ 
errores[[ 
;[[ 
}\\ 	
}]] 
}^^ šF
rC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\FabricacionCrearService.cs
	namespace		 	
Application		
 
.		 
Services		 
.		 
ProductoServices		 /
{

 
public 

class #
FabricacionCrearService (
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public #
FabricacionCrearService &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
IniciarFabricacion *
(* +
FabricacionRequest+ =
request> E
)E F
{ 	
Producto  
productoParaFabricar )
=* +
this 
. 
_unitOfWork 
. 
ProductoRepository 0
.0 1
FindBy 
( 
producto 
=>  "
producto# +
.+ ,
Id, .
==/ 1
request2 9
.9 :

IdProducto: D
,D E
includeProperties !
:! "
$str# 2
)2 3
.3 4
FirstOrDefault4 B
(B C
)C D
;D E
if 
(  
productoParaFabricar $
==% '
null( ,
), -
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$str N
} 
; 
}   
if"" 
(""  
productoParaFabricar"" $
.""$ %
Especificacion""% 3
==""4 6
Especificacion""7 E
.""E F
MateriaPrima""F R
)""R S
{## 
return$$ 
new$$ 
Response$$ #
{%% 
Mensaje&& 
=&& 
$"&&  
El &&  #
{&&# $ 
productoParaFabricar&&$ 8
.&&8 9
Nombre&&9 ?
}&&? @!
 no se puede fabricar&&@ U
"&&U V
}'' 
;'' 
}(( 
TerceroEmpleado** 
empleado** $
=**% &
this**' +
.**+ ,
_unitOfWork**, 7
.**7 8%
TerceroEmpleadoRepository**8 Q
.**Q R
FindBy++ 
(++ 
empleado++ 
=>++  "
empleado++# +
.+++ ,
Tercero++, 3
.++3 4
Nit++4 7
==++8 :
request++; B
.++B C
NitEmpleado++C N
,++N O
includeProperties,, !
:,,! "
$str,,# ,
),,, -
.,,- .
FirstOrDefault,,. <
(,,< =
),,= >
;,,> ?
if.. 
(.. 
empleado.. 
==.. 
null..  
)..  !
{// 
return00 
new00 
Response00 #
{11 
Mensaje22 
=22 
$"22  3
'No hay un empleado con identificaciÃ³n 22  F
{22F G
request22G N
.22N O
NitEmpleado22O Z
}22Z [
"22[ \
}33 
;33 
}44 
if55 
(55 
request55 
.55 &
FabricacionDetallesRequest55 2
.552 3
Count553 8
==559 ;
$num55< =
)55= >
{66 
return77 
new77 
Response77 #
{88 
Mensaje99 
=99 
$"99  /
#Por favor, agregue materias primas 99  C
"99C D
+99E F
$":: 
para fabricar el :: '
{::' ( 
productoParaFabricar::( <
.::< =
Nombre::= C
}::C D
"::D E
};; 
;;; 
}<< 
Fabricacion== 
fabricacion== #
===$ %
new==& )
Fabricacion==* 5
(==5 6
empleado==6 >
)==> ?
;==? @ 
productoParaFabricar>>  
.>>  !
AgregarFabricacion>>! 3
(>>3 4
fabricacion>>4 ?
)>>? @
;>>@ A
ProductoBB 
tempBB 
=BB 
nullBB  
;BB  !
tempCC 
=CC 2
&ComprobarExistenciasDeEnMateriasPrimasCC 9
(CC9 :
requestCC: A
,CCA B
fabricacionCCC N
,CCN O
tempCCP T
)CCT U
;CCU V
ifEE 
(EE 
fabricacionEE 
.EE 
FabricacionDetallesEE /
.EE/ 0
CountEE0 5
!=EE6 8
requestFF 
.FF &
FabricacionDetallesRequestFF 2
.FF2 3
CountFF3 8
)FF8 9
{GG 
ifHH 
(HH 
tempHH 
==HH 
nullHH  
)HH  !
{II 
returnJJ 
newJJ 
ResponseJJ '
{KK 
MensajeLL 
=LL  !
$strLL" '
+LL( )
$"MM 
{MM 
requestMM "
.MM" #&
FabricacionDetallesRequestMM# =
[MM= >
fabricacionMM> I
.MMI J
FabricacionDetallesMMJ ]
.MM] ^
CountMM^ c
]MMc d
.MMd e
NombreMateriaPrimaMMe w
}MMw x
"MMx y
+MMz {
$strNN C
}OO 
;OO 
}PP 
returnQQ 
newQQ 
ResponseQQ #
{RR 
MensajeSS 
=SS 
$"SS  -
!No hay cantidades suficientes de SS  A
{SSA B
tempSSB F
.SSF G
NombreSSG M
}SSM N
, SSN P
"SSP Q
+SSR S
$"TT 
	solo hay TT 
{TT  
tempTT  $
.TT$ %
CantidadTT% -
}TT- .
"TT. /
}UU 
;UU 
}WW 
fabricacionXX 
.XX /
#DescontarCantidadesEnMateriasPrimasXX ;
(XX; <
)XX< =
;XX= >
thisYY 
.YY 
_unitOfWorkYY 
.YY 
ProductoRepositoryYY /
.YY/ 0
EditYY0 4
(YY4 5 
productoParaFabricarYY5 I
)YYI J
;YYJ K
thisZZ 
.ZZ 
_unitOfWorkZZ 
.ZZ 
CommitZZ #
(ZZ# $
)ZZ$ %
;ZZ% &
return[[ 
new[[ 
Response[[ 
{\\ 
Mensaje]] 
=]] 
$str]] f
,]]f g
Data^^ 
=^^ 
request^^ 
.^^ 
Map^^ "
(^^" #
fabricacion^^# .
)^^. /
}__ 
;__ 
}`` 	
privatebb 
Productobb 2
&ComprobarExistenciasDeEnMateriasPrimasbb ?
(bb? @
FabricacionRequestbb@ R
requestbbS Z
,bbZ [
Fabricacioncc 
fabricacioncc #
,cc# $
Productocc% -
tempcc. 2
)cc2 3
{dd 	
foreachee 
(ee %
FabricacionDetalleRequestee .
detalleee/ 6
inee7 9
requestee: A
.eeA B&
FabricacionDetallesRequesteeB \
)ee\ ]
{ff 
Productogg  
productoMateriaPrimagg -
=gg. /
thishh 
.hh 
_unitOfWorkhh $
.hh$ %
ProductoRepositoryhh% 7
.hh7 8
FindFirstOrDefaultii &
(ii& '
productoii' /
=>ii0 2
productoii3 ;
.ii; <
Nombreii< B
==iiC E
detalleiiF M
.iiM N
NombreMateriaPrimaiiN `
)ii` a
;iia b
ifjj 
(jj  
productoMateriaPrimajj (
==jj) +
nulljj, 0
)jj0 1
{kk 
breakll 
;ll 
}mm 
elsenn 
ifnn 
(nn  
productoMateriaPrimann -
.nn- ."
PuedeDescontarCantidadoo *
(oo* +
detalleoo+ 2
.oo2 3 
CantidadMateriaPrimaoo3 G
)ooG H
.ooH I
AnyooI L
(ooL M
)ooM N
)ooN O
{pp 
tempqq 
=qq  
productoMateriaPrimaqq /
;qq/ 0
breakrr 
;rr 
}ss 
fabricaciontt 
.tt 
AgregarDetalleuu 
(uu 
newuu "
FabricacionDetalleuu# 5
(uu5 6
fabricacionuu6 A
,uuA B 
productoMateriaPrimauuC W
,uuW X
detallevv 
.vv  
CantidadMateriaPrimavv ,
)vv, -
)vv- .
;vv. /
}ww 
returnyy 
tempyy 
;yy 
}zz 	
}{{ 
}|| ÷,
jC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductos.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public		 

class		 
ListarProductos		  
{ 
	protected 
readonly 
IUnitOfWork &
_unitOfWork' 2
;2 3
public 
ListarProductos 
( 
IUnitOfWork *

unitOfWork+ 5
)5 6
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
	protected 
List 
< 
ProductoRequest &
>& '%
ConvertirProductoARequest( A
(A B
ListB F
<F G
ProductoG O
>O P
	productosQ Z
)Z [
{ 	
List 
< 
ProductoRequest  
>  !
request" )
=* +
new, /
List0 4
<4 5
ProductoRequest5 D
>D E
(E F
)F G
;G H
	productos 
. 
ForEach 
( 
x 
=>  "
request# *
.* +
Add+ .
(. /
new/ 2
ProductoRequest3 B
(B C
)C D
.D E
MapE H
(H I
xI J
)J K
)K L
)L M
;M N
return 
request 
; 
} 	
public 
Response 
GetAllProductos '
(' (
)( )
{ 	
Response 
productoResponse %
=& '
new( +
Response, 4
(4 5
)5 6
;6 7
productoResponse 
. 
Data !
=" #%
ConvertirProductoARequest$ =
(= >
this 
. 
_unitOfWork  
.  !
ProductoRepository! 3
.3 4
GetAll4 :
(: ;
); <
.< =
ToList= C
(C D
)D E
)E F
;F G
return 
productoResponse #
;# $
} 	
public 
Response 
BuscarProducto &
(& '
int' *
id+ -
)- .
{   	
Producto!! 
producto!! 
=!! 
this!!  $
.!!$ %
_unitOfWork!!% 0
.!!0 1
ProductoRepository!!1 C
.!!C D
FindFirstOrDefault"" "
(""" #
producto""# +
=>"", .
producto""/ 7
.""7 8
Id""8 :
==""; =
id""> @
)""@ A
;""A B
if## 
(## 
producto## 
==## 
null##  
)##  !
{$$ 
return%% 
new%% 
Response%% #
{%%$ %
Mensaje%%& -
=%%. /
$"%%0 2
El producto con Id %%2 E
{%%E F
id%%F H
}%%H I
, no fue encontrado%%I \
"%%\ ]
}%%^ _
;%%_ `
}&& 
return'' 
new'' 
Response'' 
{(( 
Data)) 
=)) 
new)) 
ProductoRequest)) *
())* +
)))+ ,
.)), -
Map))- 0
())0 1
producto))1 9
)))9 :
}** 
;** 
}++ 	
public,, 
Response,, (
BuscarFabricaionesDeProducto,, 4
(,,4 5
int,,5 8
id,,9 ;
),,; <
{-- 	
Producto.. 
producto.. 
=.. 
this..  $
...$ %
_unitOfWork..% 0
...0 1
ProductoRepository..1 C
...C D
FindBy// 
(// 
producto// 
=>//  "
producto//# +
.//+ ,
Id//, .
==/// 1
id//2 4
,//4 5
includeProperties00 !
:00! "
$str00# J
)00J K
.00K L
FirstOrDefault11 
(11 
)11  
;11  !
if22 
(22 
producto22 
==22 
null22  
)22  !
{33 
return44 
new44 
Response44 #
{44$ %
Mensaje44& -
=44. /
$"440 2
El producto con Id 442 E
{44E F
id44F H
}44H I
, no fue encontrado44I \
"44\ ]
}44^ _
;44_ `
}55 
if77 
(77 
producto77 
.77 
Especificacion77 '
==77( *
Especificacion77+ 9
.779 :
MateriaPrima77: F
)77F G
{88 
return99 
new99 
Response99 #
{:: 
Mensaje;; 
=;; 
$";;  
El producto ;;  ,
{;;, -
producto;;- 5
.;;5 6
Nombre;;6 <
};;< =

 no tiene ;;= G
";;G H
+;;I J
$"<< 4
(fabricaiones porque no se puede fabricar<< >
"<<> ?
}== 
;== 
}>> 
return?? 
new?? 
Response?? 
{@@ 
DataAA 
=AA 
newAA 
ProductoRequestAA *
(AA* +
)AA+ ,
.AA, -
MapAA- 0
(AA0 1
productoAA1 9
)AA9 :
}BB 
;BB 
}CC 	
}DD 
}EE õ
qC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductosPorTipo.cs
	namespace		 	
Application		
 
.		 
Services		 
.		 
ProductoServices		 /
{

 
public 

class "
ListarProductosPorTipo '
:( )
ListarProductos* 9
{ 
private 
Tipo 
_tipo 
; 
public "
ListarProductosPorTipo %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
:> ?
base@ D
(D E

unitOfWorkE O
)O P
{ 	
} 	
public "
ListarProductosPorTipo %
EstablecerTipo& 4
(4 5
Tipo5 9
tipo: >
)> ?
{ 	
_tipo 
= 
tipo 
; 
return 
this 
; 
} 	
public 
Response 
Filtrar 
(  
)  !
{ 	
var 
filtrado 
= 
this 
. 
_unitOfWork 
. 
ProductoRepository /
./ 0
GetAll0 6
(6 7
)7 8
.8 9
Where 
( 
x 
=> 
x 
. 
Tipo !
==" $
_tipo% *
)* +
;+ ,
return 
new 
Response 
{ 
Data 
= 
this 
. %
ConvertirProductoARequest 5
(5 6
filtrado6 >
.> ?
ToList? E
(E F
)F G
)G H
} 
; 
} 	
}   
}!! Í
tC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoMateriaPrimaCrear.cs
	namespace		 	
Application		
 
.		 
Services		 
.		 
ProductoServices		 /
{

 
public 

class %
ProductoMateriaPrimaCrear *
:+ ,
ProductoService- <
{ 
public %
ProductoMateriaPrimaCrear (
(( )
IUnitOfWork) 4

unitOfWork5 ?
)? @
:A B
baseC G
(G H

unitOfWorkH R
)R S
{ 	
} 	
public 
override 
Response  
CrearProducto! .
(. /
ProductoRequest/ >
request? F
)F G
{ 	
var 
errores 
= 
ProductoPuedeCrear ,
., -
PuedeCrearProducto- ?
( 
request 
. 
CantidadProducto )
,) *
request 
. !
CostoUnitarioProducto -
)- .
;. /
if 
( 
errores 
. 
Any 
( 
) 
) 
return 
new 
Response #
{$ %
Mensaje& -
=. /
String0 6
.6 7
Join7 ;
(; <
$str< @
,@ A
erroresB I
)I J
}K L
;L M
Producto 
producto 
= 
this  $
.$ %
_unitOfWork% 0
.0 1
ProductoRepository1 C
.C D
FindFirstOrDefault "
(" #
t# $
=>% '
t( )
.) *
Nombre* 0
==1 3
request4 ;
.; <
NombreProducto< J
)J K
;K L
if 
( 
producto 
!= 
null  
)  !
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 G
}H I
;I J
producto!! 
=!! 
new!! ,
 ProductoSinEspecificacionFactory!! ;
(!!; <
)!!< =
.!!= >
CrearProducto!!> K
(!!K L
Especificacion!!L Z
.!!Z [
MateriaPrima!![ g
)!!g h
;!!h i
producto## 
.## 
	SetNombre## 
(## 
request## &
.##& '
NombreProducto##' 5
)##5 6
.##6 7
SetCantidad##7 B
(##B C
request##C J
.##J K
CantidadProducto##K [
)##[ \
.##\ ]
SetCostoUnitario$$  
($$  !
request$$! (
.$$( )!
CostoUnitarioProducto$$) >
)$$> ?
.$$? @#
SetPorcentajeDeUtilidad%% '
(%%' (
request%%( /
.%%/ 0(
PorcentajeDeUtilidadProducto%%0 L
)%%L M
.%%M N
SetUnidadDeMedida&& !
(&&! "
request&&" )
.&&) *"
UnidadDeMedidaProducto&&* @
)&&@ A
;&&A B
this,, 
.,, 
_unitOfWork,, 
.,, 
ProductoRepository,, /
.,,/ 0
Add,,0 3
(,,3 4
producto,,4 <
),,< =
;,,= >
this-- 
.-- 
_unitOfWork-- 
.-- 
Commit-- #
(--# $
)--$ %
;--% &
return.. 
new.. 
Response.. 
{// 
Mensaje00 
=00 
$str00 9
,009 :
Data11 
=11 
new11 
ProductoRequest11 *
(11* +
)11+ ,
.11, -
Map11- 0
(110 1
producto111 9
)119 :
}22 
;22 
}33 	
}55 
}66 «!
{C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoParaFabricarCrearService.cs
	namespace		 	
Application		
 
.		 
Services		 
.		 
ProductoServices		 /
{

 
public 

class ,
 ProductoParaFabricarCrearService 1
:2 3
ProductoService4 C
{ 
public ,
 ProductoParaFabricarCrearService /
(/ 0
IUnitOfWork0 ;

unitOfWork< F
)F G
:H I
baseJ N
(N O

unitOfWorkO Y
)Y Z
{ 	
} 	
public 
override 
Response  
CrearProducto! .
(. /
ProductoRequest/ >
request? F
)F G
{ 	
var 
errores 
= 
ProductoPuedeCrear ,
., -
PuedeCrearProducto- ?
( 
request 
. 
CantidadProducto )
,) *
request 
. !
CostoUnitarioProducto -
)- .
;. /
if 
( 
errores 
. 
Any 
( 
) 
) 
return 
new 
Response #
{$ %
Mensaje& -
=. /
String0 6
.6 7
Join7 ;
(; <
$str< @
,@ A
erroresB I
)I J
}K L
;L M
Producto 
producto 
= 
this  $
.$ %
_unitOfWork% 0
.0 1
ProductoRepository1 C
.C D
FindFirstOrDefault "
(" #
t# $
=>% '
t( )
.) *
Nombre* 0
==1 3
request4 ;
.; <
NombreProducto< J
)J K
;K L
if 
( 
producto 
!= 
null  
)  !
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 G
}H I
;I J
try 
{   
producto!! 
=!! 
new!! '
ProductoParaFabricarFactory!! :
(!!: ;
)!!; <
.!!< =
CrearProducto!!= J
(!!J K
request!!K R
.!!R S
Especificacion!!S a
)!!a b
;!!b c
producto"" 
."" 
	SetNombre"" "
(""" #
request""# *
.""* +
NombreProducto""+ 9
)""9 :
."": ;
SetCantidad""; F
(""F G
request""G N
.""N O
CantidadProducto""O _
)""_ `
.""` a
SetCostoUnitario## $
(##$ %
request##% ,
.##, -!
CostoUnitarioProducto##- B
)##B C
.##C D
SetUnidadDeMedida$$ %
($$% &
request$$& -
.$$- ."
UnidadDeMedidaProducto$$. D
)$$D E
;$$E F
}%% 
catch&& 
(&& %
InvalidOperationException&& ,
e&&- .
)&&. /
{'' 
return(( 
new(( 
Response(( #
{(($ %
Mensaje((& -
=((. /
e((0 1
.((1 2
Message((2 9
}((: ;
;((; <
})) 
this++ 
.++ 
_unitOfWork++ 
.++ 
ProductoRepository++ /
.++/ 0
Add++0 3
(++3 4
producto++4 <
)++< =
;++= >
this,, 
.,, 
_unitOfWork,, 
.,, 
Commit,, #
(,,# $
),,$ %
;,,% &
return-- 
new-- 
Response-- 
{.. 
Mensaje// 
=// 
$str// 9
,//9 :
Data00 
=00 
new00 
ProductoRequest00 *
(00* +
)00+ ,
.00, -
Map00- 0
(000 1
producto001 9
)009 :
}11 
;11 
}22 	
}33 
}44 £!
yC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoParaVenderCrearService.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public 

class *
ProductoParaVenderCrearService /
:0 1
ProductoService2 A
{ 
public *
ProductoParaVenderCrearService -
(- .
IUnitOfWork. 9

unitOfWork: D
)D E
:F G
baseH L
(L M

unitOfWorkM W
)W X
{ 	
} 	
public 
override 
Response  
CrearProducto! .
(. /
ProductoRequest/ >
request? F
)F G
{ 	
var 
errores 
= 
ProductoPuedeCrear ,
., -
PuedeCrearProducto- ?
( 
request 
. 
CantidadProducto )
,) *
request 
. !
CostoUnitarioProducto -
)- .
;. /
if 
( 
errores 
. 
Any 
( 
) 
) 
return 
new 
Response #
{$ %
Mensaje& -
=. /
String0 6
.6 7
Join7 ;
(; <
$str< @
,@ A
erroresB I
)I J
}K L
;L M
Producto 
producto 
= 
this  $
.$ %
_unitOfWork% 0
.0 1
ProductoRepository1 C
.C D
FindFirstOrDefault "
(" #
t# $
=>% '
t( )
.) *
Nombre* 0
==1 3
request4 ;
.; <
NombreProducto< J
)J K
;K L
if 
( 
producto 
!= 
null  
)  !
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 G
}H I
;I J
try!! 
{"" 
producto## 
=## 
new## %
ProductoParaVenderFactory## 8
(##8 9
)##9 :
.##: ;
CrearProducto##; H
(##H I
request##I P
.##P Q
Especificacion##Q _
)##_ `
;##` a
producto$$ 
.$$ 
	SetNombre$$ "
($$" #
request$$# *
.$$* +
NombreProducto$$+ 9
)$$9 :
.$$: ;
SetCantidad$$; F
($$F G
request$$G N
.$$N O
CantidadProducto$$O _
)$$_ `
.$$` a
SetCostoUnitario%% $
(%%$ %
request%%% ,
.%%, -!
CostoUnitarioProducto%%- B
)%%B C
.%%C D
SetUnidadDeMedida&& %
(&&% &
request&&& -
.&&- ."
UnidadDeMedidaProducto&&. D
)&&D E
;&&E F
}'' 
catch(( 
((( %
InvalidOperationException(( ,
e((- .
)((. /
{)) 
return** 
new** 
Response** #
{**$ %
Mensaje**& -
=**. /
e**0 1
.**1 2
Message**2 9
}**: ;
;**; <
}++ 
this-- 
.-- 
_unitOfWork-- 
.-- 
ProductoRepository-- /
.--/ 0
Add--0 3
(--3 4
producto--4 <
)--< =
;--= >
this.. 
... 
_unitOfWork.. 
... 
Commit.. #
(..# $
)..$ %
;..% &
return// 
new// 
Response// 
{00 
Mensaje11 
=11 
$str11 9
,119 :
Data22 
=22 
new22 
ProductoRequest22 *
(22* +
)22+ ,
.22, -
Map22- 0
(220 1
producto221 9
)229 :
}33 
;33 
}44 	
}66 
}77 Ü
jC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoService.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public 

abstract 
class 
ProductoService )
{		 
	protected

 
IUnitOfWork

 
_unitOfWork

 )
;

) *
	protected 
ProductoService !
(! "
IUnitOfWork" -

unitOfWork. 8
)8 9
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
	protected 
IEnumerable 
< 
Producto &
>& '
GetProductos( 4
(4 5
)5 6
{ 	
return 
_unitOfWork 
. 
ProductoRepository 1
.1 2
FindBy2 8
(8 9
)9 :
;: ;
} 	
	protected 
ProductoRequest !
Map" %
(% &
Producto& .
producto/ 7
)7 8
{ 	
ProductoRequest 
request #
=$ %
new& )
ProductoRequest* 9
(9 :
): ;
;; <
return 
request 
. 
Map 
( 
producto '
)' (
;( )
} 	
public 
abstract 
Response  
CrearProducto! .
(. /
ProductoRequest/ >
request? F
)F G
;G H
} 
} “.
`C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TerceroEmpleadoService.cs
	namespace

 	
Application


 
.

 
Services

 
{ 
public 

abstract 
class "
TerceroEmpleadoService 0
{ 
	protected 
readonly 
IUnitOfWork &
_unitOfWork' 2
;2 3
	protected "
TerceroEmpleadoService (
(( )
IUnitOfWork) 4

unitOfWork5 ?
)? @
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
} 
public 

class  
TerceroEmpleadoCrear %
:& '"
TerceroEmpleadoService( >
{ 
public  
TerceroEmpleadoCrear #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
:< =
base> B
(B C

unitOfWorkC M
)M N
{ 	
} 	
public 
Response 
Crear 
( "
TerceroEmpleadoRequest 4
request5 <
)< =
{ 	
Tercero 
tercero 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
if 
( 
tercero 
== 
null 
)  
{ 
return 
new 
Response #
{   
Mensaje!! 
=!! 
$"!!  
La identificaciÃ³n !!  2
{!!2 3
request!!3 :
.!!: ;

NitTercero!!; E
}!!E F
,!!F G
"!!G H
+!!I J
$""" 8
, no se encuentra registrada hasta el momento"" B
"""B C
}## 
;## 
}$$ 
TerceroEmpleado%% 
empleado%% $
=%%% &
this%%' +
.%%+ ,
_unitOfWork%%, 7
.%%7 8%
TerceroEmpleadoRepository%%8 Q
.%%Q R
FindBy&& 
(&& 
empleado&& 
=>&&  "
empleado&&# +
.&&+ ,
Tercero&&, 3
.&&3 4
Nit&&4 7
==&&8 :
request&&; B
.&&B C

NitTercero&&C M
,&&M N
includeProperties'' !
:''! "
$str''# ,
)'', -
.''- .
FirstOrDefault''. <
(''< =
)''= >
;''> ?
if(( 
((( 
empleado(( 
!=(( 
null((  
)((  !
{)) 
return** 
new** 
Response** #
{++ 
Mensaje,, 
=,, 
$",,  I
=No se pudo registrar el empleado porque ya esta en el sistema,,  ]
",,] ^
}-- 
;-- 
}.. 
empleado// 
=// 
new// 
TerceroEmpleado// *
(//* +
tercero//+ 2
)//2 3
;//3 4
this00 
.00 
_unitOfWork00 
.00 %
TerceroEmpleadoRepository00 6
.006 7
Add007 :
(00: ;
empleado00; C
)00C D
;00D E
this11 
.11 
_unitOfWork11 
.11 
Commit11 #
(11# $
)11$ %
;11% &
return22 
new22 
Response22 
{33 
Mensaje44 
=44 
$str44 9
,449 :
Data55 
=55 
new55 "
TerceroEmpleadoRequest55 1
(551 2
)552 3
.553 4
Map554 7
(557 8
empleado558 @
)55@ A
}66 
;66 
}77 	
}88 
public99 

class99 !
ListarTerceroEmpleado99 &
{:: 
private;; 
readonly;; 
IUnitOfWork;; $

unitOfWork;;% /
;;;/ 0
public<< !
ListarTerceroEmpleado<< $
(<<$ %
IUnitOfWork<<% 0

unitOfWork<<1 ;
)<<; <
{== 	
this>> 
.>> 

unitOfWork>> 
=>> 

unitOfWork>> (
;>>( )
}?? 	
public@@ 
Response@@ 
BuscarEmpleado@@ &
(@@& '
int@@' *
id@@+ -
)@@- .
{AA 	
TerceroEmpleadoBB 
empleadoBB $
=BB% &
thisBB' +
.BB+ ,

unitOfWorkBB, 6
.BB6 7%
TerceroEmpleadoRepositoryBB7 P
.BBP Q
FindByCC 
(CC 
empleadoCC 
=>CC  "
empleadoCC# +
.CC+ ,
IdCC, .
==CC/ 1
idCC2 4
,CC4 5
includePropertiesCC6 G
:CCG H
$strCCI R
)CCR S
.CCS T
FirstOrDefaultCCT b
(CCb c
)CCc d
;CCd e
ifEE 
(EE 
empleadoEE 
==EE 
nullEE  
)EE  !
{FF 
returnGG 
newGG 
ResponseGG #
{HH 
MensajeII 
=II 
$strII :
}JJ 
;JJ 
}KK 
returnLL 
newLL 
ResponseLL 
{MM 
DataNN 
=NN 
newNN "
TerceroEmpleadoRequestNN 1
(NN1 2
)NN2 3
.NN3 4
MapNN4 7
(NN7 8
empleadoNN8 @
)NN@ A
}OO 
;OO 
}PP 	
}QQ 
}RR ‰
`C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TerceroProvedorService.cs
	namespace		 	
Application		
 
.		 
Services		 
{

 
public 

class "
TerceroProvedorService '
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public "
TerceroProvedorService %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response !
CrearTerceroProveedor -
(- ."
TerceroProvedorRequest. D
requestE L
)L M
{ 	
Tercero 
tercero 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
if 
( 
tercero 
== 
null 
)  
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$"  
La identificaciÃ³n   2
{2 3
request3 :
.: ;

NitTercero; E
}E F
,F G
"G H
+I J
$" 8
, no se encuentra registrada hasta el momento B
"B C
} 
; 
} 
TerceroProveedor 
provedor %
=& '
this( ,
., -
_unitOfWork- 8
.8 9%
TerceroProvedorRepository9 R
.R S
FindBy 
( 
provedor 
=>  "
provedor# +
.+ ,
Tercero, 3
.3 4
Nit4 7
==8 :
request; B
.B C

NitTerceroC M
,M N
includeProperties   !
:  ! "
$str  # ,
)  , -
.  - .
FirstOrDefault  . <
(  < =
)  = >
;  > ?
if"" 
("" 
provedor"" 
!="" 
null""  
)""  !
{## 
return$$ 
new$$ 
Response$$ #
{%% 
Mensaje&& 
=&& 
$"&&  K
?No se pudo registrar el proveedor porque ya estÃ¡ en el sistema&&  ^
"&&^ _
}'' 
;'' 
}(( 
provedor)) 
=)) 
new)) 
TerceroProveedor)) +
())+ ,
tercero)), 3
)))3 4
;))4 5
this** 
.** 
_unitOfWork** 
.** %
TerceroProvedorRepository** 6
.**6 7
Add**7 :
(**: ;
provedor**; C
)**C D
;**D E
this++ 
.++ 
_unitOfWork++ 
.++ 
Commit++ #
(++# $
)++$ %
;++% &
return,, 
new,, 
Response,, 
{-- 
Mensaje.. 
=.. 
$str.. :
,..: ;
Data// 
=// 
new// "
TerceroProvedorRequest// 1
(//1 2
)//2 3
.//3 4
Map//4 7
(//7 8
provedor//8 @
)//@ A
}00 
;00 
}11 	
}22 
}33 ž/
XC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TerceroService.cs
	namespace 	
Application
 
. 
Services 
{		 
public

 

abstract

 
class

 
TerceroService

 (
{ 
	protected 
readonly 
IUnitOfWork &
_unitOfWork' 2
;2 3
	protected 
TerceroService  
(  !
IUnitOfWork! ,

unitOfWork- 7
)7 8
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
} 
public 

class 
BuscarTercero 
:  
TerceroService! /
{ 
public 
BuscarTercero 
( 
IUnitOfWork (

unitOfWork) 3
)3 4
:5 6
base7 ;
(; <

unitOfWork< F
)F G
{ 	
} 	
public 
Tercero 

GetTercero !
(! "
TerceroRequest" 0
request1 8
)8 9
{ 	
return 
this 
. 
_unitOfWork #
.# $
TerceroRepository$ 5
.5 6
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
} 	
public 
IEnumerable 
< 
TerceroRequest )
>) *
GetTerceros+ 6
(6 7
)7 8
{ 	
List 
< 
TerceroRequest 
>  
terceros! )
=* +
new, /
List0 4
<4 5
TerceroRequest5 C
>C D
(D E
)E F
;F G
this 
. 
_unitOfWork 
. 
TerceroRepository .
.. /
GetAll/ 5
(5 6
)6 7
.7 8
ToList8 >
(> ?
)? @
.@ A
ForEach   
(   
(   
tercero   
)    
=>  ! #
{!! 
terceros"" 
."" 
Add"" 
(""  
new""  #
TerceroRequest""$ 2
(""2 3
)""3 4
.""4 5
Map""5 8
(""8 9
tercero""9 @
)""@ A
)""A B
;""B C
}## 
)## 
;## 
return$$ 
terceros$$ 
;$$ 
}%% 	
}&& 
public'' 

class'' 
TerceroCrear'' 
:'' 
TerceroService''  .
{(( 
public)) 
TerceroCrear)) 
()) 
IUnitOfWork)) '

unitOfWork))( 2
)))2 3
:))4 5
base))6 :
()): ;

unitOfWork)); E
)))E F
{** 	
}++ 	
public,, 
Response,, 
CrearTercero,, $
(,,$ %
TerceroRequest,,% 3
request,,4 ;
),,; <
{-- 	
Tercero.. 
tercero.. 
=.. 
new.. !
BuscarTercero.." /
(../ 0
this..0 4
...4 5
_unitOfWork..5 @
)..@ A
...A B

GetTercero..B L
(..L M
request..M T
)..T U
;..U V
if// 
(// 
tercero// 
!=// 
null// 
)//  
{00 
return11 
new11 
Response11 #
{11$ %
Mensaje11& -
=11. /
$"110 2
El nit 112 9
{119 :
request11: A
.11A B

NitTercero11B L
}11L M'
 ya se encuentra registrado11M h
"11h i
}11j k
;11k l
}22 
tercero33 
=33 
new33 
Tercero33 !
(33! "
request33" )
.33) *

NitTercero33* 4
,334 5
request336 =
.33= >
RazonSocialTercero33> P
)33P Q
;33Q R
request44 
.44 
ContactosTercero44 $
.44$ %
ForEach44% ,
(44, -
(44- .
contacto44. 6
)446 7
=>448 :
{55 
tercero66 
.66 
	Contactos66 !
.66! "
Add66" %
(66% &
new77 
Contacto77  
.77  !
ContactoBuilder77! 0
(770 1
)771 2
.772 3
SetDireccion88  
(88  !
contacto88! )
.88) *
TerceroDireccion88* :
)88: ;
.88; <
SetEmail99 
(99 
contacto99 %
.99% &
TerceroEmail99& 2
)992 3
.993 4
SetNumeroCelular:: $
(::$ %
contacto::% -
.::- . 
TerceroNumeroCelular::. B
)::B C
.::C D
Build::D I
(::I J
)::J K
);; 
;;; 
}<< 
)<< 
;<< 
this== 
.== 
_unitOfWork== 
.== 
TerceroRepository== .
.==. /
Add==/ 2
(==2 3
tercero==3 :
)==: ;
;==; <
this>> 
.>> 
_unitOfWork>> 
.>> 
Commit>> #
(>># $
)>>$ %
;>>% &
return?? 
new?? 
Response?? 
{@@ 
MensajeAA 
=AA 
$strAA 8
,AA8 9
DataBB 
=BB 
newBB 
TerceroRequestBB )
(BB) *
)BB* +
.BB+ ,
MapBB, /
(BB/ 0
terceroBB0 7
)BB7 8
}CC 
;CC 
}DD 	
}EE 
}FF Â(
_C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TerceroUsuarioService.cs
	namespace 	
Application
 
. 
Services 
{		 
public

 

abstract

 
class

 !
TerceroUsuarioService

 /
{ 
	protected 
IUnitOfWork 
_unitOfWork )
;) *
	protected !
TerceroUsuarioService '
(' (
IUnitOfWork( 3

unitOfWork4 >
)> ?
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
} 
public 

class 
ValidarUsuario 
:  !!
TerceroUsuarioService" 7
{ 
public 
ValidarUsuario 
( 
IUnitOfWork )

unitOfWork* 4
)4 5
:6 7
base8 <
(< =

unitOfWork= G
)G H
{ 	
} 	
public 
TerceroUsuario !
ValidarTerceroUsuario 3
(3 4!
TerceroUsuarioRequest4 I
requestJ Q
)Q R
{ 	
return 
this 
. 
_unitOfWork #
.# $$
TerceroUsuarioRepository$ <
.< =
FindBy 
( 
usuario 
=> !
request" )
.) *
UsuarioTercero* 8
==9 ;
usuario< C
.C D
UsuarioD K
&&L N
usuario 
. 
Password  
==! #
request$ +
.+ ,
PasswordTercero, ;
,; <
includeProperties< M
:M N
$strN W
)W X
.X Y
FirstOrDefaultY g
(g h
)h i
;i j
} 	
} 
public 

class 
CrearUsuario 
: !
TerceroUsuarioService  5
{   
public!! 
CrearUsuario!! 
(!! 
IUnitOfWork!! '

unitOfWork!!( 2
)!!2 3
:!!4 5
base!!6 :
(!!: ;

unitOfWork!!; E
)!!E F
{"" 	
}## 	
public$$ 
Response$$ 
SaveUsuario$$ #
($$# $!
TerceroUsuarioRequest$$$ 9
request$$: A
)$$A B
{%% 	
Tercero&& 
tercero&& 
=&& 
this&& "
.&&" #
_unitOfWork&&# .
.&&. /
TerceroRepository&&/ @
.&&@ A
FindFirstOrDefault'' "
(''" #
tercero''# *
=>''+ -
tercero''. 5
.''5 6
Nit''6 9
=='': <
request''= D
.''D E

NitTercero''E O
)''O P
;''P Q
if(( 
((( 
tercero(( 
==(( 
null(( 
)(( 
{)) 
return** 
new** 
Response** #
{**$ %
Mensaje**& -
=**. /
$"**0 2
El nit **2 9
{**9 :
request**: A
.**A B

NitTercero**B L
}**L M'
 no se encuentra registrado**M h
"**h i
}**j k
;**k l
}++ 
var,, 
usuario,, 
=,, 
new,, 
ValidarUsuario,, ,
(,,, -
this,,- 1
.,,1 2
_unitOfWork,,2 =
),,= >
.,,> ?!
ValidarTerceroUsuario,,? T
(,,T U
request,,U \
),,\ ]
;,,] ^
if-- 
(-- 
usuario-- 
!=-- 
null-- 
)--  
{.. 
return// 
new// 
Response// #
{//$ %
Mensaje//& -
=//. /
$str//0 T
}//U V
;//V W
}00 
TerceroUsuario11 
terceroUsuario11 )
=11* +
new11, /
TerceroUsuario110 >
(11> ?
tercero11? F
)11F G
;11G H
terceroUsuario22 
.22 
Password22 #
=22$ %
request22& -
.22- .
PasswordTercero22. =
;22= >
terceroUsuario33 
.33 
Usuario33 "
=33# $
request33% ,
.33, -
UsuarioTercero33- ;
;33; <
this44 
.44 
_unitOfWork44 
.44 $
TerceroUsuarioRepository44 5
.445 6
Add446 9
(449 :
terceroUsuario44: H
)44H I
;44I J
this55 
.55 
_unitOfWork55 
.55 
Commit55 #
(55# $
)55$ %
;55% &
return66 
new66 
Response66 
{77 
Mensaje88 
=88 
$str88 8
,888 9
Data99 
=99 
request99 
.99 
Map99 "
(99" #
terceroUsuario99# 1
)991 2
}:: 
;:: 
}<< 	
}== 
}>> 