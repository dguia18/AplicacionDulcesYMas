Ì
Qc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Base\BaseRequest.cs
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
} ¡
Mc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Base\IEntity.cs
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
}  !
^c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\CompraDetallesRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class  
CompraDetalleRequest %
{ 
public 
double 
Valor 
{ 
get !
;! "
set# &
;& '
}( )
public 
double 
Cantidad 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 
Producto		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public  
CompraDetalleRequest #
(# $
)$ %
{ 	
} 	
public  
CompraDetalleRequest #
(# $'
CompraDetalleRequestBuilder$ ?'
compraDetalleRequestBuilder@ [
)[ \
{ 	
this 
. 
Cantidad 
= '
compraDetalleRequestBuilder 7
.7 8
Cantidad8 @
;@ A
this 
. 
Valor 
= '
compraDetalleRequestBuilder 4
.4 5
Valor5 :
;: ;
this 
. 
Producto 
= '
compraDetalleRequestBuilder 7
.7 8
Producto8 @
.@ A
ToUpperA H
(H I
)I J
;J K
} 	
public  
CompraDetalleRequest #
Map$ '
(' (
CompraDetalle( 5
detalle6 =
)= >
{ 	
this 
. 
Valor 
= 
detalle  
.  !
Valor! &
;& '
this 
. 
Cantidad 
= 
detalle #
.# $
Cantidad$ ,
;, -
this 
. 
Producto 
= 
detalle #
.# $
Producto$ ,
., -
Nombre- 3
;3 4
return 
this 
; 
} 	
public 
class '
CompraDetalleRequestBuilder 0
{ 	
public   
double   
Valor   
{    !
get  " %
;  % &
private  ' .
set  / 2
;  2 3
}  4 5
public!! 
double!! 
Cantidad!! "
{!!# $
get!!% (
;!!( )
private!!* 1
set!!2 5
;!!5 6
}!!7 8
public"" 
string"" 
Producto"" "
{""# $
get""% (
;""( )
private""* 1
set""2 5
;""5 6
}""7 8
public## '
CompraDetalleRequestBuilder## .
(##. /
string##/ 5
producto##6 >
)##> ?
{$$ 
this%% 
.%% 
Producto%% 
=%% 
producto%%  (
;%%( )
}&& 
public'' '
CompraDetalleRequestBuilder'' .
SetValor''/ 7
(''7 8
double''8 >
valor''? D
)''D E
{(( 
this)) 
.)) 
Valor)) 
=)) 
valor)) "
;))" #
return** 
this** 
;** 
}++ 
public,, '
CompraDetalleRequestBuilder,, .
SetCantidad,,/ :
(,,: ;
double,,; A
cantidad,,B J
),,J K
{-- 
this.. 
... 
Cantidad.. 
=.. 
cantidad..  (
;..( )
return// 
this// 
;// 
}00 
public11  
CompraDetalleRequest11 '
Build11( -
(11- .
)11. /
{22  
CompraDetalleRequest33 $
compraDetalle33% 2
=333 4
new335 8 
CompraDetalleRequest339 M
(33M N
this33N R
)33R S
;33S T
return44 
compraDetalle44 $
;44$ %
}55 
}66 	
}77 
}88 ü.
Vc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\CompraRequest.cs
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
}@@ Ï'
bc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\FabricacionDetalleRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class %
FabricacionDetalleRequest *
{ 
public 
int 
IdMateriaPrima !
{" #
get$ '
;' (
set) ,
;, -
}. /
private		 
string		 
_nombreMateriaPrima		 *
;		* +
public

 
string

 
NombreMateriaPrima

 (
{ 	
get 
=> 
_nombreMateriaPrima &
;& '
set 
=> 
_nombreMateriaPrima &
=' (
value) .
.. /
ToUpper/ 6
(6 7
)7 8
;8 9
} 	
public 
double  
CantidadMateriaPrima *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public %
FabricacionDetalleRequest (
(( )
string) /
nombreMateriaPrima0 B
,B C
double  
cantidadMateriaPrima '
)' (
{ 	
NombreMateriaPrima 
=  
nombreMateriaPrima! 3
;3 4 
CantidadMateriaPrima  
=! " 
cantidadMateriaPrima# 7
;7 8
} 	
public %
FabricacionDetalleRequest (
(( )
)) *
{ 	
} 	
public %
FabricacionDetalleRequest (
(( ),
 FabricacionDetalleRequestBuilder) I
builderJ Q
)Q R
{ 	
this 
. 
NombreMateriaPrima #
=$ %
builder& -
.- .
NombreMateriaPrima. @
;@ A
this 
. 
IdMateriaPrima 
=  !
builder" )
.) *
IdMateriaPrima* 8
;8 9
this   
.    
CantidadMateriaPrima   %
=  & '
builder  ( /
.  / 0 
CantidadMateriaPrima  0 D
;  D E
}!! 	
public## %
FabricacionDetalleRequest## (
Map##) ,
(##, -
FabricacionDetalle##- ?
detalle##@ G
)##G H
{$$ 	
this%% 
.%% 
IdMateriaPrima%% 
=%%  !
detalle%%" )
.%%) *
MateriaPrimaId%%* 8
;%%8 9 
CantidadMateriaPrima&&  
=&&! "
detalle&&# *
.&&* +
Cantidad&&+ 3
;&&3 4
NombreMateriaPrima'' 
=''  
detalle''! (
.''( )
MateriaPrima'') 5
.''5 6
Nombre''6 <
;''< =
return(( 
this(( 
;(( 
})) 	
public** 
class** ,
 FabricacionDetalleRequestBuilder** 5
{++ 	
public,, 
int,, 
IdMateriaPrima,, %
{,,& '
get,,( +
;,,+ ,
set,,- 0
;,,0 1
},,2 3
private-- 
string-- 
_nombreMateriaPrima-- .
;--. /
public.. 
string.. 
NombreMateriaPrima.. ,
{// 
get00 
=>00 
_nombreMateriaPrima00 *
;00* +
set11 
=>11 
_nombreMateriaPrima11 *
=11+ ,
value11- 2
.112 3
ToUpper113 :
(11: ;
)11; <
;11< =
}22 
public33 
double33  
CantidadMateriaPrima33 .
{33/ 0
get331 4
;334 5
set336 9
;339 :
}33; <
public44 ,
 FabricacionDetalleRequestBuilder44 3
(443 4
int444 7
id448 :
,44: ;
double44< B
cantidad44C K
)44K L
{55 
this66 
.66 
IdMateriaPrima66 #
=66$ %
id66& (
;66( )
this77 
.77  
CantidadMateriaPrima77 )
=77* +
cantidad77, 4
;774 5
}88 
public99 ,
 FabricacionDetalleRequestBuilder99 3
	SetNombre994 =
(99= >
string99> D
nombre99E K
)99K L
{:: 
this;; 
.;; 
NombreMateriaPrima;; '
=;;( )
nombre;;* 0
;;;0 1
return<< 
this<< 
;<< 
}== 
public>> %
FabricacionDetalleRequest>> ,
Build>>- 2
(>>2 3
)>>3 4
{?? %
FabricacionDetalleRequest@@ )
fabricacionDetalle@@* <
=@@= >
new@@? B%
FabricacionDetalleRequest@@C \
(@@\ ]
this@@] a
)@@a b
;@@b c
returnAA 
fabricacionDetalleAA )
;AA) *
}BB 
}CC 	
}DD 
}EE –$
[c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\FabricacionRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public		 

class		 
FabricacionRequest		 #
:		$ %
Request		& -
<		- .
int		. 1
>		1 2
{

 
public 
string 
NitEmpleado !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 

IdProducto 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Cantidad 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
Costo 
{ 
get !
;! "
set# &
;& '
}( )
public 
Especificacion 
Especificacion ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< %
FabricacionDetalleRequest -
>- .&
FabricacionDetallesRequest/ I
{J K
getL O
;O P
setQ T
;T U
}V W
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
FabricacionRequest !
(! "
string" (
nitEmpleado) 4
,4 5
int5 8

IdProducto9 C
,C D
double 
cantidad 
, 
double #
costo$ )
,) *
Especificacion+ 9
especificacion: H
,H I
List 
< %
FabricacionDetalleRequest *
>* +&
fabricacionDetallesRequest, F
)F G
{ 	
this 
. 

IdProducto 
= 

IdProducto (
;( )
NitEmpleado 
= 
nitEmpleado %
;% &
Cantidad 
= 
cantidad 
;  
Costo 
= 
costo 
; 
Especificacion 
= 
especificacion +
;+ ,&
FabricacionDetallesRequest &
=' (&
fabricacionDetallesRequest) C
;C D
} 	
public 
FabricacionRequest !
(! "
)" #
{ 	
this   
.   &
FabricacionDetallesRequest   +
=  , -
new  . 1
List  2 6
<  6 7%
FabricacionDetalleRequest  7 P
>  P Q
(  Q R
)  R S
;  S T
}!! 	
public"" 
FabricacionRequest"" !
Map""" %
(""% &
Fabricacion""& 1
fabricacion""2 =
)""= >
{## 	
this$$ 
.$$ 
Id$$ 
=$$ 
fabricacion$$ !
.$$! "
Id$$" $
;$$$ %
NitEmpleado%% 
=%% 
fabricacion%% %
.%%% &
TerceroEmpleado%%& 5
.%%5 6
Tercero%%6 =
.%%= >
Nit%%> A
;%%A B
Cantidad&& 
=&& 
fabricacion&& "
.&&" #
Cantidad&&# +
;&&+ ,
Costo'' 
='' 
fabricacion'' 
.''  
Costo''  %
;''% &
this(( 
.(( 
FechaCreacion(( 
=((  
fabricacion((! ,
.((, -
FechaCreacion((- :
;((: ;
if)) 
()) 
fabricacion)) 
.)) 
FabricacionDetalles)) /
!=))0 2
null))3 7
)))7 8
{** 
fabricacion++ 
.++ 
FabricacionDetalles++ /
.++/ 0
ForEach++0 7
(++7 8
(++8 9
detalle++9 @
)++@ A
=>++B D
{,, 
this-- 
.-- &
FabricacionDetallesRequest-- 3
.--3 4
Add.. 
(.. 
new.. %
FabricacionDetalleRequest.. 5
(..5 6
)..6 7
...7 8
Map..8 ;
(..; <
detalle..< C
)..C D
)..D E
;..E F
}// 
)// 
;// 
}00 
return11 
this11 
;11 
}22 	
}33 
}44 ©a
Xc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\ProductoRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class 
ProductoRequest  
:! "
Request# *
<* +
int+ .
>. /
{		 
private

 
string

 
_nombreProducto

 &
;

& '
public 
string 
NombreProducto $
{ 	
get 
=> 
_nombreProducto "
;" #
set 
=> 
_nombreProducto "
=# $
value% *
.* +
ToUpper+ 2
(2 3
)3 4
;4 5
} 	
public 
double 
CantidadProducto &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
double !
CostoUnitarioProducto +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
UnidadDeMedida "
UnidadDeMedidaProducto 4
{ 	
get 
; 
set 
; 
} 	
public 
double (
PorcentajeDeUtilidadProducto 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
Especificacion 
Especificacion ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
Tipo 
Tipo 
{ 
get 
; 
set  #
;# $
}% &
public 
List 
< 
FabricacionRequest &
>& ' 
FabricacionesRequest( <
{= >
get? B
;B C
setD G
;G H
}I J
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
SubCategoria "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
ProductoRequest 
( 
)  
{ 	 
FabricacionesRequest    
=  ! "
new  # &
List  ' +
<  + ,
FabricacionRequest  , >
>  > ?
(  ? @
)  @ A
;  A B
}!! 	
public## 
ProductoRequest## 
(## "
ProductoRequestBuilder## 5"
productoRequestBuilder##6 L
)##L M
{$$ 	
this%% 
.%% 
Id%% 
=%% "
productoRequestBuilder%% ,
.%%, -
Id%%- /
;%%/ 0
this&& 
.&& 
CantidadProducto&& !
=&&" #"
productoRequestBuilder&&$ :
.&&: ;
CantidadProducto&&; K
;&&K L
this'' 
.'' 
Especificacion'' 
=''  !"
productoRequestBuilder''" 8
.''8 9
Especificacion''9 G
;''G H
this(( 
.(( 
Tipo(( 
=(( "
productoRequestBuilder(( .
.((. /
Tipo((/ 3
;((3 4
this)) 
.)) !
CostoUnitarioProducto)) &
=))' ("
productoRequestBuilder))) ?
.))? @!
CostoUnitarioProducto))@ U
;))U V
this** 
.** 
FechaCreacion** 
=**  "
productoRequestBuilder**! 7
.**7 8
FechaCreacion**8 E
;**E F
this++ 
.++ 
NombreProducto++ 
=++  !"
productoRequestBuilder++" 8
.++8 9
NombreProducto++9 G
;++G H
this,, 
.,, (
PorcentajeDeUtilidadProducto,, -
=,,. /"
productoRequestBuilder,,0 F
.,,F G(
PorcentajeDeUtilidadProducto,,G c
;,,c d
this-- 
.-- 
SubCategoria-- 
=-- "
productoRequestBuilder--  6
.--6 7
SubCategoria--7 C
;--C D 
FabricacionesRequest..  
=..! "
new..# &
List..' +
<..+ ,
FabricacionRequest.., >
>..> ?
(..? @
)..@ A
;..A B
}// 	
public11 
ProductoRequest11 
Map11 "
(11" #
Producto11# +
producto11, 4
)114 5
{22 	
this33 
.33 
Id33 
=33 
producto33 
.33 
Id33 !
;33! "
Especificacion44 
=44 
producto44 %
.44% &
Especificacion44& 4
;444 5
Tipo55 
=55 
producto55 
.55 
Tipo55  
;55  !
NombreProducto66 
=66 
producto66 %
.66% &
Nombre66& ,
;66, -
CantidadProducto77 
=77 
producto77 '
.77' (
Cantidad77( 0
;770 1!
CostoUnitarioProducto88 !
=88" #
producto88$ ,
.88, -
CostoUnitario88- :
;88: ;"
UnidadDeMedidaProducto99 "
=99# $
producto99% -
.99- .
UnidadDeMedida99. <
;99< =(
PorcentajeDeUtilidadProducto:: (
=::) *
producto::+ 3
.::3 4 
PorcentajeDeUtilidad::4 H
;::H I
FechaCreacion;; 
=;; 
producto;; $
.;;$ %
FechaCreacion;;% 2
;;;2 3
if<< 
(<< 
producto<< 
.<< 
Fabricaciones<< &
!=<<' )
null<<* .
)<<. /
{== 
producto>> 
.>> 
Fabricaciones>> &
.>>& '
ForEach>>' .
(>>. /
(>>/ 0
fabricacion>>0 ;
)>>; <
=>>>= ?
{?? 
this@@ 
.@@  
FabricacionesRequest@@ -
.@@- .
Add@@. 1
(@@1 2
new@@2 5
FabricacionRequest@@6 H
(@@H I
)@@I J
.AA 
MapAA 
(AA 
fabricacionAA (
)AA( )
)AA) *
;AA* +
}BB 
)BB 
;BB 
}DD 
returnEE 
thisEE 
;EE 
}FF 	
publicHH 
classHH "
ProductoRequestBuilderHH +
{II 	
publicJJ 
intJJ 
IdJJ 
{JJ 
getJJ 
;JJ  
privateJJ! (
setJJ) ,
;JJ, -
}JJ. /
publicKK 
stringKK 
NombreProductoKK (
{LL 
getMM 
;MM 
privateNN 
setNN 
;NN 
}OO 
publicPP 
doublePP 
CantidadProductoPP *
{PP+ ,
getPP- 0
;PP0 1
privatePP2 9
setPP: =
;PP= >
}PP? @
publicQQ 
doubleQQ !
CostoUnitarioProductoQQ /
{QQ0 1
getQQ2 5
;QQ5 6
privateQQ7 >
setQQ? B
;QQB C
}QQD E
publicRR 
UnidadDeMedidaRR !"
UnidadDeMedidaProductoRR" 8
{SS 
getTT 
;TT 
privateUU 
setUU 
;UU 
}VV 
publicWW 
doubleWW (
PorcentajeDeUtilidadProductoWW 6
{WW7 8
getWW9 <
;WW< =
privateWW> E
setWWF I
;WWI J
}WWK L
publicXX 
EspecificacionXX !
EspecificacionXX" 0
{XX1 2
getXX3 6
;XX6 7
privateXX8 ?
setXX@ C
;XXC D
}XXE F
publicYY 
TipoYY 
TipoYY 
{YY 
getYY "
;YY" #
privateYY$ +
setYY, /
;YY/ 0
}YY1 2
publicZZ 
DateTimeZZ 
FechaCreacionZZ )
{ZZ* +
getZZ, /
;ZZ/ 0
privateZZ1 8
setZZ9 <
;ZZ< =
}ZZ> ?
public[[ 
string[[ 
SubCategoria[[ &
{[[' (
get[[) ,
;[[, -
private[[. 5
set[[6 9
;[[9 :
}[[; <
public\\ "
ProductoRequestBuilder\\ )
(\\) *
int\\* -
id\\. 0
,\\0 1
string\\2 8
nombre\\9 ?
)\\? @
{]] 
this^^ 
.^^ 
NombreProducto^^ #
=^^$ %
nombre^^& ,
.^^, -
ToUpper^^- 4
(^^4 5
)^^5 6
;^^6 7
this__ 
.__ 
Id__ 
=__ 
id__ 
;__ 
}`` 
publicbb "
ProductoRequestBuilderbb )
SetCantidadbb* 5
(bb5 6
doublebb6 <
cantidadbb= E
)bbE F
{cc 
thisdd 
.dd 
CantidadProductodd %
=dd& '
cantidaddd( 0
;dd0 1
returnee 
thisee 
;ee 
}ff 
publicgg "
ProductoRequestBuildergg )
SetCostoUnitariogg* :
(gg: ;
doublegg; A
costoggB G
)ggG H
{hh 
thisii 
.ii !
CostoUnitarioProductoii *
=ii+ ,
costoii- 2
;ii2 3
returnjj 
thisjj 
;jj 
}kk 
publicll "
ProductoRequestBuilderll )
SetUnidadDeMedidall* ;
(ll; <
UnidadDeMedidall< J
medidallK Q
)llQ R
{mm 
thisnn 
.nn "
UnidadDeMedidaProductonn +
=nn, -
medidann. 4
;nn4 5
returnoo 
thisoo 
;oo 
}pp 
publicqq "
ProductoRequestBuilderqq )#
SetPorcentajeDeUtilidadqq* A
(qqA B
doubleqqB H 
porcentajeDeUtilidadqqI ]
)qq] ^
{rr 
thisss 
.ss (
PorcentajeDeUtilidadProductoss 1
=ss2 3 
porcentajeDeUtilidadss4 H
;ssH I
returntt 
thistt 
;tt 
}uu 
publicvv "
ProductoRequestBuildervv )
SetEspecificacionvv* ;
(vv; <
Especificacionvv< J
especificacionvvK Y
)vvY Z
{ww 
thisxx 
.xx 
Especificacionxx #
=xx$ %
especificacionxx& 4
;xx4 5
returnyy 
thisyy 
;yy 
}zz 
public{{ "
ProductoRequestBuilder{{ )
SetTipo{{* 1
({{1 2
Tipo{{2 6
tipo{{7 ;
){{; <
{|| 
this}} 
.}} 
Tipo}} 
=}} 
tipo}}  
;}}  !
return~~ 
this~~ 
;~~ 
} 
public
ÄÄ $
ProductoRequestBuilder
ÄÄ )
SetFechaCreacion
ÄÄ* :
(
ÄÄ: ;
DateTime
ÄÄ; C
fechaCreacion
ÄÄD Q
)
ÄÄQ R
{
ÅÅ 
this
ÇÇ 
.
ÇÇ 
FechaCreacion
ÇÇ "
=
ÇÇ# $
fechaCreacion
ÇÇ% 2
;
ÇÇ2 3
return
ÉÉ 
this
ÉÉ 
;
ÉÉ 
}
ÑÑ 
public
ÖÖ $
ProductoRequestBuilder
ÖÖ )
SetSubCategoria
ÖÖ* 9
(
ÖÖ9 :
string
ÖÖ: @
subcategoria
ÖÖA M
)
ÖÖM N
{
ÜÜ 
this
áá 
.
áá 
SubCategoria
áá !
=
áá" #
subcategoria
áá$ 0
;
áá0 1
return
àà 
this
àà 
;
àà 
}
ââ 
public
ää 
ProductoRequest
ää "
Build
ää# (
(
ää( )
)
ää) *
{
ãã 
ProductoRequest
åå 
productoRequest
åå  /
=
åå0 1
new
åå2 5
ProductoRequest
åå6 E
(
ååE F
this
ååF J
)
ååJ K
;
ååK L
return
çç 
productoRequest
çç &
;
çç& '
}
éé 
}
èè 	
}
êê 
}ëë Õ
Qc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\Response.cs
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
}		 ›"
dc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroClientePrecioRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class '
TerceroClientePrecioRequest ,
{ 
public 
int 

ProductoId 
{ 
get  #
;# $
set% (
;( )
}* +
private 
string 
_nombreProducto &
;& '
public		 
string		 
NombreProducto		 $
{		% &
get		' *
=>		+ -
_nombreProducto		. =
;		= >
set		? B
=>		C E
_nombreProducto		F U
=		V W
value		X ]
.		] ^
ToUpper		^ e
(		e f
)		f g
;		g h
}		i j
public

 
double

 
Precio

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public '
TerceroClientePrecioRequest *
(* +.
"TerceroClientePrecioRequestBuilder+ M
builderN U
)U V
{ 	
this 
. 

ProductoId 
= 
builder %
.% &

ProductoId& 0
;0 1
this 
. 
NombreProducto 
=  !
$str! #
+# $
builder% ,
., -
NombreProducto- ;
;; <
this 
. 
Precio 
= 
builder !
.! "
Precio" (
;( )
} 	
public '
TerceroClientePrecioRequest *
(* +
)+ ,
{ 	
} 	
public '
TerceroClientePrecioRequest *
Map+ .
(. /(
TerceroClientePrecioProducto/ K
precioL R
)R S
{ 	
this 
. 

ProductoId 
= 
precio $
.$ %

ProductoId% /
;/ 0
this 
. 
NombreProducto 
=  !
precio" (
.( )
Producto) 1
.1 2
Nombre2 8
;8 9
this 
. 
Precio 
= 
precio  
.  !
Precio! '
;' (
return 
this 
; 
} 	
public 
class .
"TerceroClientePrecioRequestBuilder 7
{ 	
public 
int 

ProductoId !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public   
string   
NombreProducto   (
{  ) *
get  + .
;  . /
private  0 7
set  8 ;
;  ; <
}  = >
public!! 
double!! 
Precio!!  
{!!! "
get!!# &
;!!& '
private!!( /
set!!0 3
;!!3 4
}!!5 6
public"" .
"TerceroClientePrecioRequestBuilder"" 5
(""5 6
int""6 9

idProducto"": D
,""D E
double""F L
precio""M S
)""S T
{## 
this$$ 
.$$ 
Precio$$ 
=$$ 
precio$$ $
;$$$ %
this%% 
.%% 

ProductoId%% 
=%%  !

idProducto%%" ,
;%%, -
}&& 
public'' .
"TerceroClientePrecioRequestBuilder'' 5
SetNombreProducto''6 G
(''G H
string''H N
nombreProducto''O ]
)''] ^
{(( 
this)) 
.)) 
NombreProducto)) #
=))$ %
nombreProducto))& 4
;))4 5
return** 
this** 
;** 
}++ 
public,, '
TerceroClientePrecioRequest,, .
Build,,/ 4
(,,4 5
),,5 6
{-- '
TerceroClientePrecioRequest.. +
precioRequest.., 9
=..: ;
new..< ?'
TerceroClientePrecioRequest..@ [
(..[ \
this..\ `
)..` a
;..a b
return// 
precioRequest// $
;//$ %
}00 
}11 	
}22 
}33 â
^c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroClienteRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public		 

class		 !
TerceroClienteRequest		 &
:		' (
Request		) 0
<		0 1
int		1 4
>		4 5
{

 
public 
TerceroRequest	 
TerceroRequest &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string	 

NitTercero 
{ 
get  
;  !
set" %
;% &
}' (
public 
List	 
< '
TerceroClientePrecioRequest )
>) *
Precios+ 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public !
TerceroClienteRequest	 
( 
string %

nitTercero& 0
)0 1
{ 

NitTercero 
= 

nitTercero 
; 
this 
. 
Precios 
= 
new 
List 
< '
TerceroClientePrecioRequest 6
>6 7
(7 8
)8 9
;9 :
} 
public !
TerceroClienteRequest	 
( 
)  
{ 
this 
. 
Precios 
= 
new 
List 
< '
TerceroClientePrecioRequest 6
>6 7
(7 8
)8 9
;9 :
} 
public !
TerceroClienteRequest	 
Map "
(" #
TerceroCliente# 1
cliente2 9
)9 :
{ 
this 
. 
Id 

= 
cliente 
. 
Id 
; 
this 
. 

NitTercero 
= 
cliente 
. 
Tercero $
.$ %
Nit% (
;( )
this 
. 
FechaCreacion 
= 
cliente 
.  
FechaCreacion  -
;- .
if 
( 
cliente 
. 
ListaDePrecios 
!=  
null! %
)% &
{ 
cliente   
.   
ListaDePrecios   
.   
ForEach   "
(  " #
(  # $
precio  $ *
)  * +
=>  , .
{!! 
this"" 	
.""	 

Precios""
 
."" 
Add"" 
("" 
new"" '
TerceroClientePrecioRequest"" 5
(""5 6
)""6 7
.""7 8
Map""8 ;
(""; <
precio""< B
)""B C
)""C D
;""D E
}## 
)## 
;## 
}$$ 
this%% 
.%% 
TerceroRequest%% 
=%% 
new%% 
TerceroRequest%% +
(%%+ ,
)%%, -
.%%- .
Map%%. 1
(%%1 2
cliente%%2 9
.%%9 :
Tercero%%: A
)%%A B
;%%B C
return&& 	
this&&
 
;&& 
}'' 
}(( 
})) Ó
_c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroEmpleadoRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class "
TerceroEmpleadoRequest '
:( )
Request* 1
<1 2
int2 5
>5 6
{ 
public		 
TerceroRequest			 
TerceroRequest		 &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
public

 
DateTime

	 
FechaCreacion

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 
string	 

NitTercero 
{ 
get 
; 
set 

;
 
} 
public "
TerceroEmpleadoRequest	 
(  
string  &

nitTercero' 1
)1 2
{ 

NitTercero 
= 

nitTercero 
; 
} 
public "
TerceroEmpleadoRequest	 
(  
)  !
{ 
} 
public "
TerceroEmpleadoRequest	 
Map  #
(# $
TerceroEmpleado$ 3
empleado4 <
)< =
{ 
this 
. 
Id 

= 
empleado 
. 
Id 
; 
this 
. 

NitTercero 
= 
empleado 
. 
Tercero %
.% &
Nit& )
;) *
FechaCreacion 
= 
empleado 
. 
FechaCreacion )
;) *
TerceroRequest 
= 
new 
TerceroRequest &
(& '
)' (
.( )
Map) ,
(, -
empleado- 5
.5 6
Tercero6 =
)= >
;> ?
return 	
this
 
; 
}   
}!! 
}$$ Ç
_c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroProvedorRequest.cs
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
} œ
`c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroProveedorRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public		 

class		 #
TerceroProveedorRequest		 (
:		) *
Request		+ 2
<		2 3
int		3 6
>		6 7
{

 
public 
string 

NitTercero  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
Tercero 
Tercero 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
List 
< '
TerceroClientePrecioRequest /
>/ 0
ListaDePrecios1 ?
{@ A
getB E
;E F
setG J
;J K
}L M
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ï%
Wc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroRequest.cs
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
="" 
tercero"" #
.""# $
FechaCreacion""$ 1
;""1 2

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
}?? Æ)
^c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroUsuarioRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class !
TerceroUsuarioRequest &
:' (
Request) 0
<0 1
int1 4
>4 5
{ 
public		 
string		 

NitTercero		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
private

 
string

 
_usuarioTercero

 &
;

& '
public 
string 
UsuarioTercero $
{% &
get' *
=>+ -
_usuarioTercero. =
;= >
set? B
=>C E
_usuarioTerceroF U
=V W
valueX ]
.] ^
ToUpper^ e
(e f
)f g
;g h
}i j
public 
string 
PasswordTercero %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public !
TerceroUsuarioRequest $
($ %
)% &
{ 	
} 	
public !
TerceroUsuarioRequest $
($ %!
TerceroUsuarioBuilder% :!
terceroUsuarioBuilder; P
)P Q
{ 	
this 
. 

NitTercero 
= !
terceroUsuarioBuilder 3
.3 4

NitTercero4 >
;> ?
this 
. 
UsuarioTercero 
=  !!
terceroUsuarioBuilder" 7
.7 8
UsuarioTercero8 F
;F G
this 
. 
PasswordTercero  
=! "!
terceroUsuarioBuilder# 8
.8 9
PasswordTercero9 H
;H I
} 	
public !
TerceroUsuarioRequest $
Map% (
(( )
TerceroUsuario) 7
usuario8 ?
)? @
{ 	
this 
. 
Id 
= 
usuario 
. 
Id  
;  !
this 
. 
FechaCreacion 
=  
usuario! (
.( )
FechaCreacion) 6
;6 7

NitTercero 
= 
usuario  
.  !
Tercero! (
.( )
Nit) ,
;, -
UsuarioTercero 
= 
usuario $
.$ %
Usuario% ,
;, -
PasswordTercero   
=   
usuario   %
.  % &
Password  & .
;  . /
return!! 
this!! 
;!! 
}"" 	
public$$ 
class$$ !
TerceroUsuarioBuilder$$ *
{%% 	
public&& 
string&& 

NitTercero&& $
{&&% &
get&&' *
;&&* +
private&&, 3
set&&4 7
;&&7 8
}&&9 :
public'' 
string'' 
UsuarioTercero'' (
{'') *
get''+ .
;''. /
private''0 7
set''8 ;
;''; <
}''= >
public(( 
string(( 
PasswordTercero(( )
{((* +
get((, /
;((/ 0
private((1 8
set((9 <
;((< =
}((> ?
public)) !
TerceroUsuarioBuilder)) (
())( )
TerceroRequest))) 7
terceroDuvan))8 D
)))D E
{** 
this++ 
.++ 

NitTercero++ 
=++  !
terceroDuvan++" .
.++. /

NitTercero++/ 9
;++9 :
},, 
public.. !
TerceroUsuarioBuilder.. (

SetUsuario..) 3
(..3 4
string..4 :
usuario..; B
)..B C
{// 
this00 
.00 
UsuarioTercero00 #
=00$ %
usuario00& -
;00- .
return11 
this11 
;11 
}22 
public33 !
TerceroUsuarioBuilder33 (
SetPassword33) 4
(334 5
string335 ;
password33< D
)33D E
{44 
this55 
.55 
PasswordTercero55 $
=55% &
password55' /
;55/ 0
return66 
this66 
;66 
}77 
public88 !
TerceroUsuarioRequest88 (
Build88) .
(88. /
)88/ 0
{99 !
TerceroUsuarioRequest:: %
usuario::& -
=::. /
new::0 3!
TerceroUsuarioRequest::4 I
(::I J
this::J N
)::N O
;::O P
return;; 
usuario;; 
;;; 
}<< 
}== 	
}>> 
public?? 

class?? 

RolRequest?? 
{@@ 
publicAA 
stringAA 
NombreAA 
{AA 
getAA "
;AA" #
setAA$ '
;AA' (
}AA) *
}BB 
}CC ’C
Wc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\CompraService.cs
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
class 
CompraService 
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
CompraService 
( 
IUnitOfWork (

unitOfWork) 3
)3 4
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
HacerCompraService *
(* +
CompraRequest+ 8
request9 @
)@ A
{ 	
TerceroProveedor 
	proveedor &
=' (
this) -
.- .
_unitOfWork. 9
.9 :%
TerceroProvedorRepository: S
.S T
FindBy 
( 
provedor 
=>  "
provedor# +
.+ ,
Tercero, 3
.3 4
Nit4 7
==8 :
request; B
.B C
NitProvedorC N
,N O
includeProperties !
:! "
$str# ,
), -
.- .
FirstOrDefault. <
(< =
)= >
;> ?
if 
( 
	proveedor 
== 
null !
)! "
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$"  ,
 El provedor con identificaci√≥n   ?
{? @
request@ G
.G H
NitProvedorH S
}S T
"T U
+V W
$" >
2 no fue encontrado en el sistema, agr√©guelo antes G
"G H
} 
; 
} 
TerceroUsuario   
usuario   "
=  # $
this  % )
.  ) *
_unitOfWork  * 5
.  5 6$
TerceroUsuarioRepository  6 N
.  N O
FindFirstOrDefault!! "
(!!" #
usuario!!# *
=>!!+ -
usuario!!. 5
.!!5 6
Usuario!!6 =
==!!> @
request!!A H
.!!H I
Usuario!!I P
)!!P Q
;!!Q R
if$$ 
($$ 
usuario$$ 
==$$ 
null$$ 
)$$  
{%% 
return&& 
new&& 
Response&& #
{'' 
Mensaje(( 
=(( 
$"((  
El usuario ((  +
{((+ ,
request((, 3
.((3 4
Usuario((4 ;
}((; <
"((< =
+((> ?
$")) >
2 no fue encontrado en el sistema, agr√©guelo antes)) G
"))G H
}** 
;** 
}++ 
var,, 
errores,, 
=,, "
PuedeRegistrarDetalles,, 0
(,,0 1
request,,1 8
.,,8 9
Detalles,,9 A
),,A B
;,,B C
if-- 
(-- 
errores-- 
.-- 
Any-- 
(-- 
)-- 
)-- 
{.. 
return// 
new// 
Response// #
{00 
Mensaje11 
=11 
string11 $
.11$ %
Join11% )
(11) *
$str11* .
,11. /
errores110 7
)117 8
}22 
;22 
}33 
Compra44 
compra44 
=44 
new44 
Compra44  &
.44& '
CompraBuilder44' 4
(444 5
	proveedor445 >
,44> ?
usuario44@ G
)44G H
.44H I
Build44I N
(44N O
)44O P
;44P Q
request55 
.55 
Detalles55 
.55 
ForEach55 $
(55$ %
(55% &
detalle55& -
)55- .
=>55/ 1
{66 
Producto77 
producto77 !
=77" #
this77$ (
.77( )
_unitOfWork77) 4
.774 5
ProductoRepository775 G
.77G H
FindBy88 
(88 
producto88 
=>88  "
producto88# +
.88+ ,
Nombre88, 2
==883 5
detalle886 =
.88= >
Producto88> F
,88F G
includeProperties99 !
:99! "
$str99# :
)99: ;
.99; <
FirstOrDefault99< J
(99J K
)99K L
;99L M
CompraDetalle;; 
compraDetalle;; +
=;;, -
new;;. 1
CompraDetalle;;2 ?
.;;? @ 
CompraDetalleBuilder;;@ T
(;;T U
producto;;U ]
,;;] ^
compra;;_ e
);;e f
.;;f g
SetCantidad<< 
(<<  
detalle<<  '
.<<' (
Cantidad<<( 0
)<<0 1
.<<1 2
SetCostoUnitario<<2 B
(<<B C
detalle<<C J
.<<J K
Valor<<K P
)<<P Q
.<<Q R
Build<<R W
(<<W X
)<<X Y
;<<Y Z
compra>> 
.>> 

AddDetalle>> !
(>>! "
compraDetalle>>" /
)>>/ 0
;>>0 1
producto?? 
.?? 
AddCompraDetalle?? )
(??) *
compraDetalle??* 7
)??7 8
;??8 9
}@@ 
)@@ 
;@@ 
thisBB 
.BB 
_unitOfWorkBB 
.BB 
CompraRepositoryBB -
.BB- .
AddBB. 1
(BB1 2
compraBB2 8
)BB8 9
;BB9 :
thisCC 
.CC 
_unitOfWorkCC 
.CC 
CommitCC #
(CC# $
)CC$ %
;CC% &
returnDD 
newDD 
ResponseDD 
{EE 
MensajeFF 
=FF 
$strFF 7
,FF7 8
DataGG 
=GG 
newGG 
CompraRequestGG (
(GG( )
)GG) *
.GG* +
MapGG+ .
(GG. /
compraGG/ 5
)GG5 6
}HH 
;HH 
}II 	
privateJJ 
IReadOnlyListJJ 
<JJ 
stringJJ $
>JJ$ %"
PuedeRegistrarDetallesJJ& <
(JJ< =
ListJJ= A
<JJA B 
CompraDetalleRequestJJB V
>JJV W
detallesJJX `
)JJ` a
{KK 	
ListLL 
<LL 
stringLL 
>LL 
erroresLL  
=LL! "
newLL# &
ListLL' +
<LL+ ,
stringLL, 2
>LL2 3
(LL3 4
)LL4 5
;LL5 6
detallesMM 
.MM 
ForEachMM 
(MM 
(MM 
detalleMM %
)MM% &
=>MM' )
{NN 
ProductoOO 
productoOO !
=OO" #
thisOO$ (
.OO( )
_unitOfWorkOO) 4
.OO4 5
ProductoRepositoryOO5 G
.OOG H
FindFirstOrDefaultPP "
(PP" #
productoPP# +
=>PP, .
productoPP/ 7
.PP7 8
NombrePP8 >
==PP? A
detallePPB I
.PPI J
ProductoPPJ R
)PPR S
;PPS T
ifQQ 
(QQ 
productoQQ 
==QQ 
nullQQ  $
)QQ$ %
erroresRR 
.RR 
AddRR 
(RR  
$"RR  "
El producto RR" .
{RR. /
detalleRR/ 6
.RR6 7
ProductoRR7 ?
}RR? @

 no existeRR@ J
"RRJ K
)RRK L
;RRL M
ifSS 
(SS 
detalleSS 
.SS 
CantidadSS $
<=SS% '
$numSS( )
)SS) *
erroresTT 
.TT 
AddTT 
(TT  
$"TT  "
La cantidad de TT" 1
{TT1 2
detalleTT2 9
.TT9 :
ProductoTT: B
}TTB C
 es invalidaTTC O
"TTO P
)TTP Q
;TTQ R
ifUU 
(UU 
detalleUU 
.UU 
ValorUU !
<=UU" $
$numUU$ %
)UU% &
erroresVV 
.VV 
AddVV 
(VV  
$"VV  "
El valor de VV" .
{VV. /
detalleVV/ 6
.VV6 7
ProductoVV7 ?
}VV? @
 es invalidaVV@ L
"VVL M
)VVM N
;VVN O
}WW 
)WW 
;WW 
returnXX 
erroresXX 
;XX 
}YY 	
}ZZ 
}[[ öF
rc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\FabricacionCrearService.cs
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
'No hay un empleado con identificaci√≥n 22  F
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
}|| ˜,
jc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductos.cs
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
}EE ı
qc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductosPorTipo.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public 

class "
ListarProductosPorTipo '
:( )
ListarProductos* 9
{		 
private

 
Tipo

 
_tipo

 
;

 
public "
ListarProductosPorTipo %
(% &
IUnitOfWork& 1

unitOfWork2 <
)< =
:> ?
base@ D
(D E

unitOfWorkE O
)O P
{ 	
} 	
public "
ListarProductosPorTipo %
EstablecerTipo& 4
(4 5
Tipo5 9
tipo: >
)> ?
{ 	
_tipo 
= 
tipo 
; 
return 
this 
; 
} 	
public 
Response 
Filtrar 
(  
)  !
{ 	
var 
filtrado 
= 
this 
. 
_unitOfWork 
. 
ProductoRepository /
./ 0
GetAll0 6
(6 7
)7 8
.8 9
Where 
( 
x 
=> 
x 
. 
Tipo !
==" $
_tipo% *
)* +
;+ ,
return 
new 
Response 
{ 
Data 
= 
this 
. %
ConvertirProductoARequest 5
(5 6
filtrado6 >
.> ?
ToList? E
(E F
)F G
)G H
} 
; 
} 	
} 
} ≈
tc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoMateriaPrimaCrear.cs
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
Response  
Crear! &
(& '
ProductoRequest' 6
request7 >
)> ?
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
this)) 
.)) 
_unitOfWork)) 
.)) 
ProductoRepository)) /
.))/ 0
Add))0 3
())3 4
producto))4 <
)))< =
;))= >
this** 
.** 
_unitOfWork** 
.** 
Commit** #
(**# $
)**$ %
;**% &
return++ 
new++ 
Response++ 
{,, 
Mensaje-- 
=-- 
$str-- 9
,--9 :
Data.. 
=.. 
new.. 
ProductoRequest.. *
(..* +
)..+ ,
..., -
Map..- 0
(..0 1
producto..1 9
)..9 :
}// 
;// 
}00 	
}22 
}33 £!
{c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoParaFabricarCrearService.cs
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
Response  
Crear! &
(& '
ProductoRequest' 6
request7 >
)> ?
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
}44 õ!
yc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoParaVenderCrearService.cs
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
class *
ProductoParaVenderCrearService /
:0 1
ProductoService2 A
{ 
public *
ProductoParaVenderCrearService -
(- .
IUnitOfWork. 9

unitOfWork: D
)D E
:F G
baseH L
(L M

unitOfWorkM W
)W X
{ 	
} 	
public 
override 
Response  
Crear! &
(& '
ProductoRequest' 6
request7 >
)> ?
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
new!! %
ProductoParaVenderFactory!! 8
(!!8 9
)!!9 :
.!!: ;
CrearProducto!!; H
(!!H I
request!!I P
.!!P Q
Especificacion!!Q _
)!!_ `
;!!` a
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
}44 
}55 ‘
jc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoService.cs
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
Response  
Crear! &
(& '
ProductoRequest' 6
request7 >
)> ?
;? @
} 
} ê?
Öc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ClienteServices\TerceroClienteCrearService.cs
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
.

 
TercerosServices

 /
.

/ 0
ClienteServices

0 ?
{ 
public 

class &
TerceroClienteCrearService +
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public &
TerceroClienteCrearService )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
Crear 
( !
TerceroClienteRequest 3
request4 ;
); <
{ 	
Tercero 
tercero 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
if 
( 
tercero 
== 
null 
)  
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$"  
La identificaci√≥n   2
{2 3
request3 :
.: ;

NitTercero; E
}E F
,F G
"G H
+I J
$" 8
, no se encuentra registrada hasta el momento B
"B C
} 
; 
} 
TerceroCliente 
cliente "
=# $
this% )
.) *
_unitOfWork* 5
.5 6$
TerceroClienteRepository6 N
.N O
FindBy   
(   
cliente   
=>   !
cliente  " )
.  ) *
Tercero  * 1
.  1 2
Nit  2 5
==  6 8
request  9 @
.  @ A

NitTercero  A K
,  K L
includeProperties!! !
:!!! "
$str!!# ,
)!!, -
.!!- .
FirstOrDefault!!. <
(!!< =
)!!= >
;!!> ?
if"" 
("" 
cliente"" 
!="" 
null"" 
)""  
{## 
return$$ 
new$$ 
Response$$ #
{%% 
Mensaje&& 
=&& 
$"&&  H
<No se pudo registrar el cliente porque ya esta en el sistema&&  \
"&&\ ]
}'' 
;'' 
}(( 
List)) 
<)) 
Producto)) 
>)) 
	productos)) $
=))% &
this))' +
.))+ ,
_unitOfWork)), 7
.))7 8
ProductoRepository))8 J
.))J K
GetAll))K Q
())Q R
)))R S
.))S T
ToList))T Z
())Z [
)))[ \
;))\ ]
List** 
<** 
Producto** 
>**  
productosEncontrados** /
=**0 1
	productos**2 ;
.**; <
Where++ 
(++ 
producto++ 
=>++ !
request++" )
.++) *
Precios++* 1
.++1 2
Select++2 8
(++8 9
p++9 :
=>++; =
p++> ?
.++? @

ProductoId++@ J
)++J K
.++K L
Contains++L T
(++T U
producto++U ]
.++] ^
Id++^ `
)++` a
)++a b
.++b c
ToList,, 
(,, 
),, 
;,, 
if.. 
(..  
productosEncontrados.. $
...$ %
Count..% *
!=..+ -
request... 5
...5 6
Precios..6 =
...= >
Count..> C
)..C D
{// 
var00 "
productosNoEncontrados00 *
=00+ ,
request00- 4
.004 5
Precios005 <
.00< =
Where00= B
(00B C
precio00C I
=>00J L
!00M N 
productosEncontrados00N b
.00b c
Select11 
(11 
p11 
=>11 
p11 
.11 
Id11  
)11  !
.11! "
Contains11" *
(11* +
precio11+ 1
.111 2

ProductoId112 <
)11< =
)11= >
.11> ?
Select22 
(22 
p22 
=>22 
$"22 
{22 
p22  
.22  !
NombreProducto22! /
}22/ 0
 con Id 220 8
{228 9
p229 :
.22: ;

ProductoId22; E
}22E F
"22F G
)22G H
.22H I
ToList22I O
(22O P
)22P Q
;22Q R
return33 
new33 
Response33 #
{44 
Mensaje55 
=55 
$str55 ^
+55_ `
string66 
.66 
Join66 
(66  
$str66  $
,66$ %"
productosNoEncontrados77 *
)77* +
}88 
;88 
}99 
cliente;; 
=;; 
new;; 
TerceroCliente;; (
.;;( )!
TerceroClienteBuilder;;) >
(;;> ?
tercero;;? F
);;F G
.;;G H
Build;;H M
(;;M N
);;N O
;;;O P
try<< 
{== 
IEnumerator>> 
<>> 
Producto>> $
>>>$ %

enumerator>>& 0
=>>1 2 
productosEncontrados>>3 G
.>>G H
GetEnumerator>>H U
(>>U V
)>>V W
;>>W X
request?? 
.?? 
Precios?? 
.??  
ForEach??  '
(??' (
(??( )
precio??) /
)??/ 0
=>??1 3
{@@ 

enumeratorAA 
.AA 
MoveNextAA '
(AA' (
)AA( )
;AA) *(
TerceroClientePrecioProductoCC 0
precioProductoCC1 ?
=CC@ A
newCCB E(
TerceroClientePrecioProductoCCF b
.CCb c/
#TerceroClientePrecioProductoBuilderDD 7
(DD7 8
clienteDD8 ?
,DD? @

enumeratorDDA K
.DDK L
CurrentDDL S
)DDS T
.DDT U
	SetPrecioEE 
(EE 
precioEE $
.EE$ %
PrecioEE% +
)EE+ ,
.EE, -
BuildEE- 2
(EE2 3
)EE3 4
;EE4 5
clienteGG 
.GG 
	AddPrecioGG %
(GG% &
precioProductoGG& 4
)GG4 5
;GG5 6
}HH 
)HH 
;HH 
}II 
catchJJ 
(JJ %
InvalidOperationExceptionJJ ,
eJJ- .
)JJ. /
{KK 
returnLL 
newLL 
ResponseLL #
{LL$ %
MensajeLL& -
=LL. /
eLL0 1
.LL1 2
MessageLL2 9
}LL: ;
;LL; <
}MM 
thisOO 
.OO 
_unitOfWorkOO 
.OO $
TerceroClienteRepositoryOO 5
.OO5 6
AddOO6 9
(OO9 :
clienteOO: A
)OOA B
;OOB C
thisPP 
.PP 
_unitOfWorkPP 
.PP 
CommitPP #
(PP# $
)PP$ %
;PP% &
returnQQ 
newQQ 
ResponseQQ 
{RR 
MensajeSS 
=SS 
$strSS 8
,SS8 9
DataTT 
=TT 
newTT !
TerceroClienteRequestTT 0
(TT0 1
)TT1 2
.TT2 3
MapTT3 6
(TT6 7
clienteTT7 >
)TT> ?
}UU 
;UU 
}VV 	
}WW 
}XX œ
àc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\EmpleadoServices\TerceroEmpleadoBuscarService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
EmpleadoServices0 @
{ 
public		 

class		 (
TerceroEmpleadoBuscarService		 -
{

 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public (
TerceroEmpleadoBuscarService +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
)B C
{ 	
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
} 	
public 
Response 
BuscarEmpleado &
(& '
int' *
id+ -
)- .
{ 	
TerceroEmpleado 
empleado $
=% &
this' +
.+ ,

unitOfWork, 6
.6 7%
TerceroEmpleadoRepository7 P
.P Q
FindBy 
( 
empleado 
=>  "
empleado# +
.+ ,
Id, .
==/ 1
id2 4
,4 5
includeProperties6 G
:G H
$strI R
)R S
.S T
FirstOrDefaultT b
(b c
)c d
;d e
if 
( 
empleado 
== 
null  
)  !
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$str :
} 
; 
} 
return 
new 
Response 
{ 
Data 
= 
new "
TerceroEmpleadoRequest 1
(1 2
)2 3
.3 4
Map4 7
(7 8
empleado8 @
)@ A
} 
; 
}   	
}!! 
}"" É
ác:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\EmpleadoServices\TerceroEmpleadoCrearService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
EmpleadoServices0 @
{ 
public		 

class		 '
TerceroEmpleadoCrearService		 ,
{

 
	protected 
readonly 
IUnitOfWork &
_unitOfWork' 2
;2 3
public '
TerceroEmpleadoCrearService *
(* +
IUnitOfWork+ 6

unitOfWork7 A
)A B
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
Crear 
( "
TerceroEmpleadoRequest 4
request5 <
)< =
{ 	
Tercero 
tercero 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
if 
( 
tercero 
== 
null 
)  
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$"  
La identificaci√≥n   2
{2 3
request3 :
.: ;

NitTercero; E
}E F
,F G
"G H
+I J
$" 8
, no se encuentra registrada hasta el momento B
"B C
} 
; 
} 
TerceroEmpleado 
empleado $
=% &
this' +
.+ ,
_unitOfWork, 7
.7 8%
TerceroEmpleadoRepository8 Q
.Q R
FindBy 
( 
empleado 
=>  "
empleado# +
.+ ,
Tercero, 3
.3 4
Nit4 7
==8 :
request; B
.B C

NitTerceroC M
,M N
includeProperties !
:! "
$str# ,
), -
.- .
FirstOrDefault. <
(< =
)= >
;> ?
if 
( 
empleado 
!= 
null  
)  !
{   
return!! 
new!! 
Response!! #
{"" 
Mensaje## 
=## 
$"##  I
=No se pudo registrar el empleado porque ya esta en el sistema##  ]
"##] ^
}$$ 
;$$ 
}%% 
empleado&& 
=&& 
new&& 
TerceroEmpleado&& *
(&&* +
tercero&&+ 2
)&&2 3
;&&3 4
this'' 
.'' 
_unitOfWork'' 
.'' %
TerceroEmpleadoRepository'' 6
.''6 7
Add''7 :
('': ;
empleado''; C
)''C D
;''D E
this(( 
.(( 
_unitOfWork(( 
.(( 
Commit(( #
(((# $
)(($ %
;((% &
return)) 
new)) 
Response)) 
{** 
Mensaje++ 
=++ 
$str++ 9
,++9 :
Data,, 
=,, 
new,, "
TerceroEmpleadoRequest,, 1
(,,1 2
),,2 3
.,,3 4
Map,,4 7
(,,7 8
empleado,,8 @
),,@ A
}-- 
;-- 
}.. 	
}// 
}00 ä
âc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ProveedorServices\TerceroProveedorCrearService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
ProveedorServices0 A
{ 
public 

class (
TerceroProveedorCrearService -
{		 
private

 
readonly

 
IUnitOfWork

 $
_unitOfWork

% 0
;

0 1
public (
TerceroProveedorCrearService +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
)B C
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
Crear 
( "
TerceroProvedorRequest 4
request5 <
)< =
{ 	
Tercero 
tercero 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
if 
( 
tercero 
== 
null 
)  
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$"  
La identificaci√≥n   2
{2 3
request3 :
.: ;

NitTercero; E
}E F
,F G
"G H
+I J
$" 8
, no se encuentra registrada hasta el momento B
"B C
} 
; 
} 
TerceroProveedor 
provedor %
=& '
this( ,
., -
_unitOfWork- 8
.8 9%
TerceroProvedorRepository9 R
.R S
FindBy 
( 
provedor 
=>  "
provedor# +
.+ ,
Tercero, 3
.3 4
Nit4 7
==8 :
request; B
.B C

NitTerceroC M
,M N
includeProperties !
:! "
$str# ,
), -
.- .
FirstOrDefault. <
(< =
)= >
;> ?
if 
( 
provedor 
!= 
null  
)  !
{   
return!! 
new!! 
Response!! #
{"" 
Mensaje## 
=## 
$"##  K
?No se pudo registrar el proveedor porque ya est√° en el sistema##  ^
"##^ _
}$$ 
;$$ 
}%% 
provedor&& 
=&& 
new&& 
TerceroProveedor&& +
(&&+ ,
tercero&&, 3
)&&3 4
;&&4 5
this'' 
.'' 
_unitOfWork'' 
.'' %
TerceroProvedorRepository'' 6
.''6 7
Add''7 :
('': ;
provedor''; C
)''C D
;''D E
this(( 
.(( 
_unitOfWork(( 
.(( 
Commit(( #
(((# $
)(($ %
;((% &
return)) 
new)) 
Response)) 
{** 
Mensaje++ 
=++ 
$str++ :
,++: ;
Data,, 
=,, 
new,, "
TerceroProvedorRequest,, 1
(,,1 2
),,2 3
.,,3 4
Map,,4 7
(,,7 8
provedor,,8 @
),,@ A
}-- 
;-- 
}.. 	
}// 
}00 √
~c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\TerceroServices\TerceroCrearService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
TerceroServices0 ?
{ 
public 

class 
TerceroCrearService $
{		 
	protected

 
readonly

 
IUnitOfWork

 &
_unitOfWork

' 2
;

2 3
public 
TerceroCrearService "
(" #
IUnitOfWork# .

unitOfWork/ 9
)9 :
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
CrearTercero $
($ %
TerceroRequest% 3
request4 ;
); <
{ 	
Tercero 
tercero 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
if 
( 
tercero 
!= 
null 
)  
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$"0 2
El nit 2 9
{9 :
request: A
.A B

NitTerceroB L
}L M'
 ya se encuentra registradoM h
"h i
}j k
;k l
} 
tercero 
= 
new 
Tercero !
.! "
TerceroBuilder" 0
(0 1
request1 8
.8 9

NitTercero9 C
,C D
requestE L
.L M
RazonSocialTerceroM _
)_ `
.` a
Builda f
(f g
)g h
;h i
request 
. 
ContactosTercero $
.$ %
ForEach% ,
(, -
(- .
contacto. 6
)6 7
=>8 :
{ 
tercero 
. 
	Contactos !
.! "
Add" %
(% &
new 
Contacto  
.  !
ContactoBuilder! 0
(0 1
)1 2
.2 3
SetDireccion  
(  !
contacto! )
.) *
TerceroDireccion* :
): ;
.; <
SetEmail 
( 
contacto %
.% &
TerceroEmail& 2
)2 3
.3 4
SetNumeroCelular $
($ %
contacto% -
.- . 
TerceroNumeroCelular. B
)B C
.C D
BuildD I
(I J
)J K
)   
;   
}!! 
)!! 
;!! 
this"" 
."" 
_unitOfWork"" 
."" 
TerceroRepository"" .
."". /
Add""/ 2
(""2 3
tercero""3 :
)"": ;
;""; <
this## 
.## 
_unitOfWork## 
.## 
Commit## #
(### $
)##$ %
;##% &
return$$ 
new$$ 
Response$$ 
{%% 
Mensaje&& 
=&& 
$str&& 8
,&&8 9
Data'' 
='' 
new'' 
TerceroRequest'' )
('') *
)''* +
.''+ ,
Map'', /
(''/ 0
tercero''0 7
)''7 8
}(( 
;(( 
})) 	
}** 
}++ º
c:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\TerceroServices\TerceroGetAllService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
TerceroServices0 ?
{ 
public 

class  
TerceroGetAllService %
{		 
	protected

 
readonly

 
IUnitOfWork

 &
_unitOfWork

' 2
;

2 3
public  
TerceroGetAllService #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
IEnumerable 
< 
TerceroRequest )
>) *
GetTerceros+ 6
(6 7
)7 8
{ 	
List 
< 
TerceroRequest 
>  
terceros! )
=* +
new, /
List0 4
<4 5
TerceroRequest5 C
>C D
(D E
)E F
;F G
this 
. 
_unitOfWork 
. 
TerceroRepository .
.. /
GetAll/ 5
(5 6
)6 7
.7 8
ToList8 >
(> ?
)? @
.@ A
ForEach 
( 
( 
tercero 
)  
=>! #
{ 
terceros 
. 
Add 
(  
new  #
TerceroRequest$ 2
(2 3
)3 4
.4 5
Map5 8
(8 9
tercero9 @
)@ A
)A B
;B C
} 
) 
; 
return 
terceros 
; 
} 	
} 
}  
Öc:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\UsuarioServices\TerceroUsuarioCrearService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
UsuarioServices0 ?
{ 
public 

class &
TerceroUsuarioCrearService +
{

 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public &
TerceroUsuarioCrearService )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
Crear 
( !
TerceroUsuarioRequest 3
request4 ;
); <
{ 	
Tercero 
tercero 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
FindFirstOrDefault "
(" #
tercero# *
=>+ -
tercero. 5
.5 6
Nit6 9
==: <
request= D
.D E

NitTerceroE O
)O P
;P Q
if 
( 
tercero 
== 
null 
)  
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$"0 2
El nit 2 9
{9 :
request: A
.A B

NitTerceroB L
}L M'
 no se encuentra registradoM h
"h i
}j k
;k l
} 
var 
usuario 
= 
new (
TerceroUsuarioValidarService :
(: ;
this; ?
.? @
_unitOfWork@ K
)K L
.L M!
ValidarTerceroUsuarioM b
(b c
requestc j
)j k
;k l
if 
( 
usuario 
!= 
null 
)  
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 T
}U V
;V W
} 
TerceroUsuario 
terceroUsuario )
=* +
new, /
TerceroUsuario0 >
(> ?
tercero? F
)F G
;G H
terceroUsuario 
. 
Password #
=$ %
request& -
.- .
PasswordTercero. =
;= >
terceroUsuario 
. 
Usuario "
=# $
request% ,
., -
UsuarioTercero- ;
;; <
this   
.   
_unitOfWork   
.   $
TerceroUsuarioRepository   5
.  5 6
Add  6 9
(  9 :
terceroUsuario  : H
)  H I
;  I J
this!! 
.!! 
_unitOfWork!! 
.!! 
Commit!! #
(!!# $
)!!$ %
;!!% &
return"" 
new"" 
Response"" 
{## 
Mensaje$$ 
=$$ 
$str$$ 8
,$$8 9
Data%% 
=%% 
request%% 
.%% 
Map%% "
(%%" #
terceroUsuario%%# 1
)%%1 2
}&& 
;&& 
}(( 	
})) 
}** ¡
ác:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\UsuarioServices\TerceroUsuarioValidarService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
UsuarioServices0 ?
{ 
public		 

class		 (
TerceroUsuarioValidarService		 -
{

 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public (
TerceroUsuarioValidarService +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
)B C
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
TerceroUsuario !
ValidarTerceroUsuario 3
(3 4!
TerceroUsuarioRequest4 I
requestJ Q
)Q R
{ 	
return 
this 
. 
_unitOfWork #
.# $$
TerceroUsuarioRepository$ <
.< =
FindBy 
( 
usuario 
=> !
request" )
.) *
UsuarioTercero* 8
==9 ;
usuario< C
.C D
UsuarioD K
&&L N
usuario 
. 
Password  
==! #
request$ +
.+ ,
PasswordTercero, ;
,; <
includeProperties= N
:N O
$strP Y
)Y Z
.Z [
FirstOrDefault[ i
(i j
)j k
;k l
} 	
} 
} 