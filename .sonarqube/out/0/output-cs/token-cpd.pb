Ì
ZC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Base\BaseEntity.cs
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
WC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Base\IEntity.cs
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
} ‰
eC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IBuilderProducto.cs
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
<% &
T& '
>' (
where) .
T/ 0
:1 2
Producto3 ;
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
gC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IGenericRepository.cs
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
jC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IProductoParaFabricar.cs
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
hC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IProductoParaVender.cs
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
}		 √	
`C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IUnitOfWork.cs
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
}D E
ICompraRepository 
CompraRepository *
{+ ,
get- 0
;0 1
}2 3
int 
Commit 
( 
) 
; 
} 
} ‡#
ZC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Compra.cs
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
aC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\CompraDetalle.cs
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
}JJ ıX
mC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\Producto.cs
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
IProductoParaFabricar		D Y
,		Y Z
IBuilderProducto		[ k
<		k l
Producto		l t
>		t u
{

 
public 
string	 
Nombre 
{ 
get 
; 
set !
;! "
}# $
public 
double	 
Cantidad 
{ 
get 
; 
	protected  )
set* -
;- .
}/ 0
private 	
double
 
_costo 
; 
public 
virtual	 
double 
CostoUnitario %
{& '
get( +
=>, .
_costo/ 5
;5 6
set7 :
=>; =
_costo> D
=E F
MathG K
.K L
RoundL Q
(Q R
valueR W
,W X
$numY Z
)Z [
;[ \
}] ^
public 
UnidadDeMedida	 
UnidadDeMedida &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
double	  
PorcentajeDeUtilidad $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
$num5 6
;6 7
public 
double	 
PrecioDeVenta 
{ 
get  #
=>$ &
CostoUnitario' 4
/5 6
(7 8
$num8 9
-: ; 
PorcentajeDeUtilidad< P
/Q R
$numS V
)V W
;W X
}Y Z
public 
Especificacion	 
Especificacion &
{' (
get) ,
;, -
	protected. 7
set8 ;
;; <
}= >
public 
Tipo	 
Tipo 
{ 
get 
; 
	protected #
set$ '
;' (
}) *
public 
Producto	 

Envoltorio 
{ 
get "
;" #
set$ '
;' (
}) *
public  
ProductoSubCategoria	 
SubCategoria *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
List	 
< 
Fabricacion 
> 
Fabricaciones (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
List	 
< 
CompraDetalle 
> 
DetallesCompra +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
DateTime0 8
.8 9
Now9 <
;< =
	protected 
Producto 
( 
) 
{ 
} 
public 
virtual	 
void 
AgregarFabricacion (
(( )
Fabricacion) 4
fabricacion5 @
)@ A
{ 
}!! 
public"" 
virtual""	 
void"" 
AgregarDetalle"" $
(""$ %%
ProductoParaVenderDetalle""% >%
productoParaVenderDetalle""? X
)""X Y
{## 
}%% 
public&& 
void&&	 
SetEnvoltorio&& 
(&& 
Producto&& $

envoltorio&&% /
)&&/ 0
{'' 
this(( 
.(( 

Envoltorio(( 
=(( 

envoltorio(( 
;((  
})) 
public** 
void**	  
AgregarDetalleCompra** "
(**" #
CompraDetalle**# 0
detalle**1 8
)**8 9
{++ 
this,, 
.,, 
DetallesCompra,, 
.,, 
Add,, 
(,, 
detalle,, "
),," #
;,,# $
}-- 
public.. 
List..	 
<.. 
string.. 
>.. "
PuedeDescontarCantidad.. ,
(.., -
double..- 3
cantidad..4 <
)..< =
{// 
var00 
errores00 
=00 
new00 
List00 
<00 
string00  
>00  !
(00! "
)00" #
;00# $
if11 
(11 
(11 
this11 
.11 
Cantidad11 
-11 
cantidad11  
)11  !
<11" #
$num11$ %
)11% &
{22 
errores33 
.33 
Add33 
(33 
$"33 
El producto 33 
{33 
this33 #
.33# $
Nombre33$ *
}33* +<
0 No puede descontar cantidades, unidades escasas33+ [
"33[ \
)33\ ]
;33] ^
}44 
return55 	
errores55
 
;55 
}66 
public77 
bool77	 
DescontarCantidad77 
(77  
double77  &
cantidad77' /
)77/ 0
{88 
if99 
(99 "
PuedeDescontarCantidad99 
(99 
cantidad99 &
)99& '
.99' (
Any99( +
(99+ ,
)99, -
)99- .
throw:: 	
new::
 %
InvalidOperationException:: '
(::' (
$str::( E
)::E F
;::F G
this;; 
.;; 
Cantidad;; 
-=;; 
cantidad;; 
;;; 
return<< 	
true<<
 
;<< 
}== 
public>> 
void>>	 
AddCompraDetalle>> 
(>> 
CompraDetalle>> ,
detalle>>- 4
)>>4 5
{?? 
this@@ 
.@@ 
DetallesCompra@@ 
.@@ 
Add@@ 
(@@ 
detalle@@ "
)@@" #
;@@# $
thisAA 
.AA 
AdicionarCantidadAA 
(AA 
detalleAA !
.AA! "
CantidadAA" *
)AA* +
;AA+ ,
}BB 
publicCC 
ProductoCC	 
SetCostoUnitarioCC "
(CC" #
doubleCC# )
costoCC* /
)CC/ 0
{DD 
thisEE 
.EE 
CostoUnitarioEE 
=EE 
costoEE 
;EE 
returnFF 	
thisFF
 
;FF 
}GG 
publicHH 
ProductoHH	 
SetCantidadHH 
(HH 
doubleHH $
cantidadHH% -
)HH- .
{II 
thisJJ 
.JJ 
CantidadJJ 
=JJ 
cantidadJJ 
;JJ 
returnKK 	
thisKK
 
;KK 
}LL 
publicMM 
ProductoMM	 
	SetNombreMM 
(MM 
stringMM "
nombreMM# )
)MM) *
{NN 
thisOO 
.OO 
NombreOO 
=OO 
nombreOO 
;OO 
returnPP 	
thisPP
 
;PP 
}QQ 
publicRR 
ProductoRR	 
SetUnidadDeMedidaRR #
(RR# $
UnidadDeMedidaRR$ 2
unidadDeMedidaRR3 A
)RRA B
{SS 
thisTT 
.TT 
UnidadDeMedidaTT 
=TT 
unidadDeMedidaTT '
;TT' (
returnUU 	
thisUU
 
;UU 
}VV 
publicWW 
ProductoWW	 #
SetPorcentajeDeUtilidadWW )
(WW) *
doubleWW* 0 
porcentajeDeUtilidadWW1 E
)WWE F
{XX 
thisYY 
.YY  
PorcentajeDeUtilidadYY 
=YY  
porcentajeDeUtilidadYY 3
;YY3 4
returnZZ 	
thisZZ
 
;ZZ 
}[[ 
public\\ 
Producto\\	 
SetTipo\\ 
(\\ 
Tipo\\ 
tipo\\ #
)\\# $
{]] 
this^^ 
.^^ 
Tipo^^ 
=^^ 
tipo^^ 
;^^ 
return__ 	
this__
 
;__ 
}`` 
publicaa 
voidaa	 
AdicionarCantidadaa 
(aa  
doubleaa  &
cantidadaa' /
)aa/ 0
{bb 
thiscc 
.cc 
AplicarCantidadcc 
(cc 
cantidadcc  
)cc  !
;cc! "
thisdd 
.dd 
ActualizarCostodd 
(dd 
)dd 
;dd 
}ee 
	protectedff 
abstractff 
voidff 
AplicarCantidadff )
(ff) *
doubleff* 0
cantidadff1 9
)ff9 :
;ff: ;
	protectedgg 
abstractgg 
voidgg 
ActualizarCostogg )
(gg) *
)gg* +
;gg+ ,
publichh 
overridehh	 
stringhh 
ToStringhh !
(hh! "
)hh" #
{ii 
returnjj 	
stringjj
 
.jj 
Formatjj 
(jj 
$strjj '
+jj( )
$strkk 
+kk 
$strll 
,ll 
thisll 
.ll  
Nombrell  &
,ll& '
thisll( ,
.ll, -
CostoUnitarioll- :
,ll: ;
thismm 
.mm 	
Cantidadmm	 
,mm 
thismm 
.mm 
UnidadDeMedidamm &
)mm& '
;mm' (
}nn 
publicpp 
Productopp	 
SetEspecificacionpp #
(pp# $
Especificacionpp$ 2
especificacionpp3 A
)ppA B
{qq 
thisrr 
.rr 
Especificacionrr 
=rr 
especificacionrr '
;rr' (
returnss 	
thisss
 
;ss 
}tt 
}uu 
publicvv 
enumvv 
Especificacionvv 
{ww 
MateriaPrimaxx 
,xx 
Duroyy 
,yy 
Suavezz 
,zz 
TieneEnvoltorio{{ 
,{{ 
NoTieneEnvoltorio|| 
}}} 
public~~ 
enum~~ 
Tipo~~ 
{ 
MateriaPrima
ÄÄ 
,
ÄÄ 
ParaFabricar
ÅÅ 
,
ÅÅ 

ParaVender
ÇÇ 
}
ÉÉ 
public
ÑÑ 
enum
ÑÑ 
UnidadDeMedida
ÑÑ 
{
ÖÖ 
Unidades
ÜÜ 

,
ÜÜ
 
Kilos
áá 
,
áá 
Libras
àà 
,
àà 	
Litros
ââ 
,
ââ 	
Onzas
ää 
}
ãã 
}åå »
tC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoBuilder.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class 
ProductoBuilder  
<  !
T! "
>" #
where$ )
T* +
:, -
ProductoBuilder. =
<= >
T> ?
>? @
{ 
private		 	
T		
 
	_producto		 
;		 
public

 
string

	 
Nombre

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
double	 
Cantidad 
{ 
get 
; 
	protected  )
set* -
;- .
}/ 0
private 	
double
 
_costo 
; 
public 
virtual	 
double 
CostoUnitario %
{& '
get( +
=>, .
_costo/ 5
;5 6
set7 :
=>; =
_costo> D
=E F
MathG K
.K L
RoundL Q
(Q R
valueR W
,W X
$numY Z
)Z [
;[ \
}] ^
public 
UnidadDeMedida	 
UnidadDeMedida &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
double	  
PorcentajeDeUtilidad $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
$num5 6
;6 7
public 
double	 
PrecioDeVenta 
{ 
get  #
=>$ &
CostoUnitario' 4
/5 6
(7 8
$num8 9
-: ; 
PorcentajeDeUtilidad< P
/Q R
$numS V
)V W
;W X
}Y Z
public 
Especificacion	 
Especificacion &
{' (
get) ,
;, -
	protected. 7
set8 ;
;; <
}= >
=? @
EspecificacionA O
.O P
MateriaPrimaP \
;\ ]
public 
Tipo	 
Tipo 
{ 
get 
; 
	protected #
set$ '
;' (
}) *
=+ ,
Tipo- 1
.1 2
MateriaPrima2 >
;> ?
public  
ProductoSubCategoria	 
SubCategoria *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
List	 
< 
Fabricacion 
> 
Fabricaciones (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
List	 
< 
CompraDetalle 
> 
DetallesCompra +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
DateTime0 8
.8 9
Now9 <
;< =
};; 
}<< ã
vC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoCategoria.cs
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
class 
ProductoCategoria "
:# $
Entity% +
<+ ,
int, /
>/ 0
{		 
public

 
string

 
Nombre
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
public 
List 
<  
ProductoSubCategoria (
>( )
SubCategorias* 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
List 
< 
Producto 
> 
	Productos '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} Á)
yC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoMateriaPrima.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

class  
ProductoMateriaPrima %
:& '
Producto( 0
,0 1
IBuilderProducto1 A
<A B 
ProductoMateriaPrimaB V
>V W
{ 
public		 
List		 
<		 
FabricacionDetalle		 &
>		& '
FabricacionDetalles		( ;
{		< =
get		> A
;		A B
set		C F
;		F G
}		H I
public

  
ProductoMateriaPrima

 #
(

# $
)

$ %
{ 	
FabricacionDetalles 
=  !
new" %
List& *
<* +
FabricacionDetalle+ =
>= >
(> ?
)? @
;@ A
this 
. 
DetallesCompra 
=  !
new" %
List& *
<* +
CompraDetalle+ 8
>8 9
(9 :
): ;
;; <
this 
. 
SetTipo 
( 
Tipo 
. 
MateriaPrima *
)* +
;+ ,
this 
. 
SetEspecificacion "
(" #
Especificacion# 1
.1 2
MateriaPrima2 >
)> ?
;? @
} 	
	protected 
override 
void 
ActualizarCosto )
() *
)* +
{ 	
var 
ultimaCompra 
= 
this #
.# $
DetallesCompra$ 2
.2 3
Last3 7
(7 8
)8 9
;9 :
this 
. 
CostoUnitario 
=  
(! "
this" &
.& '
CostoUnitario' 4
*4 5
this5 9
.9 :
Cantidad: B
+C D
ultimaCompra 
. 
Valor "
*" #
ultimaCompra# /
./ 0
Cantidad0 8
)8 9
/: ;
(< =
this= A
.A B
CantidadB J
+J K
ultimaCompraK W
.W X
CantidadX `
)` a
;a b
this 
. 
Cantidad 
+= 
ultimaCompra )
.) *
Cantidad* 2
;2 3
} 	
	protected 
override 
void 
AplicarCantidad  /
(/ 0
double0 6
cantidad7 ?
)? @
{ 	
} 	
public    
ProductoMateriaPrima   #
SetCostoUnitario  $ 4
(  4 5
double  5 ;
costo  < A
)  A B
{!! 	
this"" 
."" 
CostoUnitario"" 
=""  
costo""! &
;""& '
return## 
this## 
;## 
}$$ 	
public&&  
ProductoMateriaPrima&& #
SetCantidad&&$ /
(&&/ 0
double&&0 6
cantidad&&7 ?
)&&? @
{'' 	
this(( 
.(( 
Cantidad(( 
=(( 
cantidad(( $
;(($ %
return)) 
this)) 
;)) 
}** 	
public,,  
ProductoMateriaPrima,, #
	SetNombre,,$ -
(,,- .
string,,. 4
nombre,,5 ;
),,; <
{-- 	
this.. 
... 
Nombre.. 
=.. 
nombre..  
;..  !
return// 
this// 
;// 
}00 	
public22  
ProductoMateriaPrima22 #
SetUnidadDeMedida33 
(33 
UnidadDeMedida33 ,
unidadDeMedida33- ;
)33; <
{44 	
this55 
.55 
UnidadDeMedida55 
=55  !
unidadDeMedida55" 0
;550 1
return66 
this66 
;66 
}77 	
public99  
ProductoMateriaPrima99 ##
SetPorcentajeDeUtilidad:: #
(::# $
double::$ * 
porcentajeDeUtilidad::+ ?
)::? @
{;; 	
this<< 
.<<  
PorcentajeDeUtilidad<< %
=<<& ' 
porcentajeDeUtilidad<<( <
;<<< =
return== 
this== 
;== 
}>> 	
public@@  
ProductoMateriaPrima@@ #
SetEspecificacionAA 
(AA 
EspecificacionAA ,
especificacionAA- ;
)AA; <
{BB 	
thisCC 
.CC 
EspecificacionCC 
=CC  !
especificacionCC" 0
;CC0 1
returnDD 
thisDD 
;DD 
}EE 	
publicGG  
ProductoMateriaPrimaGG #
SetTipoGG$ +
(GG+ ,
TipoGG, 0
tipoGG1 5
)GG5 6
{HH 	
thisII 
.II 
TipoII 
=II 
tipoII 
;II 
returnJJ 
thisJJ 
;JJ 
}KK 	
}LL 
}MM £
yC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaFabricar.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{ 
public 

abstract 
class  
ProductoParaFabricar .
:/ 0
Producto1 9
{ 
public		 
List		 
<		 %
ProductoParaVenderDetalle		 -
>		- .&
ProductoParaVenderDetalles		/ I
{		J K
get		L O
;		O P
set		Q T
;		T U
}		V W
}

 
} ù-
}C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaFabricarDuro.cs
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
,@ A
IBuilderProductoB R
<R S$
ProductoParaFabricarDuroS k
>k l
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
}PP Ü0
~C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaFabricarSuave.cs
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
,A B
IBuilderProductoC S
<S T%
ProductoParaFabricarSuaveT m
>m n
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
}UU Â
wC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVender.cs
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
=' (
new) ,
List- 1
<1 2%
ProductoParaVenderDetalle2 K
>K L
(L M
)M N
;N O
}		 
}

 ¡D
ÑC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderConEnvoltorio.cs
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
,E F
IBuilderProductoG W
<W X+
ProductoParaVenderConEnvoltorioX w
>w x
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
~C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderDetalle.cs
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
},, «>
ÑC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderSinEnvoltorio.cs
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
,E F
IBuilderProductoF V
<V W+
ProductoParaVenderSinEnvoltorioW v
>v w
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
. 
SetEspecificacion "
(" #
Especificacion# 1
.1 2
TieneEnvoltorio2 A
)A B
;B C
this 
. 
SetTipo 
( 
Tipo 
. 

ParaVender (
)( )
;) *
} 	
	protected 
override 
void 
ActualizarCosto  /
(/ 0
)0 1
{ 	
this 
. 
CostoUnitario 
=  
(! "
this" &
.& '
Cantidad' /
*0 1
this2 6
.6 7
CostoUnitario7 D
+E F&
ProductoParaVenderDetallesG a
.a b
Sum 
( 
producto 
=> 
producto  (
.( )
Costo) .
). /
*/ 0
_cantidadProducida0 B
)B C
/C D
(D E
thisE I
.I J
CantidadJ R
+R S
thisS W
.W X
_cantidadProducidaX j
)j k
;l m
this 
. 
Cantidad 
+= 
this !
.! "
_cantidadProducida" 4
;4 5
} 	
public 
override 
void 
AgregarDetalle +
(+ ,%
ProductoParaVenderDetalle, E%
productoParaVenderDetalleF _
)_ `
{ 	
this 
. &
ProductoParaVenderDetalles +
.+ ,
Add, /
(/ 0%
productoParaVenderDetalle0 I
)I J
;J K
} 	
	protected 
override 
void 
AplicarCantidad  /
(/ 0
double0 6
cantidad7 ?
)? @
{ 	
int 
verificador 
= 
$num 
;  
while 
( 
cantidad 
> 
$num 
)  
{ 
verificador 
= =
1ValidarQueTodosLosProductoPuedanDescontarCantidad O
(O P
verificadorP [
)[ \
;\ ]
cantidad   
=   
DescontarUnidades   ,
(  , -
cantidad  - 5
,  5 6
verificador  7 B
)  B C
;  C D
verificador!! 
=!! 
$num!! 
;!!  
}"" 
}## 	
private%% 
double%% 
DescontarUnidades%% (
(%%( )
double%%) /
cantidad%%0 8
,%%8 9
int%%: =
verificador%%> I
)%%I J
{&& 	
if'' 
('' 
verificador'' 
=='' 
this'' #
.''# $&
ProductoParaVenderDetalles''$ >
.''> ?
Count''? D
)''D E
{(( 
this)) 
.)) &
ProductoParaVenderDetalles)) /
.))/ 0
ForEach))0 7
())7 8
t))8 9
=>)): <
t))= >
.))> ?
DescontarUnidades))? P
())P Q
)))Q R
)))R S
;))S T
cantidad** 
--** 
;** 
_cantidadProducida++ "
++++" $
;++$ %
},, 
else-- 
{.. 
cantidad// 
=// 
-// 
$num// 
;// 
}00 
return22 
cantidad22 
;22 
}33 	
private55 
int55 =
1ValidarQueTodosLosProductoPuedanDescontarCantidad55 E
(55E F
int55F I
verificador55J U
)55U V
{66 	
foreach77 
(77 
var77 
item77 
in77  
this77! %
.77% &&
ProductoParaVenderDetalles77& @
)77@ A
{88 
if99 
(99 
item99 
.99 "
PuedeDescontarUnidades99 /
(99/ 0
)990 1
.991 2
Any992 5
(995 6
)996 7
)997 8
{:: 
break;; 
;;; 
}<< 
else== 
{>> 
verificador?? 
++?? !
;??! "
}@@ 
}AA 
returnCC 
verificadorCC 
;CC 
}DD 	
publicEE
 +
ProductoParaVenderSinEnvoltorioEE 0
SetCostoUnitarioEE1 A
(EEA B
doubleEEB H
costoEEI N
)EEN O
{FF 	
thisGG 
.GG 
CostoUnitarioGG 
=GG  
costoGG! &
;GG& '
returnHH 
thisHH 
;HH 
}II 	
publicKK +
ProductoParaVenderSinEnvoltorioKK .
SetCantidadKK/ :
(KK: ;
doubleKK; A
cantidadKKB J
)KKJ K
{LL 	
thisMM 
.MM 
CantidadMM 
=MM 
cantidadMM $
;MM$ %
returnNN 
thisNN 
;NN 
}OO 	
publicQQ +
ProductoParaVenderSinEnvoltorioQQ .
	SetNombreQQ/ 8
(QQ8 9
stringQQ9 ?
nombreQQ@ F
)QQF G
{RR 	
thisSS 
.SS 
NombreSS 
=SS 
nombreSS  
;SS  !
returnTT 
thisTT 
;TT 
}UU 	
publicWW +
ProductoParaVenderSinEnvoltorioWW .
SetUnidadDeMedidaWW/ @
(WW@ A
UnidadDeMedidaWWA O
unidadDeMedidaWWP ^
)WW^ _
{XX 	
thisYY 
.YY 
UnidadDeMedidaYY 
=YY  !
unidadDeMedidaYY" 0
;YY0 1
returnZZ 
thisZZ 
;ZZ 
}[[ 	
public]] +
ProductoParaVenderSinEnvoltorio]] .#
SetPorcentajeDeUtilidad]]/ F
(]]F G
double]]G M 
porcentajeDeUtilidad]]N b
)]]b c
{^^ 	
this__ 
.__  
PorcentajeDeUtilidad__ %
=__& ' 
porcentajeDeUtilidad__( <
;__< =
return`` 
this`` 
;`` 
}aa 	
publiccc +
ProductoParaVenderSinEnvoltoriocc .
SetEspecificacioncc/ @
(cc@ A
EspecificacionccA O
especificacionccP ^
)cc^ _
{dd 	
thisee 
.ee 
Especificacionee 
=ee  !
especificacionee" 0
;ee0 1
returnff 
thisff 
;ff 
}gg 	
publicii +
ProductoParaVenderSinEnvoltorioii .
SetTipoii/ 6
(ii6 7
Tipoii7 ;
tipoii< @
)ii@ A
{jj 	
thiskk 
.kk 
Tipokk 
=kk 
tipokk 
;kk 
returnll 
thisll 
;ll 
}mm 	
}nn 
}oo ¬
yC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoSubCategoria.cs
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
class  
ProductoSubCategoria %
:& '
Entity( .
<. /
int/ 2
>2 3
{		 
public

 
string

 
Nombre
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
public 
List 
<  
ProductoSubCategoria (
>( )
SubCategorias* 7
{8 9
get: =
;= >
set? B
;B C
}D E
} 
} ù
_C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Fabricacion.cs
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
fC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\FabricacionDetalle.cs
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
WC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Rol.cs
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
dC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Contacto.cs
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
}00 É
iC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\PrecioCliente.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{		 
public

 

class

 
PrecioCliente

 
:

  
Entity

! '
<

' (
int

( +
>

+ ,
{ 
public 
int 
	ClienteId 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 

ProductoId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
TerceroCliente 
Cliente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
Producto 
Producto  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
double 
Precio 
{ 
get "
;" #
set$ '
;' (
}) *
public 
PrecioCliente 
( 
) 
{ 	
} 	
public 
PrecioCliente 
( 
TerceroCliente +
cliente, 3
,3 4
Producto5 =
producto> F
,F G
doubleH N
precioO U
)U V
{ 	
this 
. 
Cliente 
= 
cliente "
;" #
this 
. 
Producto 
= 
producto $
;$ %
this 
. 
	ClienteId 
= 
cliente $
.$ %
Id% '
;' (
this 
. 

ProductoId 
= 
producto &
.& '
Id' )
;) *
this 
. 
Precio 
= 
precio  
;  !
} 	
} 
} ı%
cC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Tercero.cs
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
( 
string 
nit !
,! "
string# )
razonSocial* 5
)5 6
{ 	
this 
. 
Nit 
= 
nit 
; 
this 
. 
RazonSocial 
= 
razonSocial *
;* +
	Contactos 
= 
new 
List  
<  !
Contacto! )
>) *
(* +
)+ ,
;, -
} 	
public 
Tercero 
SetContacto "
(" #
Contacto# +
contacto, 4
)4 5
{ 	
this 
. 
	Contactos 
. 
Add 
( 
contacto '
)' (
;( )
return 
this 
; 
} 	
public 
Tercero 
( 
) 
{ 	
this 
. 
	Contactos 
= 
new  
List! %
<% &
Contacto& .
>. /
(/ 0
)0 1
;1 2
this 
. 
Usuarios 
= 
new 
List  $
<$ %
TerceroUsuario% 3
>3 4
(4 5
)5 6
;6 7
} 	
public   
Tercero   
(   
TerceroBuilder   %
terceroBuilder  & 4
)  4 5
{!! 	
Nit"" 
="" 
terceroBuilder""  
.""  !
Nit""! $
;""$ %
RazonSocial## 
=## 
terceroBuilder## (
.##( )
RazonSocial##) 4
;##4 5
this$$ 
.$$ 
Usuarios$$ 
=$$ 
new$$ 
List$$  $
<$$$ %
TerceroUsuario$$% 3
>$$3 4
($$4 5
)$$5 6
;$$6 7
this%% 
.%% 
	Contactos%% 
=%% 
new%%  
List%%! %
<%%% &
Contacto%%& .
>%%. /
(%%/ 0
)%%0 1
;%%1 2
}&& 	
public(( 
class(( 
TerceroBuilder(( #
{)) 	
public** 
string** 
Nit** 
{** 
get**  #
;**# $
private**% ,
set**- 0
;**0 1
}**2 3
public++ 
string++ 
RazonSocial++ %
{++& '
get++( +
;+++ ,
private++- 4
set++5 8
;++8 9
}++: ;
public,, 
TerceroBuilder,, !
(,,! "
string,," (
nit,,) ,
,,,, -
string,,. 4
razonSocial,,5 @
),,@ A
{-- 
this.. 
... 
Nit.. 
=.. 
nit.. 
;.. 
this// 
.// 
RazonSocial//  
=//! "
razonSocial//# .
;//. /
}00 
public11 
Tercero11 
Build11  
(11  !
)11! "
{22 
Tercero33 
tercero33 
=33  !
new33" %
Tercero33& -
(33- .
this33. 2
)332 3
;333 4
return44 
tercero44 
;44 
}55 
}66 	
}77 
}88 î
jC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroCliente.cs
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
TerceroCliente 
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
 
List

 
<

 
PrecioCliente

 !
>

! "
ListaDePrecios

# 1
{

2 3
get

4 7
;

7 8
set

9 <
;

< =
}

> ?
public 
TerceroCliente 
( !
TerceroClienteBuilder 3!
terceroClienteBuilder4 I
)I J
{ 	
this 
. 
Tercero 
= !
terceroClienteBuilder 0
.0 1
Tercero1 8
;8 9
} 	
public 
void 
	AddPrecio 
( 
PrecioCliente +
precio, 2
)2 3
{ 	
ListaDePrecios 
. 
Add 
( 
precio %
)% &
;& '
} 	
public 
class !
TerceroClienteBuilder *
{ 	
public 
Tercero 
Tercero "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public !
TerceroClienteBuilder (
(( )
Tercero) 0
tercero1 8
)8 9
{ 
this 
. 
Tercero 
= 
tercero &
;& '
} 
public 
TerceroCliente !
Build" '
(' (
)( )
{ 
TerceroCliente 
cliente &
=' (
new) ,
TerceroCliente- ;
(; <
this< @
)@ A
;A B
return 
cliente 
; 
} 
} 	
}   
}!! ’
kC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroEmpleado.cs
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
nC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroPropietario.cs
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
lC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroProveedor.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 
class 
TerceroProveedor 
:  
Entity! '
<' (
int( +
>+ ,
{ 
public		 
Tercero			 
Tercero		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
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
, -
=

. /
DateTime

0 8
.

8 9
Now

9 <
;

< =
public 
TerceroProveedor	 
( 
Tercero !
tercero" )
)) *
{ 
this 
. 
Tercero 
= 
tercero 
; 
} 
public 
TerceroProveedor	 
( 
) 
{ 
} 
} 
} ˇ%
jC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroUsuario.cs
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
}@@ ≥
YC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Venta.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Venta 
: 
Entity 
<  
int  #
># $
{ 
public 
TerceroUsuario 
Usuario %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
TerceroCliente		 
Cliente		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
} 
} Ö
sC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\AbstractFactory\IProductoFactory.cs
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
 È	
ÄC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaFabricarFactory.cs
	namespace 	
Domain
 
. 

Creational 
. 
FactoryMethod )
{ 
public		 

class		 '
ProductoParaFabricarFactory		 ,
:		- .
IProductoFactory		/ ?
{

 
public 
Producto 
CrearProducto %
(% &
Especificacion& 4
especificacion5 C
)C D
{ 	
return 
especificacion !
switch" (
{ 
Especificacion 
. 
Duro #
=>$ &
new' *$
ProductoParaFabricarDuro+ C
(C D
)D E
,E F
Especificacion 
. 
Suave $
=>% '
new( +%
ProductoParaFabricarSuave, E
(E F
)F G
,G H
_ 
=> 
throw 
new %
InvalidOperationException )
() *
$str* G
)G H
,H I
} 
; 
} 	
} 
} à

~C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaVenderFactory.cs
	namespace 	
Domain
 
. 

Creational 
. 
FactoryMethod )
{ 
public		 

class		 %
ProductoParaVenderFactory		 *
:		+ ,
IProductoFactory		- =
{

 
public 
Producto 
CrearProducto %
(% &
Especificacion& 4
especificacion5 C
)C D
{ 	
return 
especificacion !
switch" (
{ 
Especificacion 
. 
TieneEnvoltorio .
=>/ 1
new2 5+
ProductoParaVenderConEnvoltorio6 U
(U V
)V W
,W X
Especificacion 
. 
NoTieneEnvoltorio 0
=>1 3
new4 7+
ProductoParaVenderSinEnvoltorio8 W
(W X
)X Y
,Y Z
_ 
=> 
throw 
new %
InvalidOperationException -
(- .
$str. I
)I J
,J K
} 
; 
} 	
} 
} È
ÖC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoSinEspecificacionFactory.cs
	namespace 	
Domain
 
. 

Creational 
. 
FactoryMethod )
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
iC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ICompraRepository.cs
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
kC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\IProductoRepository.cs
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
 ª
rC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroEmpleadoRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public		 

	interface		 &
ITerceroEmpleadoRepository		 /
:		0 1
IGenericRepository		2 D
<		D E
TerceroEmpleado		E T
>		T U
{

 
} 
} º
rC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroProvedorRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public		 

	interface		 &
ITerceroProvedorRepository		 /
:		0 1
IGenericRepository		2 D
<		D E
TerceroProveedor		E U
>		U V
{

 
} 
} £
jC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroRepository.cs
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
qC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroUsuarioRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface %
ITerceroUsuarioRepository .
:/ 0
IGenericRepository1 C
<C D
TerceroUsuarioD R
>R S
{ 
}		 
}

 ÿ
fC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Services\ProductoPuedeCrear.cs
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
} ´
lC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Services\PuedeDescontarCantidades.cs
	namespace 	
Domain
 
. 
Services 
{ 
public		 

class		 $
PuedeDescontarCantidades		 )
{

 
public 
static 
IReadOnlyList #
<# $
string$ *
>* +
CanDiscountAmounts, >
(> ?
Producto? G
productoH P
,P Q
doubleR X
cantidadADescontarY k
)k l
{ 	
return 
producto 
. "
PuedeDescontarCantidad 2
(2 3
cantidadADescontar3 E
)E F
;F G
} 	
} 
} 