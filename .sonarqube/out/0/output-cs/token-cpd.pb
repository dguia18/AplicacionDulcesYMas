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
} ‡
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
lC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IGenericBuilderProducto.cs
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
} ‰
gC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IGenericRepository.cs
	namespace 	
Domain
 
. 
	Contracts 
{		 
public

 
	interface

 
IGenericRepository

 $
<

$ %
T

% &
>

& '
where

( -
T

. /
:

0 1

BaseEntity

2 <
{ 
T 
Find 
( 	
object	 
id 
) 
; 
void 
Add 

(
 
T 
entity 
) 
; 
void 
Delete 
( 
T 
entity 
) 
; 
void 
Edit 
( 
T 
entity 
) 
; 
void 
AddRange 
( 
List 
< 
T 
> 
entities  
)  !
;! "
void 
DeleteRange 
( 
List 
< 
T 
> 
entities #
)# $
;$ %
IEnumerable 
< 
T 
> 
GetAll 
( 
) 
; 
T 
FindFirstOrDefault 
( 

Expression !
<! "
Func" &
<& '
T' (
,( )
bool* .
>. /
>/ 0
	predicate1 :
): ;
;; <
IEnumerable 
< 
T 
> 
FindBy 
( 

Expression "
<" #
Func# '
<' (
T( )
,) *
bool+ /
>/ 0
>0 1
	predicate2 ;
); <
;< =

IQueryable 
< 
T 
> 
FindBy 
( 

Expression 
< 
Func 
< 
T 
, 
bool 
> 
> 
filter #
=$ %
null& *
,* +
Func 
< 

IQueryable 
< 
T 
> 
, 
IOrderedQueryable 
< 
T 
> 
> 
orderBy  
=! "
null# '
,' (
string 	
includeProperties
 
= 
$str  
) 
; 
}!! 
}"" “
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
}		 Õ
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
ICategoriaRepository		 
CategoriaRepository		 0
{		1 2
get		3 6
;		6 7
}		8 9#
ISubCategoriaRepository

 "
SubCategoriaRepository

  6
{

7 8
get

9 <
;

< =
}

> ?
ITerceroRepository 
TerceroRepository ,
{- .
get/ 2
;2 3
}4 5%
ITerceroUsuarioRepository !$
TerceroUsuarioRepository" :
{; <
get= @
;@ A
}B C
IRoleRepository 
RoleRepository &
{' (
get) ,
;, -
}. /&
ITerceroEmpleadoRepository "%
TerceroEmpleadoRepository# <
{= >
get? B
;B C
}D E&
ITerceroProvedorRepository "%
TerceroProvedorRepository# <
{= >
get? B
;B C
}D E%
ITerceroClienteRepository !$
TerceroClienteRepository" :
{; <
get= @
;@ A
}B C
ICompraRepository 
CompraRepository *
{+ ,
get- 0
;0 1
}2 3
int 
Commit 
( 
) 
; 
} 
} µ%
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
; 
this 
. 
DetallesCompra 
= 
new 
List !
<! "
CompraDetalle" /
>/ 0
(0 1
)1 2
;2 3
} 
public 
Compra	 
( 
CompraBuilder 
compraBuilder +
)+ ,
{ 
this 
. 
	Proveedor 
= 
compraBuilder !
.! "
	Proveedor" +
;+ ,
this 
. 
Usuario 
= 
compraBuilder 
.  
Usuario  '
;' (
this 
. 
Fecha 
= 
DateTime 
. 
Now 
; 
this 
. 
DetallesCompra 
= 
new 
List !
<! "
CompraDetalle" /
>/ 0
(0 1
)1 2
;2 3
} 
public 
void	 

AddDetalle 
( 
CompraDetalle &
detalle' .
). /
{ 
this 
. 
DetallesCompra 
. 
Add 
( 
detalle "
)" #
;# $
this 
. 
Total 
+= 
detalle 
. 
GetTotal !
(! "
)" #
;# $
}   
public!! 
void!!	 &
AgregarCantidadesProductos!! (
(!!( )
)!!) *
{"" 
this## 
.## 
DetallesCompra## 
.## 
ForEach## 
(## 
(##  
detalle##  '
)##' (
=>##) +
{$$ 
detalle%% 
.%% 
Producto%% 
.%% 
AdicionarCantidad%% &
(%%& '
detalle%%' .
.%%. /
Cantidad%%/ 7
)%%7 8
;%%8 9
}&& 
)&& 
;&& 
}'' 
public(( 
class((	 
CompraBuilder(( 
{)) 
public** 	
TerceroProveedor**
 
	Proveedor** $
{**% &
get**' *
;*** +
private**, 3
set**4 7
;**7 8
}**9 :
public++ 	
TerceroUsuario++
 
Usuario++  
{++! "
get++# &
;++& '
private++( /
set++0 3
;++3 4
}++5 6
public,, 	
CompraBuilder,,
 
(,, 
TerceroProveedor,, (
provedor,,) 1
,,,1 2
TerceroUsuario,,3 A
usuario,,B I
),,I J
{-- 
this.. 
... 	
	Proveedor..	 
=.. 
provedor.. 
;.. 
this// 
.// 	
Usuario//	 
=// 
usuario// 
;// 
}00 
public11 	
Compra11
 
Build11 
(11 
)11 
{22 
Compra33 

compra33 
=33 
new33 
Compra33 
(33 
this33 #
)33# $
;33$ %
return44 

compra44 
;44 
}55 
}66 
}77 
}88 ∫-
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
}JJ ∑
^C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Devolucion.cs
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
eC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\DevolucionDetalle.cs
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
} ≤`
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
;< =
public 
int	 
SubCategoriaId 
{ 
get !
;! "
set# &
;& '
}( )
public 
List	 
< %
ProductoParaVenderDetalle '
>' (&
ProductoParaVenderDetalles 
{ 
get 
; 
set	 
; 
} 
	protected 
Producto 
( 
) 
{   
}"" 
public## 
virtual##	 
void## 
AgregarFabricacion## (
(##( )
Fabricacion##) 4
fabricacion##5 @
)##@ A
{$$ 
}&& 
public'' 
virtual''	 
void'' 
AgregarDetalle'' $
(''$ %%
ProductoParaVenderDetalle''% >%
productoParaVenderDetalle''? X
)''X Y
{(( 
}** 
public++ 
void++	 
SetSubCategoria++ 
(++  
ProductoSubCategoria++ 2
subCategoria++3 ?
)++? @
{,, 
this-- 
.-- 
SubCategoria-- 
=-- 
subCategoria-- #
;--# $
this.. 
... 
SubCategoriaId.. 
=.. 
subCategoria.. %
...% &
Id..& (
;..( )
}// 
public00 
void00	 
SetEnvoltorio00 
(00 
Producto00 $

envoltorio00% /
)00/ 0
{11 
this22 
.22 

Envoltorio22 
=22 

envoltorio22 
;22  
}33 
public44 
void44	  
AgregarDetalleCompra44 "
(44" #
CompraDetalle44# 0
detalle441 8
)448 9
{55 
this66 
.66 
DetallesCompra66 
.66 
Add66 
(66 
detalle66 "
)66" #
;66# $
}77 
public88 
List88	 
<88 
string88 
>88 "
PuedeDescontarCantidad88 ,
(88, -
double88- 3
cantidad884 <
)88< =
{99 
var:: 
errores:: 
=:: 
new:: 
List:: 
<:: 
string::  
>::  !
(::! "
)::" #
;::# $
if;; 
(;; 
(;; 
this;; 
.;; 
Cantidad;; 
-;; 
cantidad;;  
);;  !
<;;" #
$num;;$ %
);;% &
{<< 
errores== 
.== 
Add== 
(== 
$"== 
El producto == 
{== 
this== #
.==# $
Nombre==$ *
}==* +<
0 No puede descontar cantidades, unidades escasas==+ [
"==[ \
)==\ ]
;==] ^
}>> 
return?? 	
errores??
 
;?? 
}@@ 
publicAA 
boolAA	 
DescontarCantidadAA 
(AA  
doubleAA  &
cantidadAA' /
)AA/ 0
{BB 
ifCC 
(CC "
PuedeDescontarCantidadCC 
(CC 
cantidadCC &
)CC& '
.CC' (
AnyCC( +
(CC+ ,
)CC, -
)CC- .
throwDD 	
newDD
 %
InvalidOperationExceptionDD '
(DD' (
$strDD( E
)DDE F
;DDF G
thisEE 
.EE 
CantidadEE 
-=EE 
cantidadEE 
;EE 
returnFF 	
trueFF
 
;FF 
}GG 
publicHH 
voidHH	 
AddCompraDetalleHH 
(HH 
CompraDetalleHH ,
detalleHH- 4
)HH4 5
{II 
thisJJ 
.JJ 
DetallesCompraJJ 
.JJ 
AddJJ 
(JJ 
detalleJJ "
)JJ" #
;JJ# $
thisKK 
.KK 
AdicionarCantidadKK 
(KK 
detalleKK !
.KK! "
CantidadKK" *
)KK* +
;KK+ ,
}LL 
publicMM 
ProductoMM	 
SetCostoUnitarioMM "
(MM" #
doubleMM# )
costoMM* /
)MM/ 0
{NN 
thisOO 
.OO 
CostoUnitarioOO 
=OO 
costoOO 
;OO 
returnPP 	
thisPP
 
;PP 
}QQ 
publicRR 
ProductoRR	 
SetCantidadRR 
(RR 
doubleRR $
cantidadRR% -
)RR- .
{SS 
thisTT 
.TT 
CantidadTT 
=TT 
cantidadTT 
;TT 
returnUU 	
thisUU
 
;UU 
}VV 
publicWW 
ProductoWW	 
	SetNombreWW 
(WW 
stringWW "
nombreWW# )
)WW) *
{XX 
thisYY 
.YY 
NombreYY 
=YY 
nombreYY 
;YY 
returnZZ 	
thisZZ
 
;ZZ 
}[[ 
public\\ 
Producto\\	 
SetUnidadDeMedida\\ #
(\\# $
UnidadDeMedida\\$ 2
unidadDeMedida\\3 A
)\\A B
{]] 
this^^ 
.^^ 
UnidadDeMedida^^ 
=^^ 
unidadDeMedida^^ '
;^^' (
return__ 	
this__
 
;__ 
}`` 
publicaa 
Productoaa	 #
SetPorcentajeDeUtilidadaa )
(aa) *
doubleaa* 0 
porcentajeDeUtilidadaa1 E
)aaE F
{bb 
thiscc 
.cc  
PorcentajeDeUtilidadcc 
=cc  
porcentajeDeUtilidadcc 3
;cc3 4
returndd 	
thisdd
 
;dd 
}ee 
publicff 
Productoff	 
SetTipoff 
(ff 
Tipoff 
tipoff #
)ff# $
{gg 
thishh 
.hh 
Tipohh 
=hh 
tipohh 
;hh 
returnii 	
thisii
 
;ii 
}jj 
publickk 
voidkk	 
AdicionarCantidadkk 
(kk  
doublekk  &
cantidadkk' /
)kk/ 0
{ll 
thismm 
.mm 
AplicarCantidadmm 
(mm 
cantidadmm  
)mm  !
;mm! "
thisnn 
.nn 
ActualizarCostonn 
(nn 
)nn 
;nn 
}oo 
	protectedpp 
abstractpp 
voidpp 
AplicarCantidadpp )
(pp) *
doublepp* 0
cantidadpp1 9
)pp9 :
;pp: ;
	protectedqq 
abstractqq 
voidqq 
ActualizarCostoqq )
(qq) *
)qq* +
;qq+ ,
publicrr 
overriderr	 
stringrr 
ToStringrr !
(rr! "
)rr" #
{ss 
returntt 	
stringtt
 
.tt 
Formattt 
(tt 
$strtt '
+tt( )
$struu 
+uu 
$strvv 
,vv 
thisvv 
.vv  
Nombrevv  &
,vv& '
thisvv( ,
.vv, -
CostoUnitariovv- :
,vv: ;
thisww 
.ww 	
Cantidadww	 
,ww 
thisww 
.ww 
UnidadDeMedidaww &
)ww& '
;ww' (
}xx 
publiczz 
Productozz	 
SetEspecificacionzz #
(zz# $
Especificacionzz$ 2
especificacionzz3 A
)zzA B
{{{ 
this|| 
.|| 
Especificacion|| 
=|| 
especificacion|| '
;||' (
return}} 	
this}}
 
;}} 
}~~ 
} 
public
ÄÄ 
enum
ÄÄ 
Especificacion
ÄÄ 
{
ÅÅ 
MateriaPrima
ÇÇ 
,
ÇÇ 
Duro
ÉÉ 
,
ÉÉ 
Suave
ÑÑ 
,
ÑÑ 
TieneEnvoltorio
ÖÖ 
,
ÖÖ 
NoTieneEnvoltorio
ÜÜ 
}
áá 
public
àà 
enum
àà 
Tipo
àà 
{
ââ 
MateriaPrima
ää 
,
ää 
ParaFabricar
ãã 
,
ãã 

ParaVender
åå 
}
çç 
public
éé 
enum
éé 
UnidadDeMedida
éé 
{
èè 
Unidades
êê 

,
êê
 
Kilos
ëë 
,
ëë 
Libras
íí 
,
íí 	
Litros
ìì 
,
ìì 	
Onzas
îî 
}
ïï 
}ññ Ü	
vC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoCategoria.cs
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
 
ProductoCategoria

  
(

  !
)

! "
{ 	
this 
. 
SubCategorias 
=  
new! $
List% )
<) * 
ProductoSubCategoria* >
>> ?
(? @
)@ A
;A B
} 	
} 
} ˙(
yC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoMateriaPrima.cs
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
yC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaFabricar.cs
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
}UU Æ
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
{ 
} 
}		 »D
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
},, ª@
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
}pp º
yC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoSubCategoria.cs
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
;" #
private$ +
set, /
;/ 0
}1 2
public		 
List		 
<		  
ProductoSubCategoria		 (
>		( )
SubCategorias		* 7
{		8 9
get		: =
;		= >
private		? F
set		G J
;		J K
}		L M
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
4 5
public  
ProductoSubCategoria #
(# $
)$ %
{ 	
this 
. 
SubCategorias 
=  
new! $
List% )
<) * 
ProductoSubCategoria* >
>> ?
(? @
)@ A
;A B
this 
. 
	Productos 
= 
new  
List! %
<% &
Producto& .
>. /
(/ 0
)0 1
;1 2
} 	
public  
ProductoSubCategoria #
(# $'
ProductoSubCategoriaBuilder$ ?'
productoSubCategoriaBuilder@ [
)[ \
{ 	
this 
. 
Nombre 
= '
productoSubCategoriaBuilder 5
.5 6
Nombre6 <
;< =
} 	
public 
void 
AgregarSubCategoria '
(' ( 
ProductoSubCategoria( <
subCategoria= I
)I J
{ 	
this 
. 
SubCategorias 
. 
Add "
(" #
subCategoria# /
)/ 0
;0 1
} 	
public 
class '
ProductoSubCategoriaBuilder 0
{ 	
public 
string 
Nombre  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public '
ProductoSubCategoriaBuilder .
(. /
string/ 5
nombre6 <
)< =
{ 
this 
. 
Nombre 
= 
nombre $
;$ %
} 
public    
ProductoSubCategoria   '
Build  ( -
(  - .
)  . /
{!!  
ProductoSubCategoria"" $
subCategoria""% 1
=""2 3
new""4 7 
ProductoSubCategoria""8 L
(""L M
this""M Q
)""Q R
;""R S
return## 
subCategoria## #
;### $
}$$ 
}%% 	
}&& 
}'' ù
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
})) ø
dC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Contacto.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
Contacto 
: 
Entity "
<" #
int# &
>& '
{ 
public		 
string		 
	Direccion		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

 
NumeroCelular

 #
{

$ %
get

& )
;

) *
set

+ .
;

. /
}

0 1
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
Contacto 
( 
ContactoBuilder '
builder( /
)/ 0
{ 	
this 
. 
	Direccion 
= 
builder $
.$ %
	Direccion% .
;. /
this 
. 
NumeroCelular 
=  
builder! (
.( )
NumeroCelular) 6
;6 7
this 
. 
Email 
= 
builder  
.  !
Email! &
;& '
} 	
public 
Contacto 
( 
) 
{ 	
} 	
public 
class 
ContactoBuilder $
{ 	
public 
int 
Id 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 
string 
	Direccion #
{$ %
get& )
;) *
private+ 2
set3 6
;6 7
}8 9
public 
string 
NumeroCelular '
{( )
get* -
;- .
private/ 6
set7 :
;: ;
}< =
public 
string 
Email 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
ContactoBuilder "
SetDireccion# /
(/ 0
string0 6
	direccion7 @
)@ A
{ 
this 
. 
	Direccion 
=  
	direccion! *
;* +
return 
this 
; 
}   
public!! 
ContactoBuilder!! "
SetNumeroCelular!!# 3
(!!3 4
string!!4 :
celular!!; B
)!!B C
{"" 
this## 
.## 
NumeroCelular## "
=### $
celular##% ,
;##, -
return$$ 
this$$ 
;$$ 
}%% 
public&& 
ContactoBuilder&& "
SetEmail&&# +
(&&+ ,
string&&, 2
email&&3 8
)&&8 9
{'' 
this(( 
.(( 
Email(( 
=(( 
email(( "
;((" #
return)) 
this)) 
;)) 
}** 
public++ 
Contacto++ 
Build++ !
(++! "
)++" #
{,, 
Contacto-- 
contacto-- !
=--" #
new--$ '
Contacto--( 0
(--0 1
this--1 5
)--5 6
;--6 7
return.. 
contacto.. 
;..  
}// 
public11 
ContactoBuilder11 "
SetId11# (
(11( )
int11) ,
id11- /
)11/ 0
{22 
this33 
.33 
Id33 
=33 
id33 
;33 
return44 
this44 
;44 
}55 
}66 	
}77 
}88 ¯
`C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Role.cs
	namespace 	
Domain
 
. 
Entities 
. 
Tercero !
{ 
public 

class 
Role 
: 
Entity 
< 
int "
>" #
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
; 
} 	
} 
} Ë.
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
public## 
int## 
Id## 
{## 
get## 
;##  
private##! (
set##) ,
;##, -
}##. /
public$$ 
string$$ 
Nit$$ 
{$$ 
get$$  #
;$$# $
private$$% ,
set$$- 0
;$$0 1
}$$2 3
public%% 
string%% 
RazonSocial%% %
{%%& '
get%%( +
;%%+ ,
private%%- 4
set%%5 8
;%%8 9
}%%: ;
public&& 
List&& 
<&& 
Contacto&&  
>&&  !
	Contactos&&" +
{&&, -
get&&. 1
;&&1 2
private&&3 :
set&&; >
;&&> ?
}&&@ A
public'' 
List'' 
<'' 
TerceroUsuario'' &
>''& '
Usuarios''( 0
{''1 2
get''3 6
;''6 7
private''8 ?
set''@ C
;''C D
}''E F
public(( 
TerceroBuilder(( !
(((! "
string((" (
nit(() ,
,((, -
string((. 4
razonSocial((5 @
)((@ A
{)) 
this** 
.** 
Nit** 
=** 
nit** 
;** 
this++ 
.++ 
RazonSocial++  
=++! "
razonSocial++# .
;++. /
},, 
public-- 
TerceroBuilder-- !
SetId--" '
(--' (
int--( +
id--, .
)--. /
{.. 
this// 
.// 
Id// 
=// 
id// 
;// 
return00 
this00 
;00 
}11 
public22 
TerceroBuilder22 !
SetContactos22" .
(22. /
List22/ 3
<223 4
Contacto224 <
>22< =
	contactos22> G
)22G H
{33 
this44 
.44 
	Contactos44 
=44  
	contactos44! *
;44* +
return55 
this55 
;55 
}66 
public77 
TerceroBuilder77 !
SetUsuarios77" -
(77- .
List77. 2
<772 3
TerceroUsuario773 A
>77A B
usuarios77C K
)77K L
{88 
this99 
.99 
Usuarios99 
=99 
usuarios99  (
;99( )
return:: 
this:: 
;:: 
};; 
public<< 
Tercero<< 
Build<<  
(<<  !
)<<! "
{== 
Tercero>> 
tercero>> 
=>>  !
new>>" %
Tercero>>& -
(>>- .
this>>. 2
)>>2 3
;>>3 4
return?? 
tercero?? 
;?? 
}@@ 
}AA 	
}BB 
}CC Ö%
jC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroCliente.cs
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
public&& 
List&& 
<&& (
TerceroClientePrecioProducto&& 4
>&&4 5
ListaDePrecios&&6 D
{&&E F
get&&G J
;&&J K
private&&L S
set&&T W
;&&W X
}&&Y Z
public'' !
TerceroClienteBuilder'' (
(''( )
Tercero'') 0
tercero''1 8
)''8 9
{(( 
this)) 
.)) 
Tercero)) 
=)) 
tercero)) &
;))& '
}** 
public++ !
TerceroClienteBuilder++ (

SetPrecios++) 3
(++3 4
List++4 8
<++8 9(
TerceroClientePrecioProducto++9 U
>++U V
precios++W ^
)++^ _
{,, 
this-- 
.-- 
ListaDePrecios-- #
=--$ %
precios--& -
;--- .
return.. 
this.. 
;.. 
}// 
public00 
TerceroCliente00 !
Build00" '
(00' (
)00( )
{11 
TerceroCliente22 
cliente22 &
=22' (
new22) ,
TerceroCliente22- ;
(22; <
this22< @
)22@ A
;22A B
return33 
cliente33 
;33 
}44 
}55 	
}66 
}77 Ä<
xC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroClientePrecioProducto.cs
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
} Ñ&
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
public 
Role 
Role 
{ 
get 
; 
set  #
;# $
}% &
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
. 
Role 
= !
terceroUsuarioBuilder -
.- .
Rol. 1
;1 2
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
public$$ 
Role$$ 
Rol$$ 
{$$ 
get$$ !
;$$! "
private$$# *
set$$+ .
;$$. /
}$$0 1
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
(44/ 0
Role440 4
rol445 8
)448 9
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
YC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Venta.cs
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
^C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\VentaAbono.cs
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
`C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\VentaDetalle.cs
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
}hh √
sC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\AbstractFactory\IProductoFactory.cs
	namespace 	
Domain
 
. 
Factory 
. 
AbstractFactory (
{ 
public 

	interface 
IProductoFactory %
{		 
Producto

 
CrearProducto

 
(

 
Especificacion

 -
especificacion

. <
)

< =
;

= >
} 
public 

class  
CrearProductoFactory %
:& '
IProductoFactory( 8
{ 
private 
readonly 
IProductoFactory )
FactoriaConcreta* :
;: ;
public 
Producto 
CrearProducto %
(% &
Especificacion& 4
especificacion5 C
)C D
{ 	
return 
FactoriaConcreta #
.# $
CrearProducto$ 1
(1 2
especificacion2 @
)@ A
;A B
} 	
public  
CrearProductoFactory #
(# $
Tipo$ (
tipo) -
)- .
{ 	
FactoriaConcreta 
= 
tipo #
switch$ *
{ 
Tipo 
. 
MateriaPrima !
=>" $
new% (,
 ProductoSinEspecificacionFactory) I
(I J
)J K
,K L
Tipo 
. 
ParaFabricar !
=>" $
new% ('
ProductoParaFabricarFactory) D
(D E
)E F
,F G
Tipo 
. 

ParaVender 
=>  "
new# &%
ProductoParaVenderFactory' @
(@ A
)A B
,B C
_ 
=> 
throw 
new %
InvalidOperationException 8
(8 9
$str9 \
)\ ]
,] ^
} 
; 
} 	
} 
} Å
ÄC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaFabricarFactory.cs
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
switch 
( 
especificacion "
)" #
{ 
case 
Especificacion #
.# $
Duro$ (
:( )
return 
new $
ProductoParaFabricarDuro  8
(8 9
)9 :
;: ;
case 
Especificacion #
.# $
Suave$ )
:) *
return 
new %
ProductoParaFabricarSuave 8
(8 9
)9 :
;: ;
default 
: 
throw 
new %
InvalidOperationException )
() *
$"* ,
La especificaci√≥n , >
{> ?
especificacion? M
.M N
ToStringN V
(V W
)W X
}X Y 
 no es para fabricarY m
"m n
)n o
;o p
} 
} 	
} 
} Œ
~C:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaVenderFactory.cs
	namespace 	
Domain
 
. 
Factory 
. 
ConcreteFactories *
{+ ,
public 
class %
ProductoParaVenderFactory '
:( )
IProductoFactory* :
{; <
public 
Producto	 
CrearProducto 
(  !
Especificacion! /
especificacion0 >
)> ?
{@ A
switch 	
(
 
especificacion 
) 
{		 
case

 
Especificacion

	 
.

 
TieneEnvoltorio

 '
:

' (
return 
new +
ProductoParaVenderConEnvoltorio /
(/ 0
)0 1
;1 2
case 
Especificacion	 
. 
NoTieneEnvoltorio )
:) *
return 
new +
ProductoParaVenderSinEnvoltorio /
(/ 0
)0 1
;1 2
default 
: 
throw 

new %
InvalidOperationException 
( 
$"  
La especificaci√≥n   2
"2 3
+4 5
$" 
{ 
especificacion 
. 
ToString 
( 
) 
} 
 no es para vender 0
"0 1
)1 2
;2 3
} 
} 
} 
} ≤

ÖC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoSinEspecificacionFactory.cs
	namespace 	
Domain
 
. 
Factory 
. 
ConcreteFactories *
{ 
public		 

class		 ,
 ProductoSinEspecificacionFactory		 1
:		2 3
IProductoFactory		4 D
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
{ 	
if 
( 
Especificacion 
. 
MateriaPrima +
==, .
especificacion/ =
)= >
{ 
return 
new  
ProductoMateriaPrima /
(/ 0
)0 1
;1 2
} 
throw 
new %
InvalidOperationException /
(/ 0
$"0 2
La especificaci√≥n 2 D
{D E
especificacionE S
.S T
ToStringT \
(\ ]
)] ^
}^ _
"` a
+b c
$" &
no es para materias primas ,
", -
)- .
;. /
} 	
} 
} ±
lC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ICategoriaRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface  
ICategoriaRepository )
:) *
IGenericRepository+ =
<= >
ProductoCategoria> O
>O P
{ 
}		 
}

 †
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
 ö
gC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\IRoleRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface 
IRoleRepository $
:% &
IGenericRepository' 9
<9 :
Role: >
>> ?
{ 
}		 
}

 ∫
oC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ISubCategoriaRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface #
ISubCategoriaRepository ,
:- .
IGenericRepository/ A
<A B 
ProductoSubCategoriaB V
>V W
{ 
} 
}		 ∏
qC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroClienteRepository.cs
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
rC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroEmpleadoRepository.cs
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
rC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITerceroProvedorRepository.cs
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
} ø
lC:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Services\PuedeDescontarCantidades.cs
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