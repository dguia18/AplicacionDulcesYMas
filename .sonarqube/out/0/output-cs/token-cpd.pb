Ì
Zc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Base\BaseEntity.cs
	namespace 	
Domain
 
. 
Base 
{ 
public 

abstract 
class 

BaseEntity $
{ 
} 
public 

abstract 
class 
Entity  
<  !
T! "
>" #
:$ %

BaseEntity& 0
,0 1
IEntity2 9
<9 :
T: ;
>; <
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
} ≈
Wc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Base\IEntity.cs
	namespace 	
Domain
 
. 
Base 
{ 
public 

	interface 
IEntity 
< 
T 
> 
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
} ‡
ec:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IBuilderProducto.cs
	namespace 	
Domain
 
. 
	Contracts 
{ 
public 

	interface 
IBuilderProducto %
:& '#
IGenericBuilderProducto( ?
<? @
Producto@ H
>H I
{ 
} 
public 
	interface (
IBuilderProductoMateriaPrima 2
:3 4#
IGenericBuilderProducto5 L
<L M 
ProductoMateriaPrimaM a
>a b
{ 
}		 
public		 
	interface		 3
'IBuilderProductoParaVenderSinEnvoltorio		 =
:		> ?#
IGenericBuilderProducto		@ W
<		W X+
ProductoParaVenderSinEnvoltorio		X w
>		w x
{

 
} 
public 
	interface 3
'IBuilderProductoParaVenderConEnvoltorio =
:> ?#
IGenericBuilderProducto@ W
<W X+
ProductoParaVenderConEnvoltorioX w
>w x
{ 
} 
public 
	interface -
!IBuilderProductoParaFabricarSuave 7
:8 9#
IGenericBuilderProducto: Q
<Q R%
ProductoParaFabricarSuaveR k
>k l
{ 
} 
public 
	interface ,
 IBuilderProductoParaFabricarDuro 6
:7 8#
IGenericBuilderProducto9 P
<P Q$
ProductoParaFabricarDuroQ i
>i j
{ 
} 
} É
lc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IGenericBuilderProducto.cs
	namespace 	
Domain
 
. 
	Contracts 
{ 
public 

	interface #
IGenericBuilderProducto ,
<, -
out- 0
T1 2
>2 3
where4 9
T: ;
:< =
Producto> F
{ 
public 
T	 

SetCostoUnitario 
( 
double "
costo# (
)( )
;) *
public 
T	 

SetCantidad 
( 
double 
cantidad &
)& '
;' (
public		 
T			 

	SetNombre		 
(		 
string		 
nombre		 "
)		" #
;		# $
public

 
T

	 

SetUnidadDeMedida

 
(

 
UnidadDeMedida

 +
unidadDeMedida

, :
)

: ;
;

; <
public 
T	 
#
SetPorcentajeDeUtilidad "
(" #
double# ) 
porcentajeDeUtilidad* >
)> ?
;? @
public 
T	 

SetEspecificacion 
( 
Especificacion +
especificacion, :
): ;
;; <
public 
T	 

SetTipo 
( 
Tipo 
tipo 
) 
; 
} 
} Â
gc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IGenericRepository.cs
	namespace 	
Domain
 
. 
	Contracts 
{		 
public

 

	interface

 
IGenericRepository

 '
<

' (
T

( )
>

) *
where

+ 0
T

1 2
:

3 4

BaseEntity

5 ?
{ 
T 	
Find
 
( 
object 
id 
) 
; 
void 
Add 
( 
T 
entity 
) 
; 
void 
Delete 
( 
T 
entity 
) 
; 
void 
Edit 
( 
T 
entity 
) 
; 
void 
AddRange 
( 
List 
< 
T 
> 
entities &
)& '
;' (
void 
DeleteRange 
( 
List 
< 
T 
>  
entities! )
)) *
;* +
IEnumerable 
< 
T 
> 
GetAll 
( 
) 
;  
T 	
FindFirstOrDefault
 
( 

Expression '
<' (
Func( ,
<, -
T- .
,. /
bool0 4
>4 5
>5 6
	predicate7 @
)@ A
;A B
IEnumerable 
< 
T 
> 
FindBy 
( 

Expression (
<( )
Func) -
<- .
T. /
,/ 0
bool1 5
>5 6
>6 7
	predicate8 A
)A B
;B C
IEnumerable 
< 
T 
> 
FindBy 
( 

Expression 
< 
Func 
< 
T 
, 
bool #
># $
>$ %
filter& ,
=- .
null/ 3
,3 4
Func 
< 

IQueryable 
< 
T 
> 
, 
IOrderedQueryable 
< 
T 
>  
>  !
orderBy" )
=* +
null, 0
,0 1
string 
includeProperties $
=% &
$str' )
)	 

;
 
}   
}!! “
jc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IProductoParaFabricar.cs
	namespace 	
Domain
 
. 
	Contracts 
{ 
public 

	interface !
IProductoParaFabricar *
{ 
void 
AgregarFabricacion 
(  
Fabricacion  +
fabricacion, 7
)7 8
;8 9
} 
}		 Ê
hc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IProductoParaVender.cs
	namespace 	
Domain
 
. 
	Contracts 
{ 
public 

	interface 
IProductoParaVender (
{ 
void 
AgregarDetalle 
( %
ProductoParaVenderDetalle 5%
productoParaVenderDetalle6 O
)O P
;P Q
} 
}		 Œ

`c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IUnitOfWork.cs
	namespace 	
Domain
 
. 
	Contracts 
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
IProductoRepository 
ProductoRepository .
{/ 0
get1 4
;4 5
}6 7
ITerceroRepository		 
TerceroRepository		 ,
{		- .
get		/ 2
;		2 3
}		4 5%
ITerceroUsuarioRepository

 !$
TerceroUsuarioRepository

" :
{

; <
get

= @
;

@ A
}

B C&
ITerceroEmpleadoRepository "%
TerceroEmpleadoRepository# <
{= >
get? B
;B C
}D E&
ITerceroProvedorRepository "%
TerceroProvedorRepository# <
{= >
get? B
;B C
}D E%
ITerceroClienteRepository !$
TerceroClienteRepository" :
{; <
get= @
;@ A
}B C
ICompraRepository 
CompraRepository *
{+ ,
get- 0
;0 1
}2 3
int 
Commit 
( 
) 
; 
} 
} ‡#
Zc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Compra.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public		 
class		 
Compra		 
:		 
Entity		 
<		 
int		 !
>		! "
{

 
public 
double	 
Total 
{ 
get 
; 
set  
;  !
}" #
public 
TerceroProveedor	 
	Proveedor #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TerceroUsuario	 
Usuario 
{  !
get" %
;% &
set' *
;* +
}, -
public 
List	 
< 
CompraDetalle 
> 
DetallesCompra +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
DateTime	 
Fecha 
{ 
get 
; 
set "
;" #
}$ %
public 
Compra	 
( 
) 
{ 
this 
. 
Fecha 
= 
DateTime 
. 
Now 
; 
} 
public 
Compra	 
( 
CompraBuilder 
compraBuilder +
)+ ,
{ 
this 
. 
	Proveedor 
= 
compraBuilder !
.! "
	Proveedor" +
;+ ,
this 
. 
Usuario 
= 
compraBuilder 
.  
Usuario  '
;' (
this 
. 
Fecha 
= 
DateTime 
. 
Now 
; 
this 
. 
DetallesCompra 
= 
new 
List !
<! "
CompraDetalle" /
>/ 0
(0 1
)1 2
;2 3
} 
public 
void	 

AddDetalle 
( 
CompraDetalle &
detalle' .
). /
{ 
this 
. 
DetallesCompra 
. 
Add 
( 
detalle "
)" #
;# $
this 
. 
Total 
+= 
detalle 
. 
GetTotal !
(! "
)" #
;# $
} 
public   
void  	 &
AgregarCantidadesProductos   (
(  ( )
)  ) *
{!! 
this"" 
."" 
DetallesCompra"" 
."" 
ForEach"" 
("" 
(""  
detalle""  '
)""' (
=>"") +
{## 
detalle$$ 
.$$ 
Producto$$ 
.$$ 
AdicionarCantidad$$ &
($$& '
detalle$$' .
.$$. /
Cantidad$$/ 7
)$$7 8
;$$8 9
}%% 
)%% 
;%% 
}&& 
public'' 
class''	 
CompraBuilder'' 
{(( 
public)) 	
TerceroProveedor))
 
	Proveedor)) $
{))% &
get))' *
;))* +
private)), 3
set))4 7
;))7 8
}))9 :
public** 	
TerceroUsuario**
 
Usuario**  
{**! "
get**# &
;**& '
private**( /
set**0 3
;**3 4
}**5 6
public++ 	
CompraBuilder++
 
(++ 
TerceroProveedor++ (
provedor++) 1
,++1 2
TerceroUsuario++3 A
usuario++B I
)++I J
{,, 
this-- 
.-- 	
	Proveedor--	 
=-- 
provedor-- 
;-- 
this.. 
... 	
Usuario..	 
=.. 
usuario.. 
;.. 
}// 
public00 	
Compra00
 
Build00 
(00 
)00 
{11 
Compra22 

compra22 
=22 
new22 
Compra22 
(22 
this22 #
)22# $
;22$ %
return33 

compra33 
;33 
}44 
}55 
}66 
}77 ∫-
ac:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\CompraDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
CompraDetalle 
{ 
public 
int 
CompraId 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 

ProductoId 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
Producto		 
Producto		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
Compra

 
Compra
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
public 
double 
Valor 
{ 
get !
;! "
set# &
;& '
}( )
public 
double 
Cantidad 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
CompraDetalle 
( 
Producto %
producto& .
,. /
Compra0 6
compra7 =
)= >
{ 	
this 
. 
CompraId 
= 
compra "
." #
Id# %
;% &
this 
. 

ProductoId 
= 
producto &
.& '
Id' )
;) *
this 
. 
Producto 
= 
producto $
;$ %
this 
. 
Compra 
= 
compra  
;  !
} 	
public 
CompraDetalle 
(  
CompraDetalleBuilder 1 
compraDetalleBuilder2 F
)F G
{ 	
this 
. 
Producto 
=  
compraDetalleBuilder 0
.0 1
Producto1 9
;9 :
this 
. 
Compra 
=  
compraDetalleBuilder .
.. /
Compra/ 5
;5 6
this 
. 
Cantidad 
=  
compraDetalleBuilder 0
.0 1
Cantidad1 9
;9 :
this 
. 
Valor 
=  
compraDetalleBuilder -
.- .
Valor. 3
;3 4
} 	
public 
CompraDetalle 
( 
) 
{ 	
} 	
public   
double   
GetTotal   
(   
)    
{!! 	
return"" 
this"" 
."" 
Valor"" 
*"" 
this"" #
.""# $
Cantidad""$ ,
;"", -
}## 	
public$$ 
class$$  
CompraDetalleBuilder$$ )
{%% 	
public&& 
Producto&& 
Producto&& $
{&&% &
get&&' *
;&&* +
set&&, /
;&&/ 0
}&&1 2
public'' 
Compra'' 
Compra''  
{''! "
get''# &
;''& '
set''( +
;''+ ,
}''- .
public(( 
double(( 
Valor(( 
{((  !
get((" %
;((% &
set((' *
;((* +
}((, -
public)) 
double)) 
Cantidad)) "
{))# $
get))% (
;))( )
set))* -
;))- .
}))/ 0
public++  
CompraDetalleBuilder++ '
(++' (
Producto++( 0
producto++1 9
,++9 :
Compra++; A
compra++B H
)++H I
{,, 
this-- 
.-- 
Compra-- 
=-- 
compra-- $
;--$ %
this.. 
... 
Producto.. 
=.. 
producto..  (
;..( )
}// 
public00  
CompraDetalleBuilder00 '
SetCantidad00( 3
(003 4
double004 :
cantidad00; C
)00C D
{11 
this22 
.22 
Cantidad22 
=22 
cantidad22  (
;22( )
return33 
this33 
;33 
}44 
public55  
CompraDetalleBuilder55 '
SetCostoUnitario55( 8
(558 9
double559 ?
costo55@ E
)55E F
{66 
this77 
.77 
Valor77 
=77 
costo77 "
;77" #
return88 
this88 
;88 
}99 
public:: 
CompraDetalle::  
Build::! &
(::& '
)::' (
{;; 
CompraDetalle<< 
compra<< $
=<<% &
null<<' +
;<<+ ,
if== 
(== 
ValidarConstruccion== '
(==' (
)==( )
)==) *
{>> 
return?? 
new?? 
CompraDetalle?? ,
(??, -
this??- 1
)??1 2
;??2 3
}@@ 
returnAA 
compraAA 
;AA 
}BB 
privateDD 
boolDD 
ValidarConstruccionDD ,
(DD, -
)DD- .
{EE 
returnFF 
thisFF 
.FF 
CantidadFF $
>FF% &
$numFF' (
&&FF) +
thisFF, 0
.FF0 1
ValorFF1 6
>FF7 8
$numFF9 :
;FF: ;
}GG 
}HH 	
}II 
}JJ ∑
^c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Devolucion.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 

Devolucion 
: 
Entity $
<$ %
int% (
>( )
{		 
public

 
TerceroCliente

 
Cliente

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
public 
TerceroUsuario 
Usuario %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
double 
Total 
{ 
get !
;! "
set# &
;& '
}( )
public 
List 
< 
DevolucionDetalle %
>% &
DevolucionDetalles' 9
{: ;
get< ?
;? @
setA D
;D E
}F G
} 
} ô	
ec:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\DevolucionDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
DevolucionDetalle "
:# $
Entity$ *
<* +
int+ .
>. /
{ 
public 

Devolucion 

Devolucion $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public		 
Producto		 
Producto		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
int

 
DevolucionId

 
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
public 
int 

ProductoId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double 
Cantidad 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} æY
mc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\Producto.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public		 
abstract		 
class		 
Producto		 
:		  !
Entity		" (
<		( )
int		) ,
>		, -
,		- .
IProductoParaVender		/ B
,		B C!
IProductoParaFabricar

 
,

 
IBuilderProducto

 )
{ 
public 
string	 
Nombre 
{ 
get 
; 
set !
;! "
}# $
public 
double	 
Cantidad 
{ 
get 
; 
	protected  )
set* -
;- .
}/ 0
private 	
double
 
_costo 
; 
public 
virtual	 
double 
CostoUnitario %
{& '
get( +
=>, .
_costo/ 5
;5 6
set7 :
=>; =
_costo> D
=E F
MathG K
.K L
RoundL Q
(Q R
valueR W
,W X
$numY Z
)Z [
;[ \
}] ^
public 
UnidadDeMedida	 
UnidadDeMedida &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
double	  
PorcentajeDeUtilidad $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
$num5 7
;7 8
public 
double	 !
PrecioSugeridoDeVenta %
{& '
get( +
=>, .
Math/ 3
.3 4
Round4 9
(9 :
CostoUnitario: G
/H I
(J K
$numK L
-M N 
PorcentajeDeUtilidadO c
/d e
$numf i
)i j
,j k
$numk l
)l m
;m n
}o p
public 
Especificacion	 
Especificacion &
{' (
get) ,
;, -
	protected. 7
set8 ;
;; <
}= >
public 
Tipo	 
Tipo 
{ 
get 
; 
	protected #
set$ '
;' (
}) *
public 
Producto	 

Envoltorio 
{ 
get "
;" #
set$ '
;' (
}) *
public  
ProductoSubCategoria	 
SubCategoria *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
List	 
< 
Fabricacion 
> 
Fabricaciones (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
List	 
< 
CompraDetalle 
> 
DetallesCompra +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
DateTime0 8
.8 9
Now9 <
;< =
	protected 
Producto 
( 
) 
{ 
} 
public 
virtual	 
void 
AgregarFabricacion (
(( )
Fabricacion) 4
fabricacion5 @
)@ A
{   
}"" 
public## 
virtual##	 
void## 
AgregarDetalle## $
(##$ %%
ProductoParaVenderDetalle##% >%
productoParaVenderDetalle##? X
)##X Y
{$$ 
}&& 
public'' 
void''	 
SetEnvoltorio'' 
('' 
Producto'' $

envoltorio''% /
)''/ 0
{(( 
this)) 
.)) 

Envoltorio)) 
=)) 

envoltorio)) 
;))  
}** 
public++ 
void++	  
AgregarDetalleCompra++ "
(++" #
CompraDetalle++# 0
detalle++1 8
)++8 9
{,, 
this-- 
.-- 
DetallesCompra-- 
.-- 
Add-- 
(-- 
detalle-- "
)--" #
;--# $
}.. 
public// 
List//	 
<// 
string// 
>// "
PuedeDescontarCantidad// ,
(//, -
double//- 3
cantidad//4 <
)//< =
{00 
var11 
errores11 
=11 
new11 
List11 
<11 
string11  
>11  !
(11! "
)11" #
;11# $
if22 
(22 
(22 
this22 
.22 
Cantidad22 
-22 
cantidad22  
)22  !
<22" #
$num22$ %
)22% &
{33 
errores44 
.44 
Add44 
(44 
$"44 
El producto 44 
{44 
this44 #
.44# $
Nombre44$ *
}44* +<
0 No puede descontar cantidades, unidades escasas44+ [
"44[ \
)44\ ]
;44] ^
}55 
return66 	
errores66
 
;66 
}77 
public88 
bool88	 
DescontarCantidad88 
(88  
double88  &
cantidad88' /
)88/ 0
{99 
if:: 
(:: "
PuedeDescontarCantidad:: 
(:: 
cantidad:: &
)::& '
.::' (
Any::( +
(::+ ,
)::, -
)::- .
throw;; 	
new;;
 %
InvalidOperationException;; '
(;;' (
$str;;( E
);;E F
;;;F G
this<< 
.<< 
Cantidad<< 
-=<< 
cantidad<< 
;<< 
return== 	
true==
 
;== 
}>> 
public?? 
void??	 
AddCompraDetalle?? 
(?? 
CompraDetalle?? ,
detalle??- 4
)??4 5
{@@ 
thisAA 
.AA 
DetallesCompraAA 
.AA 
AddAA 
(AA 
detalleAA "
)AA" #
;AA# $
thisBB 
.BB 
AdicionarCantidadBB 
(BB 
detalleBB !
.BB! "
CantidadBB" *
)BB* +
;BB+ ,
}CC 
publicDD 
ProductoDD	 
SetCostoUnitarioDD "
(DD" #
doubleDD# )
costoDD* /
)DD/ 0
{EE 
thisFF 
.FF 
CostoUnitarioFF 
=FF 
costoFF 
;FF 
returnGG 	
thisGG
 
;GG 
}HH 
publicII 
ProductoII	 
SetCantidadII 
(II 
doubleII $
cantidadII% -
)II- .
{JJ 
thisKK 
.KK 
CantidadKK 
=KK 
cantidadKK 
;KK 
returnLL 	
thisLL
 
;LL 
}MM 
publicNN 
ProductoNN	 
	SetNombreNN 
(NN 
stringNN "
nombreNN# )
)NN) *
{OO 
thisPP 
.PP 
NombrePP 
=PP 
nombrePP 
;PP 
returnQQ 	
thisQQ
 
;QQ 
}RR 
publicSS 
ProductoSS	 
SetUnidadDeMedidaSS #
(SS# $
UnidadDeMedidaSS$ 2
unidadDeMedidaSS3 A
)SSA B
{TT 
thisUU 
.UU 
UnidadDeMedidaUU 
=UU 
unidadDeMedidaUU '
;UU' (
returnVV 	
thisVV
 
;VV 
}WW 
publicXX 
ProductoXX	 #
SetPorcentajeDeUtilidadXX )
(XX) *
doubleXX* 0 
porcentajeDeUtilidadXX1 E
)XXE F
{YY 
thisZZ 
.ZZ  
PorcentajeDeUtilidadZZ 
=ZZ  
porcentajeDeUtilidadZZ 3
;ZZ3 4
return[[ 	
this[[
 
;[[ 
}\\ 
public]] 
Producto]]	 
SetTipo]] 
(]] 
Tipo]] 
tipo]] #
)]]# $
{^^ 
this__ 
.__ 
Tipo__ 
=__ 
tipo__ 
;__ 
return`` 	
this``
 
;`` 
}aa 
publicbb 
voidbb	 
AdicionarCantidadbb 
(bb  
doublebb  &
cantidadbb' /
)bb/ 0
{cc 
thisdd 
.dd 
AplicarCantidaddd 
(dd 
cantidaddd  
)dd  !
;dd! "
thisee 
.ee 
ActualizarCostoee 
(ee 
)ee 
;ee 
}ff 
	protectedgg 
abstractgg 
voidgg 
AplicarCantidadgg )
(gg) *
doublegg* 0
cantidadgg1 9
)gg9 :
;gg: ;
	protectedhh 
abstracthh 
voidhh 
ActualizarCostohh )
(hh) *
)hh* +
;hh+ ,
publicii 
overrideii	 
stringii 
ToStringii !
(ii! "
)ii" #
{jj 
returnkk 	
stringkk
 
.kk 
Formatkk 
(kk 
$strkk '
+kk( )
$strll 
+ll 
$strmm 
,mm 
thismm 
.mm  
Nombremm  &
,mm& '
thismm( ,
.mm, -
CostoUnitariomm- :
,mm: ;
thisnn 
.nn 	
Cantidadnn	 
,nn 
thisnn 
.nn 
UnidadDeMedidann &
)nn& '
;nn' (
}oo 
publicqq 
Productoqq	 
SetEspecificacionqq #
(qq# $
Especificacionqq$ 2
especificacionqq3 A
)qqA B
{rr 
thisss 
.ss 
Especificacionss 
=ss 
especificacionss '
;ss' (
returntt 	
thistt
 
;tt 
}uu 
}vv 
publicww 
enumww 
Especificacionww 
{xx 
MateriaPrimayy 
,yy 
Durozz 
,zz 
Suave{{ 
,{{ 
TieneEnvoltorio|| 
,|| 
NoTieneEnvoltorio}} 
}~~ 
public 
enum 
Tipo 
{
ÄÄ 
MateriaPrima
ÅÅ 
,
ÅÅ 
ParaFabricar
ÇÇ 
,
ÇÇ 

ParaVender
ÉÉ 
}
ÑÑ 
public
ÖÖ 
enum
ÖÖ 
UnidadDeMedida
ÖÖ 
{
ÜÜ 
Unidades
áá 

,
áá
 
Kilos
àà 
,
àà 
Libras
ââ 
,
ââ 	
Litros
ää 
,
ää 	
Onzas
ãã 
}
åå 
}çç ã
vc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoCategoria.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class 
ProductoCategoria "
:# $
Entity% +
<+ ,
int, /
>/ 0
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
List		 
<		  
ProductoSubCategoria		 (
>		( )
SubCategorias		* 7
{		8 9
get		: =
;		= >
set		? B
;		B C
}		D E
public

 
List

 
<

 
Producto

 
>

 
	Productos

 '
{

( )
get

* -
;

- .
set

/ 2
;

2 3
}

4 5
} 
} ˙(
yc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoMateriaPrima.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class  
ProductoMateriaPrima %
:& '
Producto( 0
{ 
public 
List 
< 
FabricacionDetalle &
>& '
FabricacionDetalles( ;
{< =
get> A
;A B
setC F
;F G
}H I
public		  
ProductoMateriaPrima		 #
(		# $
)		$ %
{

 	
FabricacionDetalles 
=  !
new" %
List& *
<* +
FabricacionDetalle+ =
>= >
(> ?
)? @
;@ A
this 
. 
DetallesCompra 
=  !
new" %
List& *
<* +
CompraDetalle+ 8
>8 9
(9 :
): ;
;; <
this 
. 
SetTipo 
( 
Tipo 
. 
MateriaPrima *
)* +
;+ ,
this 
. 
SetEspecificacion "
(" #
Especificacion# 1
.1 2
MateriaPrima2 >
)> ?
;? @
} 	
	protected 
override 
void 
ActualizarCosto )
() *
)* +
{ 	
var 
ultimaCompra 
= 
this #
.# $
DetallesCompra$ 2
.2 3
Last3 7
(7 8
)8 9
;9 :
this 
. 
CostoUnitario 
=  
(! "
this" &
.& '
CostoUnitario' 4
*4 5
this5 9
.9 :
Cantidad: B
+C D
ultimaCompra 
. 
Valor "
*" #
ultimaCompra# /
./ 0
Cantidad0 8
)8 9
/: ;
(< =
this= A
.A B
CantidadB J
+J K
ultimaCompraK W
.W X
CantidadX `
)` a
;a b
this 
. 
Cantidad 
+= 
ultimaCompra )
.) *
Cantidad* 2
;2 3
} 	
	protected 
override 
void 
AplicarCantidad  /
(/ 0
double0 6
cantidad7 ?
)? @
{ 	
} 	
public  
ProductoMateriaPrima #
SetCostoUnitario$ 4
(4 5
double5 ;
costo< A
)A B
{   	
this!! 
.!! 
CostoUnitario!! 
=!!  
costo!!! &
;!!& '
return"" 
this"" 
;"" 
}## 	
public%%  
ProductoMateriaPrima%% #
SetCantidad%%$ /
(%%/ 0
double%%0 6
cantidad%%7 ?
)%%? @
{&& 	
this'' 
.'' 
Cantidad'' 
='' 
cantidad'' $
;''$ %
return(( 
this(( 
;(( 
})) 	
public++  
ProductoMateriaPrima++ #
	SetNombre++$ -
(++- .
string++. 4
nombre++5 ;
)++; <
{,, 	
this-- 
.-- 
Nombre-- 
=-- 
nombre--  
;--  !
return.. 
this.. 
;.. 
}// 	
public11  
ProductoMateriaPrima11 #
SetUnidadDeMedida22 
(22 
UnidadDeMedida22 ,
unidadDeMedida22- ;
)22; <
{33 	
this44 
.44 
UnidadDeMedida44 
=44  !
unidadDeMedida44" 0
;440 1
return55 
this55 
;55 
}66 	
public88  
ProductoMateriaPrima88 ##
SetPorcentajeDeUtilidad99 #
(99# $
double99$ * 
porcentajeDeUtilidad99+ ?
)99? @
{:: 	
this;; 
.;;  
PorcentajeDeUtilidad;; %
=;;& ' 
porcentajeDeUtilidad;;( <
;;;< =
return<< 
this<< 
;<< 
}== 	
public??  
ProductoMateriaPrima?? #
SetEspecificacion@@ 
(@@ 
Especificacion@@ ,
especificacion@@- ;
)@@; <
{AA 	
thisBB 
.BB 
EspecificacionBB 
=BB  !
especificacionBB" 0
;BB0 1
returnCC 
thisCC 
;CC 
}DD 	
publicFF  
ProductoMateriaPrimaFF #
SetTipoFF$ +
(FF+ ,
TipoFF, 0
tipoFF1 5
)FF5 6
{GG 	
thisHH 
.HH 
TipoHH 
=HH 
tipoHH 
;HH 
returnII 
thisII 
;II 
}JJ 	
}KK 
}LL £
yc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaFabricar.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

abstract 
class  
ProductoParaFabricar .
:/ 0
Producto1 9
{ 
public 
List 
< %
ProductoParaVenderDetalle -
>- .&
ProductoParaVenderDetalles/ I
{J K
getL O
;O P
setQ T
;T U
}V W
} 
}		 È,
}c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaFabricarDuro.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class $
ProductoParaFabricarDuro )
:* + 
ProductoParaFabricar, @
,@ A,
 IBuilderProductoParaFabricarDuroB b
{		 
public

 $
ProductoParaFabricarDuro

 '
(

' (
)

( )
{ 	
this 
. 
SetEspecificacion "
(" #
Especificacion# 1
.1 2
Duro2 6
)6 7
;7 8
this 
. 
SetTipo 
( 
Tipo 
. 
ParaFabricar *
)* +
;+ ,
this 
. 
Fabricaciones 
=  
new! $
List% )
<) *
Fabricacion* 5
>5 6
(6 7
)7 8
;8 9
} 	
	protected 
override 
void 
AplicarCantidad  /
(/ 0
double0 6
cantidad7 ?
)? @
{ 	
this 
. 
GetLastFabricacion #
(# $
)$ %
.% &
SetCantidad& 1
(1 2
cantidad2 :
*; <
$num= ?
)? @
;@ A
} 	
	protected 
Fabricacion 
GetLastFabricacion 0
(0 1
)1 2
{ 	
return 
this 
. 
Fabricaciones %
.% &
Last& *
(* +
)+ ,
;, -
} 	
public 
override 
void 
AgregarFabricacion /
(/ 0
Fabricacion0 ;
fabricacion< G
)G H
{ 	
this 
. 
Fabricaciones 
. 
Add "
(" #
fabricacion# .
). /
;/ 0
} 	
	protected 
override 
void 
ActualizarCosto  /
(/ 0
)0 1
{ 	
var   
ultimaFabricacion   !
=  " #
this  $ (
.  ( )
GetLastFabricacion  ) ;
(  ; <
)  < =
;  = >
this!! 
.!! 
CostoUnitario!! 
=!!  
(!!! "
this!!" &
.!!& '
CostoUnitario!!' 4
*!!5 6
this!!7 ;
.!!; <
Cantidad!!< D
+!!E F
ultimaFabricacion"" !
.""! "
Costo""" '
)""' (
/"") *
(""+ ,
this"", 0
.""0 1
Cantidad""1 9
+"": ;
ultimaFabricacion""< M
.""M N
Cantidad""N V
)""V W
;""W X
this$$ 
.$$ 
Cantidad$$ 
+=$$ 
ultimaFabricacion$$ .
.$$. /
Cantidad$$/ 7
;$$7 8
}%% 	
public&& $
ProductoParaFabricarDuro&& '
SetCostoUnitario&&( 8
(&&8 9
double&&9 ?
costo&&@ E
)&&E F
{'' 	
this(( 
.(( 
CostoUnitario(( 
=((  
costo((! &
;((& '
return)) 
this)) 
;)) 
}** 	
public,, $
ProductoParaFabricarDuro,, '
SetCantidad,,( 3
(,,3 4
double,,4 :
cantidad,,; C
),,C D
{-- 	
this.. 
... 
Cantidad.. 
=.. 
cantidad.. $
;..$ %
return// 
this// 
;// 
}00 	
public22 $
ProductoParaFabricarDuro22 '
	SetNombre22( 1
(221 2
string222 8
nombre229 ?
)22? @
{33 	
this44 
.44 
Nombre44 
=44 
nombre44  
;44  !
return55 
this55 
;55 
}66 	
public88 $
ProductoParaFabricarDuro88 '
SetUnidadDeMedida88( 9
(889 :
UnidadDeMedida88: H
unidadDeMedida88I W
)88W X
{99 	
this:: 
.:: 
UnidadDeMedida:: 
=::  !
unidadDeMedida::" 0
;::0 1
return;; 
this;; 
;;; 
}<< 	
public>> $
ProductoParaFabricarDuro>> '#
SetPorcentajeDeUtilidad>>( ?
(>>? @
double>>@ F 
porcentajeDeUtilidad>>G [
)>>[ \
{?? 	
this@@ 
.@@  
PorcentajeDeUtilidad@@ %
=@@& ' 
porcentajeDeUtilidad@@( <
;@@< =
returnAA 
thisAA 
;AA 
}BB 	
publicDD $
ProductoParaFabricarDuroDD '
SetEspecificacionDD( 9
(DD9 :
EspecificacionDD: H
especificacionDDI W
)DDW X
{EE 	
thisFF 
.FF 
EspecificacionFF 
=FF  !
especificacionFF" 0
;FF0 1
returnGG 
thisGG 
;GG 
}HH 	
publicJJ $
ProductoParaFabricarDuroJJ '
SetTipoJJ( /
(JJ/ 0
TipoJJ0 4
tipoJJ5 9
)JJ9 :
{KK 	
thisLL 
.LL 
TipoLL 
=LL 
tipoLL 
;LL 
returnMM 
thisMM 
;MM 
}NN 	
}OO 
}PP ç0
~c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaFabricarSuave.cs
	namespace		 	
Domain		
 
.		 
Entities		 
.		 
EntitiesProducto		 *
{

 
public 

class %
ProductoParaFabricarSuave *
:+ , 
ProductoParaFabricar- A
,A B#
IGenericBuilderProductoC Z
<Z [%
ProductoParaFabricarSuave[ t
>t u
{ 
public %
ProductoParaFabricarSuave (
(( )
)) *
{ 	
this 
. 
SetEspecificacion "
(" #
Especificacion# 1
.1 2
Suave2 7
)7 8
;8 9
this 
. 
SetTipo 
( 
Tipo 
. 
ParaFabricar *
)* +
;+ ,
this 
. 
Fabricaciones 
=  
new! $
List% )
<) *
Fabricacion* 5
>5 6
(6 7
)7 8
;8 9
} 	
	protected 
override 
void 
AplicarCantidad  /
(/ 0
double0 6
cantidad7 ?
)? @
{ 	
this 
. 
GetLastFabricacion #
(# $
)$ %
.% &
SetCantidad& 1
(1 2
cantidad2 :
): ;
;; <
} 	
	protected 
Fabricacion 
GetLastFabricacion 0
(0 1
)1 2
{ 	
return 
this 
. 
Fabricaciones %
.% &
Last& *
(* +
)+ ,
;, -
} 	
public 
override 
void 
AgregarDetalle +
(+ ,%
ProductoParaVenderDetalle, E%
productoParaVenderDetalleF _
)_ `
{ 	
this 
. &
ProductoParaVenderDetalles +
.+ ,
Add, /
(/ 0%
productoParaVenderDetalle0 I
)I J
;J K
} 	
	protected 
override 
void 
ActualizarCosto  /
(/ 0
)0 1
{   	
var!! 
ultimaFabricacion!! !
=!!" #
this!!$ (
.!!( )
GetLastFabricacion!!) ;
(!!; <
)!!< =
;!!= >
this"" 
."" 
CostoUnitario"" 
=""  
(""! "
this""" &
.""& '
CostoUnitario""' 4
*""5 6
this""7 ;
.""; <
Cantidad""< D
+""E F
ultimaFabricacion## !
.##! "
Costo##" '
)##' (
/##) *
(##+ ,
this##, 0
.##0 1
Cantidad##1 9
+##: ;
ultimaFabricacion##< M
.##M N
Cantidad##N V
)##V W
;##W X
this%% 
.%% 
Cantidad%% 
+=%% 
ultimaFabricacion%% .
.%%. /
Cantidad%%/ 7
;%%7 8
}&& 	
public'' 
override'' 
void'' 
AgregarFabricacion'' /
(''/ 0
Fabricacion''0 ;
fabricacion''< G
)''G H
{(( 	
Fabricaciones)) 
.)) 
Add)) 
()) 
fabricacion)) )
)))) *
;))* +
}** 	
public++ %
ProductoParaFabricarSuave++ (
SetCostoUnitario++) 9
(++9 :
double++: @
costo++A F
)++F G
{,, 	
this-- 
.-- 
CostoUnitario-- 
=--  
costo--! &
;--& '
return.. 
this.. 
;.. 
}// 	
public11 %
ProductoParaFabricarSuave11 (
SetCantidad11) 4
(114 5
double115 ;
cantidad11< D
)11D E
{22 	
this33 
.33 
Cantidad33 
=33 
cantidad33 $
;33$ %
return44 
this44 
;44 
}55 	
public77 %
ProductoParaFabricarSuave77 (
	SetNombre77) 2
(772 3
string773 9
nombre77: @
)77@ A
{88 	
this99 
.99 
Nombre99 
=99 
nombre99  
;99  !
return:: 
this:: 
;:: 
};; 	
public== %
ProductoParaFabricarSuave== (
SetUnidadDeMedida==) :
(==: ;
UnidadDeMedida==; I
unidadDeMedida==J X
)==X Y
{>> 	
this?? 
.?? 
UnidadDeMedida?? 
=??  !
unidadDeMedida??" 0
;??0 1
return@@ 
this@@ 
;@@ 
}AA 	
publicCC %
ProductoParaFabricarSuaveCC (#
SetPorcentajeDeUtilidadCC) @
(CC@ A
doubleCCA G 
porcentajeDeUtilidadCCH \
)CC\ ]
{DD 	
thisEE 
.EE  
PorcentajeDeUtilidadEE %
=EE& ' 
porcentajeDeUtilidadEE( <
;EE< =
returnFF 
thisFF 
;FF 
}GG 	
publicII %
ProductoParaFabricarSuaveII (
SetEspecificacionII) :
(II: ;
EspecificacionII; I
especificacionIIJ X
)IIX Y
{JJ 	
thisKK 
.KK 
EspecificacionKK 
=KK  !
especificacionKK" 0
;KK0 1
returnLL 
thisLL 
;LL 
}MM 	
publicOO %
ProductoParaFabricarSuaveOO (
SetTipoOO) 0
(OO0 1
TipoOO1 5
tipoOO6 :
)OO: ;
{PP 	
thisQQ 
.QQ 
TipoQQ 
=QQ 
tipoQQ 
;QQ 
returnRR 
thisRR 
;RR 
}SS 	
}TT 
}UU ü
wc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVender.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

abstract 
class 
ProductoParaVender ,
:- .
Producto/ 7
{ 
public 
List 
< %
ProductoParaVenderDetalle -
>- .&
ProductoParaVenderDetalles &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
}		 
}

 »D
Ñc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderConEnvoltorio.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class +
ProductoParaVenderConEnvoltorio 0
:1 2
ProductoParaVender3 E
,E F#
IGenericBuilderProductoG ^
<^ _+
ProductoParaVenderConEnvoltorio_ ~
>~ 
{ 
private 
double 
cantidadProducida (
;( )
public		 +
ProductoParaVenderConEnvoltorio		 .
(		. /
)		/ 0
{

 	
this 
. &
ProductoParaVenderDetalles +
=, -
new. 1
List2 6
<6 7%
ProductoParaVenderDetalle7 P
>P Q
(Q R
)R S
;S T
this 
. 
DetallesCompra 
=  !
new" %
List& *
<* +
CompraDetalle+ 8
>8 9
(9 :
): ;
;; <
this 
. 
Especificacion 
=  !
Especificacion" 0
.0 1
TieneEnvoltorio1 @
;@ A
this 
. 
Tipo 
= 
Tipo 
. 

ParaVender '
;' (
} 	
public 
override 
void 
AgregarDetalle +
(+ ,%
ProductoParaVenderDetalle, E%
productoParaVenderDetalleF _
)_ `
{ 	
this 
. &
ProductoParaVenderDetalles +
.+ ,
Add, /
(/ 0%
productoParaVenderDetalle0 I
)I J
;J K
} 	
	protected 
override 
void 
ActualizarCosto  /
(/ 0
)0 1
{ 	
this 
. 
CostoUnitario 
=  
(! "
this" &
.& '
CostoUnitario' 4
*5 6
this6 :
.: ;
Cantidad; C
+D E&
ProductoParaVenderDetallesF `
.` a
Sum 
( 
producto 
=> 
producto  (
.( )
Costo) .
). /
*/ 0
cantidadProducida0 A
+ 

Envoltorio 
. 
CostoUnitario *
** +
cantidadProducida+ <
)< =
/= >
(> ?
this? C
.C D
CantidadD L
+M N
cantidadProducidaO `
)` a
;a b
this 
. 
Cantidad 
+= 
this !
.! "
cantidadProducida" 3
;3 4
} 	
	protected 
override 
void 
AplicarCantidad  /
(/ 0
double0 6
cantidad7 ?
)? @
{ 	
int 
verificador 
= 
$num 
;  
while   
(   
cantidad   
>   
$num   
)    
{!! 
if"" 
("" 
this"" 
."" 

Envoltorio"" #
.""# $"
PuedeDescontarCantidad""$ :
("": ;
$num""; <
)""< =
.""= >
Any""> A
(""A B
)""B C
)""C D
{## 
break$$ 
;$$ 
}%% 
verificador&& 
=&& 2
&ValidarQueTodosPuedanDescontarCantidad&& D
(&&D E
verificador&&E P
)&&P Q
;&&Q R
cantidad'' 
='' 
DescontarUnidades'' ,
('', -
cantidad''- 5
,''5 6
verificador''7 B
)''B C
;''C D
verificador(( 
=(( 
$num(( 
;((  
})) 
}** 	
private++ 
int++ 2
&ValidarQueTodosPuedanDescontarCantidad++ :
(++: ;
int++; >
verificador++? J
)++J K
{,, 	
foreach-- 
(-- 
var-- 
item-- 
in--  
this--! %
.--% &&
ProductoParaVenderDetalles--& @
)--@ A
{.. 
if// 
(// 
item// 
.// "
PuedeDescontarUnidades// /
(/// 0
)//0 1
.//1 2
Any//2 5
(//5 6
)//6 7
)//7 8
{00 
break11 
;11 
}22 
else33 
{44 
verificador55 
++55 !
;55! "
}66 
}77 
return99 
verificador99 
;99 
}:: 	
private;; 
double;; 
DescontarUnidades;; (
(;;( )
double;;) /
cantidad;;0 8
,;;8 9
int;;: =
verificador;;> I
);;I J
{<< 	
if== 
(== 
verificador== 
==== 
this== #
.==# $&
ProductoParaVenderDetalles==$ >
.==> ?
Count==? D
)==D E
{>> 
this?? 
.?? &
ProductoParaVenderDetalles?? /
.??/ 0
ForEach@@ 
(@@ 
t@@ 
=>@@  
t@@! "
.@@" #
DescontarUnidades@@# 4
(@@4 5
)@@5 6
)@@6 7
;@@7 8
thisBB 
.BB 

EnvoltorioBB 
.BB  
DescontarCantidadBB  1
(BB1 2
$numBB2 3
)BB3 4
;BB4 5
cantidadCC 
--CC 
;CC 
cantidadProducidaDD !
++DD! #
;DD# $
}EE 
elseFF 
{GG 
cantidadHH 
=HH 
-HH 
$numHH 
;HH 
}II 
returnKK 
cantidadKK 
;KK 
}LL 	
publicMM +
ProductoParaVenderConEnvoltorioMM .
SetCostoUnitarioMM/ ?
(MM? @
doubleMM@ F
costoMMG L
)MML M
{NN 	
thisOO 
.OO 
CostoUnitarioOO 
=OO  
costoOO! &
;OO& '
returnPP 
thisPP 
;PP 
}QQ 	
publicSS +
ProductoParaVenderConEnvoltorioSS .
SetCantidadSS/ :
(SS: ;
doubleSS; A
cantidadSSB J
)SSJ K
{TT 	
thisUU 
.UU 
CantidadUU 
=UU 
cantidadUU $
;UU$ %
returnVV 
thisVV 
;VV 
}WW 	
publicYY +
ProductoParaVenderConEnvoltorioYY .
	SetNombreYY/ 8
(YY8 9
stringYY9 ?
nombreYY@ F
)YYF G
{ZZ 	
this[[ 
.[[ 
Nombre[[ 
=[[ 
nombre[[  
;[[  !
return\\ 
this\\ 
;\\ 
}]] 	
public__ +
ProductoParaVenderConEnvoltorio__ .
SetUnidadDeMedida__/ @
(__@ A
UnidadDeMedida__A O
unidadDeMedida__P ^
)__^ _
{`` 	
thisaa 
.aa 
UnidadDeMedidaaa 
=aa  !
unidadDeMedidaaa" 0
;aa0 1
returnbb 
thisbb 
;bb 
}cc 	
publicee +
ProductoParaVenderConEnvoltorioee .#
SetPorcentajeDeUtilidadee/ F
(eeF G
doubleeeG M 
porcentajeDeUtilidadeeN b
)eeb c
{ff 	
thisgg 
.gg  
PorcentajeDeUtilidadgg %
=gg& ' 
porcentajeDeUtilidadgg( <
;gg< =
returnhh 
thishh 
;hh 
}ii 	
publickk +
ProductoParaVenderConEnvoltoriokk .
SetEspecificacionkk/ @
(kk@ A
EspecificacionkkA O
especificacionkkP ^
)kk^ _
{ll 	
thismm 
.mm 
Especificacionmm 
=mm  !
especificacionmm" 0
;mm0 1
returnnn 
thisnn 
;nn 
}oo 	
publicqq +
ProductoParaVenderConEnvoltorioqq .
SetTipoqq/ 6
(qq6 7
Tipoqq7 ;
tipoqq< @
)qq@ A
{rr 	
thisss 
.ss 
Tiposs 
=ss 
tiposs 
;ss 
returntt 
thistt 
;tt 
}uu 	
}ww 
}xx œ
~c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderDetalle.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class %
ProductoParaVenderDetalle *
:+ ,
Entity- 3
<3 4
int4 7
>7 8
{ 
public  
ProductoParaFabricar # 
ProductoParaFabricar$ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public		 
ProductoParaVender		 !
ProductoParaVender		" 4
{		5 6
get		7 :
;		: ;
set		< ?
;		? @
}		A B
public

 
int

 "
ProductoParaFabricarId

 )
{

* +
get

, /
;

/ 0
set

1 4
;

4 5
}

6 7
public 
int  
ProductoParaVenderId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
double 
Cantidad 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
double 
Costo 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public %
ProductoParaVenderDetalle (
(( ) 
ProductoParaFabricar) = 
productoParaFabricar> R
,R S
ProductoParaVender 
productoParaVender 1
)1 2
{ 	
this 
. "
ProductoParaFabricarId '
=( ) 
productoParaFabricar* >
.> ?
Id? A
;A B
this 
.  
ProductoParaVenderId %
=& '
productoParaVender( :
.: ;
Id; =
;= >
this 
. 
ProductoParaVender #
=$ %
productoParaVender& 8
;8 9
this 
.  
ProductoParaFabricar %
=& ' 
productoParaFabricar( <
;< =
} 	
public %
ProductoParaVenderDetalle (
(( )
)) *
{ 	
} 	
public 
void  
SetCantidadNecesaria (
(( )
double) /
cantidad0 8
)8 9
{ 	
this 
. 
Cantidad 
= 
cantidad $
;$ %
} 	
private 
void 
ActualizarCosto $
($ %
)% &
{ 	
this   
.   
Costo   
=   
this   
.   
Cantidad   &
*  ' ( 
ProductoParaFabricar  ) =
.  = >
CostoUnitario  > K
;  K L
}!! 	
public"" 
void"" 
DescontarUnidades"" %
(""% &
)""& '
{## 	 
ProductoParaFabricar$$  
.$$  !
DescontarCantidad$$! 2
($$2 3
this$$3 7
.$$7 8
Cantidad$$8 @
)$$@ A
;$$A B
this%% 
.%% 
ActualizarCosto%%  
(%%  !
)%%! "
;%%" #
}&& 	
public'' 
List'' 
<'' 
string'' 
>'' "
PuedeDescontarUnidades'' 2
(''2 3
)''3 4
{(( 	
return))  
ProductoParaFabricar)) '
.))' ("
PuedeDescontarCantidad))( >
())> ?
this))? C
.))C D
Cantidad))D L
)))L M
;))M N
}** 	
}++ 
},, ª@
Ñc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderSinEnvoltorio.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class +
ProductoParaVenderSinEnvoltorio 0
:1 2
ProductoParaVender3 E
,E F#
IGenericBuilderProductoF ]
<] ^+
ProductoParaVenderSinEnvoltorio^ }
>} ~
{ 
private 
double 
_cantidadProducida )
;) *
public		 +
ProductoParaVenderSinEnvoltorio		 .
(		. /
)		/ 0
{

 	
this 
. 
DetallesCompra 
=  !
new" %
List& *
<* +
CompraDetalle+ 8
>8 9
(9 :
): ;
;; <
this 
. &
ProductoParaVenderDetalles +
=, -
new. 1
List2 6
<6 7%
ProductoParaVenderDetalle7 P
>P Q
(Q R
)R S
;S T
this 
. 
SetEspecificacion "
(" #
Especificacion# 1
.1 2
TieneEnvoltorio2 A
)A B
;B C
this 
. 
SetTipo 
( 
Tipo 
. 

ParaVender (
)( )
;) *
} 	
	protected 
override 
void 
ActualizarCosto  /
(/ 0
)0 1
{ 	
this 
. 
CostoUnitario 
=  
(! "
this" &
.& '
Cantidad' /
*0 1
this2 6
.6 7
CostoUnitario7 D
+E F&
ProductoParaVenderDetallesG a
.a b
Sum 
( 
producto 
=> 
producto  (
.( )
Costo) .
). /
*/ 0
_cantidadProducida0 B
)B C
/C D
(D E
thisE I
.I J
CantidadJ R
+R S
thisS W
.W X
_cantidadProducidaX j
)j k
;l m
this 
. 
Cantidad 
+= 
this !
.! "
_cantidadProducida" 4
;4 5
} 	
public 
override 
void 
AgregarDetalle +
(+ ,%
ProductoParaVenderDetalle, E%
productoParaVenderDetalleF _
)_ `
{ 	
this 
. &
ProductoParaVenderDetalles +
.+ ,
Add, /
(/ 0%
productoParaVenderDetalle0 I
)I J
;J K
} 	
	protected 
override 
void 
AplicarCantidad  /
(/ 0
double0 6
cantidad7 ?
)? @
{ 	
int 
verificador 
= 
$num 
;  
while 
( 
cantidad 
> 
$num 
)  
{ 
verificador   
=   =
1ValidarQueTodosLosProductoPuedanDescontarCantidad   O
(  O P
verificador  P [
)  [ \
;  \ ]
cantidad!! 
=!! 
DescontarUnidades!! ,
(!!, -
cantidad!!- 5
,!!5 6
verificador!!7 B
)!!B C
;!!C D
verificador"" 
="" 
$num"" 
;""  
}## 
}$$ 	
private&& 
double&& 
DescontarUnidades&& (
(&&( )
double&&) /
cantidad&&0 8
,&&8 9
int&&: =
verificador&&> I
)&&I J
{'' 	
if(( 
((( 
verificador(( 
==(( 
this(( #
.((# $&
ProductoParaVenderDetalles(($ >
.((> ?
Count((? D
)((D E
{)) 
this** 
.** &
ProductoParaVenderDetalles** /
.**/ 0
ForEach**0 7
(**7 8
t**8 9
=>**: <
t**= >
.**> ?
DescontarUnidades**? P
(**P Q
)**Q R
)**R S
;**S T
cantidad++ 
--++ 
;++ 
_cantidadProducida,, "
++,," $
;,,$ %
}-- 
else.. 
{// 
cantidad00 
=00 
-00 
$num00 
;00 
}11 
return33 
cantidad33 
;33 
}44 	
private66 
int66 =
1ValidarQueTodosLosProductoPuedanDescontarCantidad66 E
(66E F
int66F I
verificador66J U
)66U V
{77 	
foreach88 
(88 
var88 
item88 
in88  
this88! %
.88% &&
ProductoParaVenderDetalles88& @
)88@ A
{99 
if:: 
(:: 
item:: 
.:: "
PuedeDescontarUnidades:: /
(::/ 0
)::0 1
.::1 2
Any::2 5
(::5 6
)::6 7
)::7 8
{;; 
break<< 
;<< 
}== 
else>> 
{?? 
verificador@@ 
++@@ !
;@@! "
}AA 
}BB 
returnDD 
verificadorDD 
;DD 
}EE 	
publicFF
 +
ProductoParaVenderSinEnvoltorioFF 0
SetCostoUnitarioFF1 A
(FFA B
doubleFFB H
costoFFI N
)FFN O
{GG 	
thisHH 
.HH 
CostoUnitarioHH 
=HH  
costoHH! &
;HH& '
returnII 
thisII 
;II 
}JJ 	
publicLL +
ProductoParaVenderSinEnvoltorioLL .
SetCantidadLL/ :
(LL: ;
doubleLL; A
cantidadLLB J
)LLJ K
{MM 	
thisNN 
.NN 
CantidadNN 
=NN 
cantidadNN $
;NN$ %
returnOO 
thisOO 
;OO 
}PP 	
publicRR +
ProductoParaVenderSinEnvoltorioRR .
	SetNombreRR/ 8
(RR8 9
stringRR9 ?
nombreRR@ F
)RRF G
{SS 	
thisTT 
.TT 
NombreTT 
=TT 
nombreTT  
;TT  !
returnUU 
thisUU 
;UU 
}VV 	
publicXX +
ProductoParaVenderSinEnvoltorioXX .
SetUnidadDeMedidaXX/ @
(XX@ A
UnidadDeMedidaXXA O
unidadDeMedidaXXP ^
)XX^ _
{YY 	
thisZZ 
.ZZ 
UnidadDeMedidaZZ 
=ZZ  !
unidadDeMedidaZZ" 0
;ZZ0 1
return[[ 
this[[ 
;[[ 
}\\ 	
public^^ +
ProductoParaVenderSinEnvoltorio^^ .#
SetPorcentajeDeUtilidad^^/ F
(^^F G
double^^G M 
porcentajeDeUtilidad^^N b
)^^b c
{__ 	
this`` 
.``  
PorcentajeDeUtilidad`` %
=``& ' 
porcentajeDeUtilidad``( <
;``< =
returnaa 
thisaa 
;aa 
}bb 	
publicdd +
ProductoParaVenderSinEnvoltoriodd .
SetEspecificaciondd/ @
(dd@ A
EspecificacionddA O
especificacionddP ^
)dd^ _
{ee 	
thisff 
.ff 
Especificacionff 
=ff  !
especificacionff" 0
;ff0 1
returngg 
thisgg 
;gg 
}hh 	
publicjj +
ProductoParaVenderSinEnvoltoriojj .
SetTipojj/ 6
(jj6 7
Tipojj7 ;
tipojj< @
)jj@ A
{kk 	
thisll 
.ll 
Tipoll 
=ll 
tipoll 
;ll 
returnmm 
thismm 
;mm 
}nn 	
}oo 
}pp ¬
yc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoSubCategoria.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class  
ProductoSubCategoria %
:& '
Entity( .
<. /
int/ 2
>2 3
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
List		 
<		  
ProductoSubCategoria		 (
>		( )
SubCategorias		* 7
{		8 9
get		: =
;		= >
set		? B
;		B C
}		D E
} 
} ù
_c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Fabricacion.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Fabricacion 
: 
Entity %
<% &
int& )
>) *
{		 
public

 
TerceroEmpleado

 
TerceroEmpleado

 .
{

/ 0
get

1 4
;

4 5
private

6 =
set

> A
;

A B
}

C D
public 
List 
< 
FabricacionDetalle &
>& '
FabricacionDetalles( ;
{< =
get> A
;A B
privateC J
setK N
;N O
}P Q
public 
double 
Cantidad 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
Costo 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
DateTime6 >
.> ?
Now? B
;B C
public 
Fabricacion 
( 
) 
{ 	
this 
. 
FabricacionDetalles $
=% &
new' *
List+ /
</ 0
FabricacionDetalle0 B
>B C
(C D
)D E
;E F
} 	
public 
Fabricacion 
( 
TerceroEmpleado *
terceroEmpleado+ :
): ;
{ 	
this 
. 
TerceroEmpleado  
=! "
terceroEmpleado# 2
;2 3
this 
. 
FabricacionDetalles $
=% &
new' *
List+ /
</ 0
FabricacionDetalle0 B
>B C
(C D
)D E
;E F
} 	
public 
void 
AgregarDetalle "
(" #
FabricacionDetalle# 5
detalle6 =
)= >
{ 	
this 
. 
FabricacionDetalles $
.$ %
Add% (
(( )
detalle) 0
)0 1
;1 2
this 
. 
Costo 
+= 
detalle !
.! "
Cantidad" *
*+ ,
detalle- 4
.4 5
MateriaPrima5 A
.A B
CostoUnitarioB O
;O P
} 	
public 
void 
SetEmpleado 
(  
TerceroEmpleado  /
terceroEmpleado0 ?
)? @
{ 	
this 
. 
TerceroEmpleado  
=! "
terceroEmpleado# 2
;2 3
}   	
public!! 
void!! 
SetCantidad!! 
(!!  
double!!  &
cantidadProducida!!' 8
)!!8 9
{"" 	
this## 
.## 
Cantidad## 
=## 
cantidadProducida## -
;##- .
}$$ 	
public&& 
void&& /
#DescontarCantidadesEnMateriasPrimas&& 7
(&&7 8
)&&8 9
{'' 	
this(( 
.(( 
FabricacionDetalles(( $
.(($ %
ForEach((% ,
(((, -
detalle((- 4
=>((5 7
{)) 
detalle** 
.** 
MateriaPrima** $
.**$ %
DescontarCantidad**% 6
(**6 7
detalle**7 >
.**> ?
Cantidad**? G
)**G H
;**H I
}++ 
)++ 
;++ 
},, 	
}-- 
}.. ™
fc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\FabricacionDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
FabricacionDetalle #
{ 
public 
Fabricacion 
Fabricacion &
{' (
get) ,
;, -
private. 5
set6 9
;9 :
}; <
public 
Producto 
MateriaPrima $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public		 
int		 
FabricacionId		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
int

 
MateriaPrimaId

 !
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
double 
Cantidad 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
double 
Costo 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
FabricacionDetalle !
(! "
Fabricacion" -
fabricacion. 9
,9 :
Producto 
materiaPrima !
)! "
{ 	
this 
. 
FabricacionId 
=  
fabricacion! ,
., -
Id- /
;/ 0
this 
. 
MateriaPrimaId 
=  !
materiaPrima" .
.. /
Id/ 1
;1 2
this 
. 
Fabricacion 
= 
fabricacion *
;* +
this 
. 
MateriaPrima 
= 
materiaPrima  ,
;, -
this 
. 
Costo 
= 
materiaPrima %
.% &
CostoUnitario& 3
;3 4
} 	
public 
FabricacionDetalle !
(! "
Fabricacion" -
fabricacion. 9
,9 :
Producto 
materiaPrima !
,! "
double# )
cantidad* 2
)2 3
{ 	
this 
. 
FabricacionId 
=  
fabricacion! ,
., -
Id- /
;/ 0
this 
. 
MateriaPrimaId 
=  !
materiaPrima" .
.. /
Id/ 1
;1 2
this 
. 
Fabricacion 
= 
fabricacion *
;* +
this 
. 
MateriaPrima 
= 
materiaPrima  ,
;, -
this 
. 
Cantidad 
= 
cantidad $
;$ %
this 
. 
Costo 
= 
materiaPrima %
.% &
CostoUnitario& 3
;3 4
} 	
public   
FabricacionDetalle   !
(  ! "
)  " #
{!! 	
}"" 	
public## 
FabricacionDetalle## !
SetCantidad##" -
(##- .
double##. 4
cantidad##5 =
)##= >
{$$ 	
this%% 
.%% 
Cantidad%% 
=%% 
cantidad%% $
;%%$ %
return&& 
this&& 
;&& 
}'' 	
}(( 
})) Î
Wc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Rol.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Rol 
: 
Entity 
< 
int !
>! "
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
override		 
string		 
ToString		 '
(		' (
)		( )
{

 	
return 
Nombre 
+ 
$str 
;  
} 	
} 
} ‚
dc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Contacto.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
Contacto 
: 
Entity "
<" #
int# &
>& '
{ 
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
NumeroCelular		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
Contacto 
( 
ContactoBuilder '
builder( /
)/ 0
{ 	
this 
. 
	Direccion 
= 
builder $
.$ %
	Direccion% .
;. /
this 
. 
NumeroCelular 
=  
builder! (
.( )
NumeroCelular) 6
;6 7
this 
. 
Email 
= 
builder  
.  !
Email! &
;& '
} 	
public 
Contacto 
( 
) 
{ 	
} 	
public 
class 
ContactoBuilder $
{ 	
public 
string 
	Direccion #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
public 
string 
NumeroCelular '
{( )
get* -
;- .
private/ 6
set7 :
;: ;
}< =
public 
string 
Email 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
ContactoBuilder "
SetDireccion# /
(/ 0
string0 6
	direccion7 @
)@ A
{ 
this 
. 
	Direccion 
=  
	direccion! *
;* +
return 
this 
; 
} 
public 
ContactoBuilder "
SetNumeroCelular# 3
(3 4
string4 :
celular; B
)B C
{   
this!! 
.!! 
NumeroCelular!! "
=!!# $
celular!!% ,
;!!, -
return"" 
this"" 
;"" 
}## 
public$$ 
ContactoBuilder$$ "
SetEmail$$# +
($$+ ,
string$$, 2
email$$3 8
)$$8 9
{%% 
this&& 
.&& 
Email&& 
=&& 
email&& "
;&&" #
return'' 
this'' 
;'' 
}(( 
public)) 
Contacto)) 
Build)) !
())! "
)))" #
{** 
Contacto++ 
contacto++ !
=++" #
new++$ '
Contacto++( 0
(++0 1
this++1 5
)++5 6
;++6 7
return,, 
contacto,, 
;,,  
}-- 
}.. 	
}// 
}00 ≥!
cc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Tercero.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
Tercero 
: 
Entity !
<! "
int" %
>% &
{ 
public		 
string		 
Nit		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
public

 
string

 
RazonSocial
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
public 
List 
< 
Contacto 
> 
	Contactos '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
DateTime6 >
.> ?
Now? B
;B C
public 
List 
< 
TerceroUsuario "
>" #
Usuarios$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
Tercero 
( 
) 
{ 	
this 
. 
	Contactos 
= 
new  
List! %
<% &
Contacto& .
>. /
(/ 0
)0 1
;1 2
this 
. 
Usuarios 
= 
new 
List  $
<$ %
TerceroUsuario% 3
>3 4
(4 5
)5 6
;6 7
} 	
public 
Tercero 
( 
TerceroBuilder %
terceroBuilder& 4
)4 5
{ 	
Nit 
= 
terceroBuilder  
.  !
Nit! $
;$ %
RazonSocial 
= 
terceroBuilder (
.( )
RazonSocial) 4
;4 5
this 
. 
Usuarios 
= 
new 
List  $
<$ %
TerceroUsuario% 3
>3 4
(4 5
)5 6
;6 7
this 
. 
	Contactos 
= 
new  
List! %
<% &
Contacto& .
>. /
(/ 0
)0 1
;1 2
} 	
public 
Tercero 
SetContacto "
(" #
Contacto# +
contacto, 4
)4 5
{ 	
this 
. 
	Contactos 
. 
Add 
( 
contacto '
)' (
;( )
return 
this 
; 
} 	
public!! 
class!! 
TerceroBuilder!! #
{"" 	
public## 
string## 
Nit## 
{## 
get##  #
;### $
private##% ,
set##- 0
;##0 1
}##2 3
public$$ 
string$$ 
RazonSocial$$ %
{$$& '
get$$( +
;$$+ ,
private$$- 4
set$$5 8
;$$8 9
}$$: ;
public%% 
TerceroBuilder%% !
(%%! "
string%%" (
nit%%) ,
,%%, -
string%%. 4
razonSocial%%5 @
)%%@ A
{&& 
this'' 
.'' 
Nit'' 
='' 
nit'' 
;'' 
this(( 
.(( 
RazonSocial((  
=((! "
razonSocial((# .
;((. /
})) 
public** 
Tercero** 
Build**  
(**  !
)**! "
{++ 
Tercero,, 
tercero,, 
=,,  !
new,," %
Tercero,,& -
(,,- .
this,,. 2
),,2 3
;,,3 4
return-- 
tercero-- 
;-- 
}.. 
}// 	
}00 
}11 È
jc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroCliente.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
TerceroCliente 
:  !
Entity" (
<( )
int) ,
>, -
{		 
public

 
Tercero

 
Tercero

 
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
public 
List 
< (
TerceroClientePrecioProducto 0
>0 1
ListaDePrecios2 @
{A B
getC F
;F G
setH K
;K L
}M N
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
TerceroCliente 
( !
TerceroClienteBuilder 3!
terceroClienteBuilder4 I
)I J
{ 	
this 
. 
Tercero 
= !
terceroClienteBuilder 0
.0 1
Tercero1 8
;8 9
this 
. 
FechaCreacion 
=  
DateTime! )
.) *
Now* -
;- .
this 
. 
ListaDePrecios 
=  !
new" %
List& *
<* +(
TerceroClientePrecioProducto+ G
>G H
(H I
)I J
;J K
} 	
public 
TerceroCliente 
( 
) 
{ 	
this 
. 
FechaCreacion 
=  
DateTime! )
.) *
Now* -
;- .
this 
. 
ListaDePrecios 
=  !
new" %
List& *
<* +(
TerceroClientePrecioProducto+ G
>G H
(H I
)I J
;J K
} 	
public 
void 
	AddPrecio 
( (
TerceroClientePrecioProducto :
precio; A
)A B
{ 	
ListaDePrecios 
. 
Add 
( 
precio %
)% &
;& '
} 	
public 
double 
GetPrecioProducto '
(' (
int( +
id, .
). /
{ 	
var 
precio 
= 
this 
. 
ListaDePrecios ,
., -
Find 
( 
( 
precio 
) 
=>  
precio! '
.' (

ProductoId( 2
==3 5
id6 8
)8 9
;9 :
return!! 
precio!! 
==!! 
null!! !
?!!" #
$num!!$ %
:!!& '
precio!!( .
.!!. /
Precio!!/ 5
;!!5 6
}"" 	
public## 
class## !
TerceroClienteBuilder## *
{$$ 	
public%% 
Tercero%% 
Tercero%% "
{%%# $
get%%% (
;%%( )
private%%* 1
set%%2 5
;%%5 6
}%%7 8
public&& !
TerceroClienteBuilder&& (
(&&( )
Tercero&&) 0
tercero&&1 8
)&&8 9
{'' 
this(( 
.(( 
Tercero(( 
=(( 
tercero(( &
;((& '
})) 
public** 
TerceroCliente** !
Build**" '
(**' (
)**( )
{++ 
TerceroCliente,, 
cliente,, &
=,,' (
new,,) ,
TerceroCliente,,- ;
(,,; <
this,,< @
),,@ A
;,,A B
return-- 
cliente-- 
;-- 
}.. 
}// 	
}00 
}11 Ä<
xc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroClientePrecioProducto.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class (
TerceroClientePrecioProducto -
:. /
Entity0 6
<6 7
int7 :
>: ;
{ 
public		 
int		 
	ClienteId		 
{		 
get		 "
;		" #
private		$ +
set		, /
;		/ 0
}		1 2
public

 
int

 

ProductoId

 
{

 
get

  #
;

# $
private

% ,
set

- 0
;

0 1
}

2 3
public 
TerceroCliente 
Cliente %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
public 
Producto 
Producto  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 
double 
Precio 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
double 
Costo 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public (
TerceroClientePrecioProducto +
(+ ,
), -
{ 	
} 	
public (
TerceroClientePrecioProducto +
(+ ,
TerceroCliente, :
cliente; B
,B C
ProductoD L
productoM U
)U V
{ 	
this 
. 
Cliente 
= 
cliente "
;" #
this 
. 
Producto 
= 
producto $
;$ %
this 
. 

ProductoId 
= 
producto &
.& '
Id' )
;) *
this 
. 
	ClienteId 
= 
cliente $
.$ %
Id% '
;' (
} 	
public (
TerceroClientePrecioProducto +
(+ ,/
#TerceroClientePrecioProductoBuilder, O/
#terceroClientePrecioProductoBuilderP s
)s t
{ 	
this 
. 
Cliente 
= /
#terceroClientePrecioProductoBuilder >
.> ?
Cliente? F
;F G
this 
. 
Producto 
= /
#terceroClientePrecioProductoBuilder ?
.? @
Producto@ H
;H I
this 
. 

ProductoId 
= /
#terceroClientePrecioProductoBuilder A
.A B

ProductoIdB L
;L M
this 
. 
	ClienteId 
= /
#terceroClientePrecioProductoBuilder @
.@ A
	ClienteIdA J
;J K
this   
.   
Precio   
=   /
#terceroClientePrecioProductoBuilder   =
.  = >
Precio  > D
;  D E
this!! 
.!! 
Costo!! 
=!! /
#terceroClientePrecioProductoBuilder!! <
.!!< =
Producto!!= E
.!!E F
CostoUnitario!!F S
;!!S T
}"" 	
public$$ 
class$$ /
#TerceroClientePrecioProductoBuilder$$ 8
{%% 	
public&& 
int&& 
	ClienteId&&  
{&&! "
get&&# &
;&&& '
private&&( /
set&&0 3
;&&3 4
}&&5 6
public'' 
int'' 

ProductoId'' !
{''" #
get''$ '
;''' (
private'') 0
set''1 4
;''4 5
}''6 7
public(( 
TerceroCliente(( !
Cliente((" )
{((* +
get((, /
;((/ 0
private((1 8
set((9 <
;((< =
}((> ?
public)) 
Producto)) 
Producto)) $
{))% &
get))' *
;))* +
private)), 3
set))4 7
;))7 8
}))9 :
public** 
double** 
Precio**  
{**! "
get**# &
;**& '
private**( /
set**0 3
;**3 4
}**5 6
public++ /
#TerceroClientePrecioProductoBuilder++ 6
(++6 7
TerceroCliente++7 E
cliente++F M
,++M N
Producto,, 
producto,, !
),,! "
{-- 
this.. 
... 
Producto.. 
=.. 
producto..  (
;..( )
this// 
.// 
Cliente// 
=// 
cliente// &
;//& '
this00 
.00 

ProductoId00 
=00  !
producto00" *
.00* +
Id00+ -
;00- .
this11 
.11 
	ClienteId11 
=11  
cliente11! (
.11( )
Id11) +
;11+ ,
}22 
public33 /
#TerceroClientePrecioProductoBuilder33 6
	SetPrecio337 @
(33@ A
double33A G
precio33H N
)33N O
{44 
this55 
.55 
Precio55 
=55 
precio55 $
;55$ %
return66 
this66 
;66 
}77 
private88 
void88 +
ValidarPrecioNoMenorAlPermitido88 8
(888 9
)889 :
{99 
if:: 
(:: 
this:: 
.:: 
Producto:: !
.::! "
Tipo::" &
!=::' )
Tipo::* .
.::. /

ParaVender::/ 9
)::9 :
{;; 
throw<< 
new<< %
InvalidOperationException<< 7
(<<7 8
$"<<8 :
El producto <<: F
"<<F G
+<<H I
$"== 
{== 
Producto== #
.==# $
Nombre==$ *
}==* +
 no se puede vender==+ >
"==> ?
)==? @
;==@ A
}>> 
if?? 
(?? 
this?? 
.?? 
Precio?? 
<??  !
Producto??" *
.??* +!
PrecioSugeridoDeVenta??+ @
)??@ A
{@@ 
throwAA 
newAA %
InvalidOperationExceptionAA 7
(AA7 8
$strAA8 H
+AAI J
$"BB 
	producto BB #
{BB# $
ProductoBB$ ,
.BB, -
NombreBB- 3
}BB3 4"
 no puede ser menor alBB4 J
"BBJ K
+BBL M
$"CC  
 precio sugerido de CC .
{CC. /
ProductoCC/ 7
.CC7 8!
PrecioSugeridoDeVentaCC8 M
}CCM N
"CCN O
)CCO P
;CCP Q
}DD 
}FF 
publicGG (
TerceroClientePrecioProductoGG /
BuildGG0 5
(GG5 6
)GG6 7
{HH +
ValidarPrecioNoMenorAlPermitidoII /
(II/ 0
)II0 1
;II1 2(
TerceroClientePrecioProductoJJ ,
precioProductoJJ- ;
=JJ< =
newJJ> A(
TerceroClientePrecioProductoKK 0
(KK0 1
thisKK1 5
)KK5 6
;KK6 7
returnLL 
precioProductoLL %
;LL% &
}MM 
}NN 	
}OO 
}PP ’
kc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroEmpleado.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
TerceroEmpleado  
:! "
Entity# )
<) *
int* -
>- .
{		 
public

 
Tercero

 
Tercero

 
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
public 
List 
< 
Fabricacion 
>  
Fabricaciones! .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
DateTime6 >
.> ?
Now? B
;B C
public 
TerceroEmpleado 
( 
Tercero &
tercero' .
). /
{ 	
this 
. 
Tercero 
= 
tercero "
;" #
this 
. 
Fabricaciones 
=  
new! $
List% )
<) *
Fabricacion* 5
>5 6
(6 7
)7 8
;8 9
} 	
public 
TerceroEmpleado 
( 
)  
{ 	
} 	
} 
} ”
nc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroPropietario.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
TerceroPropietario #
:$ %
Entity& ,
<, -
int- 0
>0 1
{		 
public

 
Tercero

 
Tercero

 
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
public 
List 
< 
Producto 
> 
	Productos '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
DateTime6 >
.> ?
Now? B
;B C
public 
TerceroPropietario !
(! "
Tercero" )
tercero* 1
)1 2
{ 	
this 
. 
Tercero 
= 
tercero "
;" #
this 
. 
	Productos 
= 
new  
List! %
<% &
Producto& .
>. /
(/ 0
)0 1
;1 2
} 	
public 
TerceroPropietario !
(! "
)" #
{ 	
} 	
} 
} ±	
lc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroProveedor.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 
class 
TerceroProveedor 
:  
Entity! '
<' (
int( +
>+ ,
{ 
public 
Tercero	 
Tercero 
{ 
get 
; 
set  #
;# $
}% &
public		 
DateTime			 
FechaCreacion		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
=		. /
DateTime		0 8
.		8 9
Now		9 <
;		< =
public

 
TerceroProveedor

	 
(

 
Tercero

 !
tercero

" )
)

) *
{ 
this 
. 
Tercero 
= 
tercero 
; 
} 
public 
TerceroProveedor	 
( 
) 
{ 
} 
} 
} ˇ%
jc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroUsuario.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
TerceroUsuario 
:  !
Entity" (
<( )
int) ,
>, -
{ 
public		 
Tercero		 
Tercero		 
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
 
Usuario

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Rol 
Rol 
{ 
get 
; 
set !
;! "
}# $
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
DateTime6 >
.> ?
Now? B
;B C
public 
TerceroUsuario 
( 
Tercero %
tercero& -
)- .
{ 	
this 
. 
Tercero 
= 
tercero "
;" #
} 	
public 
TerceroUsuario 
( 
) 
{ 	
} 	
public 
TerceroUsuario 
( !
TerceroUsuarioBuilder 3!
terceroUsuarioBuilder4 I
)I J
{ 	
this 
. 
Tercero 
= !
terceroUsuarioBuilder 0
.0 1
Tercero1 8
;8 9
this 
. 
Usuario 
= !
terceroUsuarioBuilder 0
.0 1
Usuario1 8
;8 9
this 
. 
Password 
= !
terceroUsuarioBuilder 1
.1 2
Password2 :
;: ;
this 
. 
Rol 
= !
terceroUsuarioBuilder ,
., -
Rol- 0
;0 1
} 	
public 
class !
TerceroUsuarioBuilder *
{   	
public!! 
Tercero!! 
Tercero!! "
{!!# $
get!!% (
;!!( )
private!!* 1
set!!2 5
;!!5 6
}!!7 8
public"" 
string"" 
Usuario"" !
{""" #
get""$ '
;""' (
private"") 0
set""1 4
;""4 5
}""6 7
public## 
string## 
Password## "
{### $
get##% (
;##( )
private##* 1
set##2 5
;##5 6
}##7 8
public$$ 
Rol$$ 
Rol$$ 
{$$ 
get$$  
;$$  !
private$$" )
set$$* -
;$$- .
}$$/ 0
public&& !
TerceroUsuarioBuilder&& (
(&&( )
Tercero&&) 0
tercero&&1 8
)&&8 9
{'' 
this(( 
.(( 
Tercero(( 
=(( 
tercero(( &
;((& '
})) 
public** !
TerceroUsuarioBuilder** (

SetUsuario**) 3
(**3 4
string**4 :
usuario**; B
)**B C
{++ 
this,, 
.,, 
Usuario,, 
=,, 
usuario,, &
;,,& '
return-- 
this-- 
;-- 
}.. 
public// !
TerceroUsuarioBuilder// (
SetPassword//) 4
(//4 5
string//5 ;
password//< D
)//D E
{00 
this11 
.11 
Password11 
=11 
password11  (
;11( )
return22 
this22 
;22 
}33 
public44 !
TerceroUsuarioBuilder44 (
SetRol44) /
(44/ 0
Rol440 3
rol444 7
)447 8
{55 
this66 
.66 
Rol66 
=66 
rol66 
;66 
return77 
this77 
;77 
}88 
public99 
TerceroUsuario99 !
Build99" '
(99' (
)99( )
{:: 
TerceroUsuario;; 
usuario;; &
=;;' (
new;;) ,
TerceroUsuario;;- ;
(;;; <
this;;< @
);;@ A
;;;A B
return<< 
usuario<< 
;<< 
}== 
}>> 	
}?? 
}@@ ÂI
Yc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Venta.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Venta 
: 
Entity 
<  
int  #
># $
{		 
public

 
TerceroUsuario

 
Usuario

 %
{

& '
get

( +
;

+ ,
private

- 4
set

5 8
;

8 9
}

: ;
public 
TerceroCliente 
Cliente %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
public 
List 
< 

VentaAbono 
> 
Abonos  &
{' (
get) ,
;, -
private. 5
set6 9
;9 :
}; <
public 
double 
Total 
{ 
get !
;! "
private# *
set+ .
;. /
}0 1
public 
double 
	Pendiente 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
double 
Pagado 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
double 
	Descuento 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
double 
	TotalReal 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
double 
Utilidad 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
double 
UtilidadReal "
{# $
get% (
=>) +
Utilidad, 4
-5 6
	Descuento7 @
;@ A
}B C
public 
Estado 
Estado 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
=3 4
Estado5 ;
.; <
	Pendiente< E
;E F
public 
DateTime 
Fecha 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
public 
List 
< 
VentaDetalle  
>  !
VentaDetalles" /
{0 1
get2 5
;5 6
private7 >
set? B
;B C
}D E
public 
List 
< 

Devolucion 
> 
Devoluciones  ,
{- .
get/ 2
;2 3
private4 ;
set< ?
;? @
}A B
public 
Venta 
( 
) 
{ 	
this 
. 
VentaDetalles 
=  
new! $
List% )
<) *
VentaDetalle* 6
>6 7
(7 8
)8 9
;9 :
this 
. 
Devoluciones 
= 
new  #
List$ (
<( )

Devolucion) 3
>3 4
(4 5
)5 6
;6 7
this 
. 
Abonos 
= 
new 
List "
<" #

VentaAbono# -
>- .
(. /
)/ 0
;0 1
this 
. 
Fecha 
= 
DateTime !
.! "
Now" %
;% &
} 	
public   
Venta   
(   
VentaBuilder   !
ventaBuilder  " .
)  . /
{!! 	
this"" 
."" 
VentaDetalles"" 
=""  
new""! $
List""% )
<"") *
VentaDetalle""* 6
>""6 7
(""7 8
)""8 9
;""9 :
this## 
.## 
Devoluciones## 
=## 
new##  #
List##$ (
<##( )

Devolucion##) 3
>##3 4
(##4 5
)##5 6
;##6 7
this$$ 
.$$ 
Abonos$$ 
=$$ 
new$$ 
List$$ "
<$$" #

VentaAbono$$# -
>$$- .
($$. /
)$$/ 0
;$$0 1
this%% 
.%% 
Usuario%% 
=%% 
ventaBuilder%% '
.%%' (
Usuario%%( /
;%%/ 0
this&& 
.&& 
Cliente&& 
=&& 
ventaBuilder&& '
.&&' (
Cliente&&( /
;&&/ 0
this'' 
.'' 
Fecha'' 
='' 
DateTime'' !
.''! "
Now''" %
;''% &
}(( 	
public)) 
void)) 
SetDescuento))  
())  !
double))! '
	descuento))( 1
)))1 2
{** 	
if++ 
(++ 
Utilidad++ 
*++ 
$num++ 
<++  !
	descuento++" +
)+++ ,
{,, 
throw-- 
new-- %
InvalidOperationException-- 3
(--3 4
$str--4 N
)--N O
;--O P
}.. 
this// 
.// 
	Descuento// 
=// 
	descuento// &
;//& '
this00 
.00 
	TotalReal00 
-=00 
	descuento00 '
;00' (
this11 
.11 
	Pendiente11 
-=11 
	descuento11 '
;11' (
}22 	
public33 
void33 
AgregarDetalle33 "
(33" #
VentaDetalle33# /
detalle330 7
)337 8
{44 	
this55 
.55 
VentaDetalles55 
.55 
Add55 "
(55" #
detalle55# *
)55* +
;55+ ,
this66 
.66 
Total66 
+=66 
detalle66 !
.66! "

ValorTotal66" ,
;66, -
this77 
.77 
	TotalReal77 
+=77 
detalle77 %
.77% &

ValorTotal77& 0
;770 1
this88 
.88 
Utilidad88 
+=88 
detalle88 $
.88$ %
Utilidad88% -
;88- .
this99 
.99 
	Pendiente99 
+=99 
detalle99 %
.99% &

ValorTotal99& 0
;990 1
}:: 	
public;; 
void;; 
AgregarAbono;;  
(;;  !

VentaAbono;;! +
abono;;, 1
);;1 2
{<< 	
this== 
.== 
Abonos== 
.== 
Add== 
(== 
abono== !
)==! "
;==" #
this>> 
.>> 
Pagado>> 
+=>> 
abono>>  
.>>  !
Valor>>! &
;>>& '
this?? 
.?? 
	Pendiente?? 
-=?? 
abono?? #
.??# $
Valor??$ )
;??) * 
CambiarEstadoDeVenta@@  
(@@  !
)@@! "
;@@" #
}AA 	
privateBB 
voidBB  
CambiarEstadoDeVentaBB )
(BB) *
)BB* +
{CC 	
ifDD 
(DD 
thisDD 
.DD 
PagadoDD 
==DD 
thisDD #
.DD# $
	TotalRealDD$ -
)DD- .
{EE 
thisFF 
.FF 
EstadoFF 
=FF 
EstadoFF $
.FF$ %
PagadoFF% +
;FF+ ,
}GG 
}HH 	
publicJJ 
classJJ 
VentaBuilderJJ !
{KK 	
publicLL 
TerceroUsuarioLL !
UsuarioLL" )
{LL* +
getLL, /
;LL/ 0
privateLL1 8
setLL9 <
;LL< =
}LL> ?
publicMM 
TerceroClienteMM !
ClienteMM" )
{MM* +
getMM, /
;MM/ 0
privateMM1 8
setMM9 <
;MM< =
}MM> ?
publicNN 
VentaBuilderNN 
(NN  
TerceroUsuarioNN  .
usuarioNN/ 6
,NN6 7
TerceroClienteNN8 F
clienteNNG N
)NNN O
{OO 
thisPP 
.PP 
UsuarioPP 
=PP 
usuarioPP &
;PP& '
thisQQ 
.QQ 
ClienteQQ 
=QQ 
clienteQQ &
;QQ& '
}RR 
publicSS 
VentaSS 
BuildSS 
(SS 
)SS  
{TT 
VentaUU 
ventaUU 
=UU 
newUU !
VentaUU" '
(UU' (
thisUU( ,
)UU, -
;UU- .
returnVV 
ventaVV 
;VV 
}WW 
}XX 	
}YY 
publicZZ 

enumZZ 
EstadoZZ 
{[[ 
	Pendiente\\ 
,\\ 
Pagado]] 
,]] 
Anulado^^ 
}__ 
}`` ú
^c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\VentaAbono.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 

VentaAbono 
: 
Entity $
<$ %
int% (
>( )
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
public		 
Venta		 
Venta		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
DateTime

 

FechaAbono

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
public 

VentaAbono 
( 
VentaAbonoBuilder +
ventaAbonoBuilder, =
)= >
{ 	
this 
. 
Valor 
= 
ventaAbonoBuilder *
.* +
Valor+ 0
;0 1
this 
. 
Venta 
= 
ventaAbonoBuilder *
.* +
Venta+ 0
;0 1
this 
. 

FechaAbono 
= 
DateTime &
.& '
Now' *
;* +
} 	
private 

VentaAbono 
( 
) 
{ 	
} 	
public 
class 
VentaAbonoBuilder &
{ 	
public 
double 
Valor 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
Venta 
Venta 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
VentaAbonoBuilder $
($ %
Venta% *
venta+ 0
,0 1
double2 8
valor9 >
)> ?
{ 
this 
. 
Venta 
= 
venta "
;" #
this 
. 
Valor 
= 
valor "
;" #
} 
public 

VentaAbono 
Build #
(# $
)$ %
{  
ValidarValorDelAbono   $
(  $ %
)  % &
;  & '

VentaAbono!! 
abono!!  
=!!! "
new!!# &

VentaAbono!!' 1
(!!1 2
this!!2 6
)!!6 7
;!!7 8
return"" 
abono"" 
;"" 
}## 
private%% 
void%%  
ValidarValorDelAbono%% -
(%%- .
)%%. /
{&& 
if'' 
('' 
Valor'' 
>'' 
Venta'' !
.''! "
	Pendiente''" +
)''+ ,
{(( 
throw)) 
new)) %
InvalidOperationException)) 7
())7 8
$"))8 :!
El valor a abonar es )): O
"))O P
+))Q R
$"** %
superior al pendiente de ** 3
{**3 4
Venta**4 9
.**9 :
	Pendiente**: C
}**C D
"**D E
)**E F
;**F G
}++ 
if,, 
(,, 
Valor,, 
<,, 
$num,, 
),, 
{-- 
throw.. 
new.. %
InvalidOperationException.. 7
(..7 8
$str..8 W
)..W X
;..X Y
}// 
}00 
}11 	
}22 
}33 ˜L
`c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\VentaDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
VentaDetalle 
: 

BaseEntity  *
{		 
public

 
int

 
VentaId

 
{

 
get

  
;

  !
private

" )
set

* -
;

- .
}

/ 0
public 
int 

ProductoId 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
public 
Venta 
Venta 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
Producto 
Producto  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 
double 
Cantidad 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
double 
PrecioUnitario $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public 
double 
CostoUnitario #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
public 
double 

ValorTotal  
{! "
get# &
=>' )
PrecioUnitario* 8
*9 :
Cantidad; C
;C D
}E F
public 
double 

CostoTotal  
{! "
get# &
=>' )
CostoUnitario* 7
*8 9
Cantidad: B
;B C
}D E
public 
double 
Utilidad 
{  
get! $
=>% '

ValorTotal( 2
-3 4

CostoTotal5 ?
;? @
}A B
private 
VentaDetalle 
( 
) 
{ 	
} 	
public 
VentaDetalle 
( 
VentaDetalleBuilder /
ventaDetalleBuilder0 C
)C D
{ 	

ProductoId 
= 
ventaDetalleBuilder ,
., -

ProductoId- 7
;7 8
Producto 
= 
ventaDetalleBuilder *
.* +
Producto+ 3
;3 4
Venta 
= 
ventaDetalleBuilder '
.' (
Venta( -
;- .
VentaId 
= 
ventaDetalleBuilder )
.) *
VentaId* 1
;1 2
Cantidad 
= 
ventaDetalleBuilder *
.* +
Cantidad+ 3
;3 4
PrecioUnitario   
=   
ventaDetalleBuilder   0
.  0 1
ValorUnitario  1 >
;  > ?
CostoUnitario!! 
=!! 
ventaDetalleBuilder!! /
.!!/ 0
CostoUnitario!!0 =
;!!= >
}"" 	
public$$ 
class$$ 
VentaDetalleBuilder$$ (
{%% 	
public&& 
int&& 
VentaId&& 
{&&  
get&&! $
;&&$ %
private&&& -
set&&. 1
;&&1 2
}&&3 4
public'' 
int'' 

ProductoId'' !
{''" #
get''$ '
;''' (
private'') 0
set''1 4
;''4 5
}''6 7
public(( 
Venta(( 
Venta(( 
{((  
get((! $
;(($ %
private((& -
set((. 1
;((1 2
}((3 4
public)) 
Producto)) 
Producto)) $
{))% &
get))' *
;))* +
private)), 3
set))4 7
;))7 8
}))9 :
public** 
double** 
Cantidad** "
{**# $
get**% (
;**( )
private*** 1
set**2 5
;**5 6
}**7 8
public++ 
double++ 
CostoUnitario++ '
{++( )
get++* -
;++- .
private++/ 6
set++7 :
;++: ;
}++< =
public,, 
double,, 
ValorUnitario,, '
{,,( )
get,,* -
;,,- .
private,,/ 6
set,,7 :
;,,: ;
},,< =
public-- 
VentaDetalleBuilder-- &
(--& '
Venta--' ,
venta--- 2
,--2 3
Producto--4 <
producto--= E
)--E F
{.. 
Venta// 
=// 
venta// 
;// 
Producto00 
=00 
producto00 #
;00# $
VentaId11 
=11 
venta11 
.11  
Id11  "
;11" #

ProductoId22 
=22 
producto22 %
.22% &
Id22& (
;22( )
CostoUnitario33 
=33 
producto33  (
.33( )
CostoUnitario33) 6
;336 7
}44 
public55 
VentaDetalleBuilder55 &
SetValor55' /
(55/ 0
double550 6
precio557 =
)55= >
{66 
ValorUnitario77 
=77 
precio77  &
;77& '
return88 
this88 
;88 
}99 
public:: 
VentaDetalleBuilder:: &
SetCantidad::' 2
(::2 3
double::3 9
cantidad::: B
)::B C
{;; 
Cantidad<< 
=<< 
cantidad<< #
;<<# $
return== 
this== 
;== 
}>> 
private?? 
void?? 0
$ValidarQueElProductoTengaExistencias?? =
(??= >
)??> ?
{@@ 
ifAA 
(AA 
ProductoAA 
.AA "
PuedeDescontarCantidadAA 3
(AA3 4
thisAA4 8
.AA8 9
CantidadAA9 A
)AAA B
.AAB C
AnyAAC F
(AAF G
)AAG H
)AAH I
{BB 
throwCC 
newCC %
InvalidOperationExceptionCC 7
(CC7 8
$"CC8 :
El producto CC: F
{CCF G
ProductoCCG O
.CCO P
NombreCCP V
}CCV W
 no CCW [
"CC[ \
+CC] ^
$"DD 6
*tiene existencias suficientes, solo tiene DD D
{DDD E
ProductoDDE M
.DDM N
CantidadDDN V
}DDV W
"DDX Y
+DDZ [
$"EE 
{EE 
ProductoEE #
.EE# $
UnidadDeMedidaEE$ 2
.EE2 3
ToStringEE3 ;
(EE; <
)EE< =
}EE= >
"EE> ?
)EE? @
;EE@ A
}FF 
}GG 
privateHH 
voidHH *
ValidarValorNoMenorAlPermitidoHH 7
(HH7 8
)HH8 9
{II 
doubleJJ 
precioJJ 
=JJ 
VentaJJ  %
.JJ% &
ClienteJJ& -
.JJ- .
GetPrecioProductoJJ. ?
(JJ? @

ProductoIdJJ@ J
)JJJ K
;JJK L
ifKK 
(KK 
precioKK 
==KK 
$numKK 
)KK  
{LL 
precioMM 
=MM 
ProductoMM %
.MM% &!
PrecioSugeridoDeVentaMM& ;
;MM; <
}NN 
ifOO 
(OO 
ValorUnitarioOO !
<OO" #
precioOO$ *
)OO* +
{PP 
throwQQ 
newQQ %
InvalidOperationExceptionQQ 7
(QQ7 8
$"QQ8 :
El precio del QQ: H
"QQH I
+QQJ K
$"RR 
	producto RR #
{RR# $
ProductoRR$ ,
.RR, -
NombreRR- 3
}RR3 4&
 es muy bajo, por lo menosRR4 N
"RRN O
+RRP Q
$"SS 
debe ser de SS &
{SS& '
precioSS' -
}SS- .
"SS. /
)SS/ 0
;SS0 1
}TT 
}UU 
privateVV 
voidVV -
!ValidarQueElProductoSeaParaVenderVV :
(VV: ;
)VV; <
{WW 
ifXX 
(XX 
ProductoXX 
.XX 
TipoXX !
!=XX" $
TipoXX% )
.XX) *

ParaVenderXX* 4
)XX4 5
{YY 
throwZZ 
newZZ %
InvalidOperationExceptionZZ 7
(ZZ7 8
$"ZZ8 :
El producto ZZ: F
{ZZF G
ProductoZZG O
.ZZO P
NombreZZP V
}ZZV W
"ZZX Y
+ZZZ [
$"[[ -
!no se puede vender, es solo para [[ ;
{[[; <
Producto[[< D
.[[D E
Tipo[[E I
.[[I J
ToString[[J R
([[R S
)[[S T
}[[T U
"[[U V
)[[V W
;[[W X
}\\ 
}]] 
public^^ 
VentaDetalle^^ 
Build^^  %
(^^% &
)^^& '
{__ -
!ValidarQueElProductoSeaParaVender`` 1
(``1 2
)``2 3
;``3 4*
ValidarValorNoMenorAlPermitidoaa .
(aa. /
)aa/ 0
;aa0 10
$ValidarQueElProductoTengaExistenciasbb 4
(bb4 5
)bb5 6
;bb6 7
VentaDetallecc 
detallecc $
=cc% &
newcc' *
VentaDetallecc+ 7
(cc7 8
thiscc8 <
)cc< =
;cc= >
returndd 
detalledd 
;dd 
}ee 
}ff 	
}gg 
}hh Ö
sc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\AbstractFactory\IProductoFactory.cs
	namespace 	
Domain
 
. 
Factory 
. 
AbstractFactory (
{ 
public 

	interface 
IProductoFactory %
{ 
Producto 
CrearProducto 
( 
Especificacion -
especificacion. <
)< =
;= >
}		 
}

 Í	
Äc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaFabricarFactory.cs
	namespace 	
Domain
 
. 
Factory 
. 
ConcreteFactories *
{ 
public 

class '
ProductoParaFabricarFactory ,
:- .
IProductoFactory/ ?
{ 
public		 
Producto		 
CrearProducto		 %
(		% &
Especificacion		& 4
especificacion		5 C
)		C D
{

 	
return 
especificacion !
switch" (
{ 
Especificacion 
. 
Duro #
=>$ &
new' *$
ProductoParaFabricarDuro+ C
(C D
)D E
,E F
Especificacion 
. 
Suave $
=>% '
new( +%
ProductoParaFabricarSuave, E
(E F
)F G
,G H
_ 
=> 
throw 
new %
InvalidOperationException )
() *
$str* G
)G H
,H I
} 
; 
} 	
} 
} â

~c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaVenderFactory.cs
	namespace 	
Domain
 
. 
Factory 
. 
ConcreteFactories *
{ 
public 

class %
ProductoParaVenderFactory *
:+ ,
IProductoFactory- =
{ 
public		 
Producto		 
CrearProducto		 %
(		% &
Especificacion		& 4
especificacion		5 C
)		C D
{

 	
return 
especificacion !
switch" (
{ 
Especificacion 
. 
TieneEnvoltorio .
=>/ 1
new2 5+
ProductoParaVenderConEnvoltorio6 U
(U V
)V W
,W X
Especificacion 
. 
NoTieneEnvoltorio 0
=>1 3
new4 7+
ProductoParaVenderSinEnvoltorio8 W
(W X
)X Y
,Y Z
_ 
=> 
throw 
new %
InvalidOperationException -
(- .
$str. I
)I J
,J K
} 
; 
} 	
} 
} Í
Öc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoSinEspecificacionFactory.cs
	namespace 	
Domain
 
. 
Factory 
. 
ConcreteFactories *
{ 
public 

class ,
 ProductoSinEspecificacionFactory 1
:2 3
IProductoFactory4 D
{		 
public

 
Producto

 
CrearProducto

 %
(

% &
Especificacion

& 4
especificacion

5 C
)

C D
{ 	
return 
new  
ProductoMateriaPrima +
(+ ,
), -
;- .
} 	
} 
} †
ic:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ICompraRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface 
ICompraRepository &
:' (
IGenericRepository) ;
<; <
Compra< B
>B C
{ 
} 
}		 ¶
kc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\IProductoRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface 
IProductoRepository (
:) *
IGenericRepository+ =
<= >
Producto> F
>F G
{ 
}		 
}

 ∏
qc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroClienteRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface %
ITerceroClienteRepository .
:/ 0
IGenericRepository1 C
<C D
TerceroClienteD R
>R S
{ 
}		 
}

 ª
rc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroEmpleadoRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface &
ITerceroEmpleadoRepository /
:0 1
IGenericRepository2 D
<D E
TerceroEmpleadoE T
>T U
{ 
} 
}		 º
rc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroProvedorRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface &
ITerceroProvedorRepository /
:0 1
IGenericRepository2 D
<D E
TerceroProveedorE U
>U V
{ 
} 
}		 £
jc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface 
ITerceroRepository '
:( )
IGenericRepository* <
<< =
Tercero= D
>D E
{ 
} 
}		 ∏
qc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroUsuarioRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface %
ITerceroUsuarioRepository .
:/ 0
IGenericRepository1 C
<C D
TerceroUsuarioD R
>R S
{ 
} 
}		 ÿ
fc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Services\ProductoPuedeCrear.cs
	namespace 	
Domain
 
. 
Services 
{ 
public 

static 
class 
ProductoPuedeCrear *
{ 
public 
static 
IReadOnlyList #
<# $
string$ *
>* +
PuedeCrearProducto, >
(> ?
double? E
cantidadF N
,N O
double 
costoUnitario  
,  !
double" ( 
porcentajeDeUtilidad) =
== >
$num> ?
)? @
{		 	
var

 
errores

 
=

 
new

 
List

 "
<

" #
string

# )
>

) *
(

* +
)

+ ,
;

, -
if 
( 
cantidad 
< 
$num 
) 
errores 
. 
Add 
( 
$str /
)/ 0
;0 1
if 
( 
costoUnitario 
< 
$num  !
)! "
errores 
. 
Add 
( 
$str 5
)5 6
;6 7
if 
(  
porcentajeDeUtilidad $
<% &
$num' (
)( )
errores 
. 
Add 
( 
$str =
)= >
;> ?
if 
(  
porcentajeDeUtilidad $
>% &
$num& )
)) *
errores 
. 
Add 
( 
$str =
)= >
;> ?
return 
errores 
; 
} 	
} 
} ø
lc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Services\PuedeDescontarCantidades.cs
	namespace 	
Domain
 
. 
Services 
{ 
public 

static 
class $
PuedeDescontarCantidades 0
{ 
public 
static 
IReadOnlyList #
<# $
string$ *
>* +
CanDiscountAmounts, >
(> ?
Producto? G
productoH P
,P Q
doubleR X
cantidadADescontarY k
)k l
{		 	
return

 
producto

 
.

 "
PuedeDescontarCantidad

 2
(

2 3
cantidadADescontar

3 E
)

E F
;

F G
} 	
} 
} 