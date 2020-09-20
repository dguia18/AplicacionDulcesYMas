í
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
} Å
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
} à
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
} †
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
( 
decimal #
costo$ )
)) *
;* +
public 
T	 

SetCantidad 
( 
decimal 
cantidad '
)' (
;( )
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
(" #
decimal# * 
porcentajeDeUtilidad+ ?
)? @
;@ A
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
} ä
gc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\IGenericRepository.cs
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
}"" Ò
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
}		 æ
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
}		 í
nc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Contracts\ITerceroGenericRepository.cs
	namespace 	
Domain
 
. 
	Contracts 
{ 
public 

	interface %
ITerceroGenericRepository .
:/ 0%
ITerceroClienteRepository1 J
,J K&
ITerceroProvedorRepository "
," #&
ITerceroEmpleadoRepository "
{		 
}

 
} Ò
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
}2 3"
ITransaccionRepository !
TransaccionRepository 4
{5 6
get7 :
;: ;
}< =
int 
Commit 
( 
) 
; 
} 
} ½&
Zc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Compra.cs
	namespace 	
Domain
 
. 
Entities 
{		 
public

 
class

 
Compra

 
:

 
Entity

 
<

 
int

 !
>

! "
{ 
[ 
Column 	
(	 

TypeName
 
= 
$str "
)" #
]# $
public 
decimal	 
Total 
{ 
get 
; 
set !
;! "
}# $
public 
TerceroProveedor	 
	Proveedor #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
TerceroUsuario	 
Usuario 
{  !
get" %
;% &
set' *
;* +
}, -
public 
List	 
< 
CompraDetalle 
> 
DetallesCompra +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
DateTime	 
Fecha 
{ 
get 
; 
set "
;" #
}$ %
public 
Compra	 
( 
) 
{ 
this 
. 
Fecha 
= 
DateTime 
. 
Now 
; 
this 
. 
DetallesCompra 
= 
new 
List !
<! "
CompraDetalle" /
>/ 0
(0 1
)1 2
;2 3
} 
public 
Compra	 
( 
CompraBuilder 
compraBuilder +
)+ ,
{ 
this 
. 
	Proveedor 
= 
compraBuilder !
.! "
	Proveedor" +
;+ ,
this 
. 
Usuario 
= 
compraBuilder 
.  
Usuario  '
;' (
this 
. 
Fecha 
= 
DateTime 
. 
Now 
; 
this 
. 
DetallesCompra 
= 
new 
List !
<! "
CompraDetalle" /
>/ 0
(0 1
)1 2
;2 3
} 
public 
void	 

AddDetalle 
( 
CompraDetalle &
detalle' .
). /
{ 
this   
.   
DetallesCompra   
.   
Add   
(   
detalle   "
)  " #
;  # $
this!! 
.!! 
Total!! 
+=!! 
detalle!! 
.!! 
GetTotal!! !
(!!! "
)!!" #
;!!# $
}"" 
public## 
void##	 &
AgregarCantidadesProductos## (
(##( )
)##) *
{$$ 
this%% 
.%% 
DetallesCompra%% 
.%% 
ForEach%% 
(%% 
(%%  
detalle%%  '
)%%' (
=>%%) +
{&& 
detalle'' 
.'' 
Producto'' 
.'' 
AdicionarCantidad'' &
(''& '
detalle''' .
.''. /
Cantidad''/ 7
)''7 8
;''8 9
}(( 
)(( 
;(( 
})) 
public** 
class**	 
CompraBuilder** 
{++ 
public,, 	
TerceroProveedor,,
 
	Proveedor,, $
{,,% &
get,,' *
;,,* +
private,,, 3
set,,4 7
;,,7 8
},,9 :
public-- 	
TerceroUsuario--
 
Usuario--  
{--! "
get--# &
;--& '
private--( /
set--0 3
;--3 4
}--5 6
public.. 	
CompraBuilder..
 
(.. 
TerceroProveedor.. (
provedor..) 1
,..1 2
TerceroUsuario..3 A
usuario..B I
)..I J
{// 
this00 
.00 	
	Proveedor00	 
=00 
provedor00 
;00 
this11 
.11 	
Usuario11	 
=11 
usuario11 
;11 
}22 
public33 	
Compra33
 
Build33 
(33 
)33 
{44 
Compra55 

compra55 
=55 
new55 
Compra55 
(55 
this55 #
)55# $
;55$ %
return66 

compra66 
;66 
}77 
}88 
}99 
}:: Ï/
ac:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\CompraDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
CompraDetalle 
{ 
public		 
int		 
CompraId		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
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
public 
Producto 
Producto  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
Compra 
Compra 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Valor 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Cantidad 
{  !
get" %
;% &
set' *
;* +
}, -
public 
CompraDetalle 
( 
Producto %
producto& .
,. /
Compra0 6
compra7 =
)= >
{ 	
this 
. 
CompraId 
= 
compra "
." #
Id# %
;% &
this 
. 

ProductoId 
= 
producto &
.& '
Id' )
;) *
this 
. 
Producto 
= 
producto $
;$ %
this 
. 
Compra 
= 
compra  
;  !
} 	
public 
CompraDetalle 
(  
CompraDetalleBuilder 1 
compraDetalleBuilder2 F
)F G
{ 	
this 
. 
Producto 
=  
compraDetalleBuilder 0
.0 1
Producto1 9
;9 :
this 
. 
Compra 
=  
compraDetalleBuilder .
.. /
Compra/ 5
;5 6
this 
. 
Cantidad 
=  
compraDetalleBuilder 0
.0 1
Cantidad1 9
;9 :
this 
. 
Valor 
=  
compraDetalleBuilder -
.- .
Valor. 3
;3 4
} 	
public   
CompraDetalle   
(   
)   
{!! 	
}## 	
public$$ 
decimal$$ 
GetTotal$$ 
($$  
)$$  !
{%% 	
return&& 
this&& 
.&& 
Valor&& 
*&& 
this&& #
.&&# $
Cantidad&&$ ,
;&&, -
}'' 	
public(( 
class((  
CompraDetalleBuilder(( )
{)) 	
public** 
Producto** 
Producto** $
{**% &
get**' *
;*** +
set**, /
;**/ 0
}**1 2
public++ 
Compra++ 
Compra++  
{++! "
get++# &
;++& '
set++( +
;+++ ,
}++- .
public,, 
decimal,, 
Valor,,  
{,,! "
get,,# &
;,,& '
set,,( +
;,,+ ,
},,- .
public-- 
decimal-- 
Cantidad-- #
{--$ %
get--& )
;--) *
set--+ .
;--. /
}--0 1
public//  
CompraDetalleBuilder// '
(//' (
Producto//( 0
producto//1 9
,//9 :
Compra//; A
compra//B H
)//H I
{00 
this11 
.11 
Compra11 
=11 
compra11 $
;11$ %
this22 
.22 
Producto22 
=22 
producto22  (
;22( )
}33 
public44  
CompraDetalleBuilder44 '
SetCantidad44( 3
(443 4
decimal444 ;
cantidad44< D
)44D E
{55 
this66 
.66 
Cantidad66 
=66 
cantidad66  (
;66( )
return77 
this77 
;77 
}88 
public99  
CompraDetalleBuilder99 '
SetCostoUnitario99( 8
(998 9
decimal999 @
costo99A F
)99F G
{:: 
this;; 
.;; 
Valor;; 
=;; 
costo;; "
;;;" #
return<< 
this<< 
;<< 
}== 
public>> 
CompraDetalle>>  
Build>>! &
(>>& '
)>>' (
{?? 
CompraDetalle@@ 
compra@@ $
=@@% &
null@@' +
;@@+ ,
ifAA 
(AA 
ValidarConstruccionAA '
(AA' (
)AA( )
)AA) *
{BB 
returnCC 
newCC 
CompraDetalleCC ,
(CC, -
thisCC- 1
)CC1 2
;CC2 3
}DD 
returnEE 
compraEE 
;EE 
}FF 
privateHH 
boolHH 
ValidarConstruccionHH ,
(HH, -
)HH- .
{II 
returnJJ 
thisJJ 
.JJ 
CantidadJJ $
>JJ% &
$numJJ' (
&&JJ) +
thisJJ, 0
.JJ0 1
ValorJJ1 6
>JJ7 8
$numJJ9 :
;JJ: ;
}KK 
}LL 	
}MM 
}NN ¿	
^c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Devolucion.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public		 

class		 

Devolucion		 
:		 
Entity		 $
<		$ %
int		% (
>		( )
{

 
public 
TerceroCliente 
Cliente %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
TerceroUsuario 
Usuario %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Total 
{ 
get "
;" #
set$ '
;' (
}) *
public 
List 
< 
DevolucionDetalle %
>% &
DevolucionDetalles' 9
{: ;
get< ?
;? @
setA D
;D E
}F G
} 
} ¡

ec:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\DevolucionDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
DevolucionDetalle "
:# $
Entity$ *
<* +
int+ .
>. /
{ 
public		 

Devolucion		 

Devolucion		 $
{		% &
get		' *
;		* +
set		, /
;		/ 0
}		1 2
public

 
Producto

 
Producto

  
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
public 
int 
DevolucionId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 

ProductoId 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Cantidad 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ðd
mc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\Producto.cs
	namespace 	
Domain
 
. 
Entities 
. 
EntitiesProducto *
{		 
public

 
abstract

 
class

 
Producto

 
:

  !
Entity

" (
<

( )
int

) ,
>

, -
,

- .
IProductoParaVender

/ B
,

B C!
IProductoParaFabricar 
, 
IBuilderProducto )
{ 
public 
string	 
Nombre 
{ 
get 
; 
set !
;! "
}# $
[ 
Column 	
(	 

TypeName
 
= 
$str #
)# $
]$ %
public 
decimal	 
Cantidad 
{ 
get 
;  
	protected! *
set+ .
;. /
}0 1
private 	
decimal
 
_costo 
; 
[ 
Column 	
(	 

TypeName
 
= 
$str #
)# $
]$ %
public 
virtual	 
decimal 
CostoUnitario &
{' (
get) ,
=>- /
_costo0 6
;6 7
set8 ;
=>< >
_costo? E
=F G
MathH L
.L M
RoundM R
(R S
valueS X
,X Y
$numZ [
)[ \
;\ ]
}^ _
public 
UnidadDeMedida	 
UnidadDeMedida &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
[ 
Column 	
(	 

TypeName
 
= 
$str #
)# $
]$ %
public 
decimal	  
PorcentajeDeUtilidad %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
$num6 8
;8 9
[ 
Column 	
(	 

TypeName
 
= 
$str #
)# $
]$ %
public 
decimal	 !
PrecioSugeridoDeVenta &
{' (
get) ,
=>- /
Math0 4
.4 5
Round5 :
(: ;
CostoUnitario; H
/I J
(K L
$numL M
-N O 
PorcentajeDeUtilidadP d
/e f
$numg j
)j k
,k l
$numl m
)m n
;n o
}p q
public 
Especificacion	 
Especificacion &
{' (
get) ,
;, -
	protected. 7
set8 ;
;; <
}= >
public 
Tipo	 
Tipo 
{ 
get 
; 
	protected #
set$ '
;' (
}) *
public 
Producto	 

Envoltorio 
{ 
get "
;" #
set$ '
;' (
}) *
public  
ProductoSubCategoria	 
SubCategoria *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
List	 
< 
Fabricacion 
> 
Fabricaciones (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
List	 
< 
CompraDetalle 
> 
DetallesCompra +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
DateTime0 8
.8 9
Now9 <
;< =
public 
int	 
SubCategoriaId 
{ 
get !
;! "
set# &
;& '
}( )
public   
List  	 
<   %
ProductoParaVenderDetalle   '
>  ' (&
ProductoParaVenderDetalles!! 
{"" 
get"" 
;"" 
set""	 
;"" 
}"" 
	protected## 
Producto## 
(## 
)## 
{$$ 
}&& 
public'' 
virtual''	 
void'' 
AgregarFabricacion'' (
(''( )
Fabricacion'') 4
fabricacion''5 @
)''@ A
{(( 
}** 
public++ 
virtual++	 
void++ 
AgregarDetalle++ $
(++$ %%
ProductoParaVenderDetalle++% >%
productoParaVenderDetalle++? X
)++X Y
{,, 
}.. 
public// 
void//	 
SetSubCategoria// 
(//  
ProductoSubCategoria// 2
subCategoria//3 ?
)//? @
{00 
this11 
.11 
SubCategoria11 
=11 
subCategoria11 #
;11# $
this22 
.22 
SubCategoriaId22 
=22 
subCategoria22 %
.22% &
Id22& (
;22( )
}33 
public44 
void44	 
SetEnvoltorio44 
(44 
Producto44 $

envoltorio44% /
)44/ 0
{55 
this66 
.66 

Envoltorio66 
=66 

envoltorio66 
;66  
}77 
public88 
void88	  
AgregarDetalleCompra88 "
(88" #
CompraDetalle88# 0
detalle881 8
)888 9
{99 
this:: 
.:: 
DetallesCompra:: 
.:: 
Add:: 
(:: 
detalle:: "
)::" #
;::# $
};; 
public<< 
List<<	 
<<< 
string<< 
><< "
PuedeDescontarCantidad<< ,
(<<, -
decimal<<- 4
cantidad<<5 =
)<<= >
{== 
var>> 
errores>> 
=>> 
new>> 
List>> 
<>> 
string>>  
>>>  !
(>>! "
)>>" #
;>># $
if?? 
(?? 
(?? 
this?? 
.?? 
Cantidad?? 
-?? 
cantidad??  
)??  !
<??" #
$num??$ %
)??% &
{@@ 
erroresAA 
.AA 
AddAA 
(AA 
$"AA 
El producto AA 
{AA 
thisAA #
.AA# $
NombreAA$ *
}AA* +<
0 No puede descontar cantidades, unidades escasasAA+ [
"AA[ \
)AA\ ]
;AA] ^
}BB 
returnCC 	
erroresCC
 
;CC 
}DD 
publicEE 
boolEE	 
DescontarCantidadEE 
(EE  
decimalEE  '
cantidadEE( 0
)EE0 1
{FF 
ifGG 
(GG "
PuedeDescontarCantidadGG 
(GG 
cantidadGG &
)GG& '
.GG' (
AnyGG( +
(GG+ ,
)GG, -
)GG- .
throwHH 	
newHH
 %
InvalidOperationExceptionHH '
(HH' (
$strHH( E
)HHE F
;HHF G
thisII 
.II 
CantidadII 
-=II 
cantidadII 
;II 
returnJJ 	
trueJJ
 
;JJ 
}KK 
publicLL 
voidLL	 
AddCompraDetalleLL 
(LL 
CompraDetalleLL ,
detalleLL- 4
)LL4 5
{MM 
thisNN 
.NN 
DetallesCompraNN 
.NN 
AddNN 
(NN 
detalleNN "
)NN" #
;NN# $
thisOO 
.OO 
AdicionarCantidadOO 
(OO 
detalleOO !
.OO! "
CantidadOO" *
)OO* +
;OO+ ,
}PP 
publicQQ 
ProductoQQ	 
SetCostoUnitarioQQ "
(QQ" #
decimalQQ# *
costoQQ+ 0
)QQ0 1
{RR 
thisSS 
.SS 
CostoUnitarioSS 
=SS 
costoSS 
;SS 
returnTT 	
thisTT
 
;TT 
}UU 
publicVV 
ProductoVV	 
SetCantidadVV 
(VV 
decimalVV %
cantidadVV& .
)VV. /
{WW 
thisXX 
.XX 
CantidadXX 
=XX 
cantidadXX 
;XX 
returnYY 	
thisYY
 
;YY 
}ZZ 
public[[ 
Producto[[	 
	SetNombre[[ 
([[ 
string[[ "
nombre[[# )
)[[) *
{\\ 
this]] 
.]] 
Nombre]] 
=]] 
nombre]] 
;]] 
return^^ 	
this^^
 
;^^ 
}__ 
public`` 
Producto``	 
SetUnidadDeMedida`` #
(``# $
UnidadDeMedida``$ 2
unidadDeMedida``3 A
)``A B
{aa 
thisbb 
.bb 
UnidadDeMedidabb 
=bb 
unidadDeMedidabb '
;bb' (
returncc 	
thiscc
 
;cc 
}dd 
publicee 
Productoee	 #
SetPorcentajeDeUtilidadee )
(ee) *
decimalee* 1 
porcentajeDeUtilidadee2 F
)eeF G
{ff 
thisgg 
.gg  
PorcentajeDeUtilidadgg 
=gg  
porcentajeDeUtilidadgg 3
;gg3 4
returnhh 	
thishh
 
;hh 
}ii 
publicjj 
Productojj	 
SetTipojj 
(jj 
Tipojj 
tipojj #
)jj# $
{kk 
thisll 
.ll 
Tipoll 
=ll 
tipoll 
;ll 
returnmm 	
thismm
 
;mm 
}nn 
publicoo 
voidoo	 
AdicionarCantidadoo 
(oo  
decimaloo  '
cantidadoo( 0
)oo0 1
{pp 
thisqq 
.qq 
AplicarCantidadqq 
(qq 
cantidadqq  
)qq  !
;qq! "
thisrr 
.rr 
ActualizarCostorr 
(rr 
)rr 
;rr 
}ss 
	protectedtt 
abstracttt 
voidtt 
AplicarCantidadtt )
(tt) *
decimaltt* 1
cantidadtt2 :
)tt: ;
;tt; <
	protecteduu 
abstractuu 
voiduu 
ActualizarCostouu )
(uu) *
)uu* +
;uu+ ,
publicvv 
overridevv	 
stringvv 
ToStringvv !
(vv! "
)vv" #
{ww 
returnxx 	
stringxx
 
.xx 
Formatxx 
(xx 
$strxx '
+xx( )
$stryy 
+yy 
$strzz 
,zz 
thiszz 
.zz  
Nombrezz  &
,zz& '
thiszz( ,
.zz, -
CostoUnitariozz- :
,zz: ;
this{{ 
.{{ 	
Cantidad{{	 
,{{ 
this{{ 
.{{ 
UnidadDeMedida{{ &
){{& '
;{{' (
}|| 
public~~ 
Producto~~	 
SetEspecificacion~~ #
(~~# $
Especificacion~~$ 2
especificacion~~3 A
)~~A B
{ 
this
€€ 
.
€€ 
Especificacion
€€ 
=
€€ 
especificacion
€€ '
;
€€' (
return
 	
this

 
;
 
}
‚‚ 
}
ƒƒ 
public
„„ 
enum
„„ 
Especificacion
„„ 
{
…… 
MateriaPrima
†† 
,
†† 
Duro
‡‡ 
,
‡‡ 
Suave
ˆˆ 
,
ˆˆ 
TieneEnvoltorio
‰‰ 
,
‰‰ 
NoTieneEnvoltorio
ŠŠ 
}
‹‹ 
public
ŒŒ 
enum
ŒŒ 
Tipo
ŒŒ 
{
 
MateriaPrima
ŽŽ 
,
ŽŽ 
ParaFabricar
 
,
 

ParaVender
 
}
‘‘ 
public
’’ 
enum
’’ 
UnidadDeMedida
’’ 
{
““ 
Unidades
”” 

,
””
 
Kilos
•• 
,
•• 
Libras
–– 
,
–– 	
Litros
—— 
,
—— 	
Onzas
˜˜ 
}
™™ 
}šš †	
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
} þ(
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
(/ 0
decimal0 7
cantidad8 @
)@ A
{ 	
} 	
public  
ProductoMateriaPrima #
SetCostoUnitario$ 4
(4 5
decimal5 <
costo= B
)B C
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
(%%/ 0
decimal%%0 7
cantidad%%8 @
)%%@ A
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
(99# $
decimal99$ + 
porcentajeDeUtilidad99, @
)99@ A
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
}		 í,
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
(/ 0
decimal0 7
cantidad8 @
)@ A
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
(&&8 9
decimal&&9 @
costo&&A F
)&&F G
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
(,,3 4
decimal,,4 ;
cantidad,,< D
),,D E
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
(>>? @
decimal>>@ G 
porcentajeDeUtilidad>>H \
)>>\ ]
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
}PP ‘0
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
(/ 0
decimal0 7
cantidad8 @
)@ A
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
(++9 :
decimal++: A
costo++B G
)++G H
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
(114 5
decimal115 <
cantidad11= E
)11E F
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
(CC@ A
decimalCCA H 
porcentajeDeUtilidadCCI ]
)CC] ^
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
}UU ®
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
{ 
} 
}		 ÏD
„c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderConEnvoltorio.cs
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
private 
decimal 
cantidadProducida )
;) *
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
(/ 0
decimal0 7
cantidad8 @
)@ A
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
private;; 
decimal;; 
DescontarUnidades;; )
(;;) *
decimal;;* 1
cantidad;;2 :
,;;: ;
int;;< ?
verificador;;@ K
);;K L
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
(MM? @
decimalMM@ G
costoMMH M
)MMM N
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
(SS: ;
decimalSS; B
cantidadSSC K
)SSK L
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
(eeF G
decimaleeG N 
porcentajeDeUtilidadeeO c
)eec d
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
}xx à 
~c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderDetalle.cs
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
class %
ProductoParaVenderDetalle *
:+ ,
Entity- 3
<3 4
int4 7
>7 8
{ 
public		  
ProductoParaFabricar		 # 
ProductoParaFabricar		$ 8
{		9 :
get		; >
;		> ?
set		@ C
;		C D
}		E F
public

 
ProductoParaVender

 !
ProductoParaVender

" 4
{

5 6
get

7 :
;

: ;
set

< ?
;

? @
}

A B
public 
int "
ProductoParaFabricarId )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int  
ProductoParaVenderId '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Cantidad 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Costo 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public %
ProductoParaVenderDetalle (
(( ) 
ProductoParaFabricar) = 
productoParaFabricar> R
,R S
ProductoParaVender 
productoParaVender 1
)1 2
{ 	
this 
. "
ProductoParaFabricarId '
=( ) 
productoParaFabricar* >
.> ?
Id? A
;A B
this 
.  
ProductoParaVenderId %
=& '
productoParaVender( :
.: ;
Id; =
;= >
this 
. 
ProductoParaVender #
=$ %
productoParaVender& 8
;8 9
this 
.  
ProductoParaFabricar %
=& ' 
productoParaFabricar( <
;< =
} 	
public %
ProductoParaVenderDetalle (
(( )
)) *
{ 	
} 	
public 
void  
SetCantidadNecesaria (
(( )
decimal) 0
cantidad1 9
)9 :
{ 	
this 
. 
Cantidad 
= 
cantidad $
;$ %
}   	
private!! 
void!! 
ActualizarCosto!! $
(!!$ %
)!!% &
{"" 	
this## 
.## 
Costo## 
=## 
this## 
.## 
Cantidad## &
*##' ( 
ProductoParaFabricar##) =
.##= >
CostoUnitario##> K
;##K L
}$$ 	
public%% 
void%% 
DescontarUnidades%% %
(%%% &
)%%& '
{&& 	 
ProductoParaFabricar''  
.''  !
DescontarCantidad''! 2
(''2 3
this''3 7
.''7 8
Cantidad''8 @
)''@ A
;''A B
this(( 
.(( 
ActualizarCosto((  
(((  !
)((! "
;((" #
})) 	
public** 
List** 
<** 
string** 
>** "
PuedeDescontarUnidades** 2
(**2 3
)**3 4
{++ 	
return,,  
ProductoParaFabricar,, '
.,,' ("
PuedeDescontarCantidad,,( >
(,,> ?
this,,? C
.,,C D
Cantidad,,D L
),,L M
;,,M N
}-- 	
}.. 
}// Â@
„c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\EntitiesProducto\ProductoParaVenderSinEnvoltorio.cs
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
private 
decimal 
_cantidadProducida *
;* +
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
(/ 0
decimal0 7
cantidad8 @
)@ A
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
private&& 
decimal&& 
DescontarUnidades&& )
(&&) *
decimal&&* 1
cantidad&&2 :
,&&: ;
int&&< ?
verificador&&@ K
)&&K L
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
(FFA B
decimalFFB I
costoFFJ O
)FFO P
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
(LL: ;
decimalLL; B
cantidadLLC K
)LLK L
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
(^^F G
decimal^^G N 
porcentajeDeUtilidad^^O c
)^^c d
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
}pp ¼
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
}'' ®!
_c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Fabricacion.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public		 

class		 
Fabricacion		 
:		 
Entity		 %
<		% &
int		& )
>		) *
{

 
public 
TerceroEmpleado 
TerceroEmpleado .
{/ 0
get1 4
;4 5
private6 =
set> A
;A B
}C D
public 
List 
< 
FabricacionDetalle &
>& '
FabricacionDetalles( ;
{< =
get> A
;A B
privateC J
setK N
;N O
}P Q
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Cantidad 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Costo 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
DateTime6 >
.> ?
Now? B
;B C
public 
Fabricacion 
( 
) 
{ 	
this 
. 
FabricacionDetalles $
=% &
new' *
List+ /
</ 0
FabricacionDetalle0 B
>B C
(C D
)D E
;E F
} 	
public 
Fabricacion 
( 
TerceroEmpleado *
terceroEmpleado+ :
): ;
{ 	
this 
. 
TerceroEmpleado  
=! "
terceroEmpleado# 2
;2 3
this 
. 
FabricacionDetalles $
=% &
new' *
List+ /
</ 0
FabricacionDetalle0 B
>B C
(C D
)D E
;E F
} 	
public 
void 
AgregarDetalle "
(" #
FabricacionDetalle# 5
detalle6 =
)= >
{ 	
this 
. 
FabricacionDetalles $
.$ %
Add% (
(( )
detalle) 0
)0 1
;1 2
this 
. 
Costo 
+= 
detalle !
.! "
Cantidad" *
*+ ,
detalle- 4
.4 5
MateriaPrima5 A
.A B
CostoUnitarioB O
;O P
} 	
public   
void   
SetEmpleado   
(    
TerceroEmpleado    /
terceroEmpleado  0 ?
)  ? @
{!! 	
this"" 
."" 
TerceroEmpleado""  
=""! "
terceroEmpleado""# 2
;""2 3
}## 	
public$$ 
void$$ 
SetCantidad$$ 
($$  
decimal$$  '
cantidadProducida$$( 9
)$$9 :
{%% 	
this&& 
.&& 
Cantidad&& 
=&& 
cantidadProducida&& -
;&&- .
}'' 	
public)) 
void)) /
#DescontarCantidadesEnMateriasPrimas)) 7
())7 8
)))8 9
{** 	
this++ 
.++ 
FabricacionDetalles++ $
.++$ %
ForEach++% ,
(++, -
detalle++- 4
=>++5 7
{,, 
detalle-- 
.-- 
MateriaPrima-- $
.--$ %
DescontarCantidad--% 6
(--6 7
detalle--7 >
.--> ?
Cantidad--? G
)--G H
;--H I
}.. 
).. 
;.. 
}// 	
}00 
}11 ¼
fc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\FabricacionDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
FabricacionDetalle #
{ 
public 
Fabricacion 
Fabricacion &
{' (
get) ,
;, -
private. 5
set6 9
;9 :
}; <
public		 
Producto		 
MateriaPrima		 $
{		% &
get		' *
;		* +
private		, 3
set		4 7
;		7 8
}		9 :
public

 
int

 
FabricacionId

  
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
public 
int 
MateriaPrimaId !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Cantidad 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Costo 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 
FabricacionDetalle !
(! "
Fabricacion" -
fabricacion. 9
,9 :
Producto 
materiaPrima !
)! "
{ 	
this 
. 
FabricacionId 
=  
fabricacion! ,
., -
Id- /
;/ 0
this 
. 
MateriaPrimaId 
=  !
materiaPrima" .
.. /
Id/ 1
;1 2
this 
. 
Fabricacion 
= 
fabricacion *
;* +
this 
. 
MateriaPrima 
= 
materiaPrima  ,
;, -
this 
. 
Costo 
= 
materiaPrima %
.% &
CostoUnitario& 3
;3 4
} 	
public 
FabricacionDetalle !
(! "
Fabricacion" -
fabricacion. 9
,9 :
Producto 
materiaPrima !
,! "
decimal# *
cantidad+ 3
)3 4
{ 	
this 
. 
FabricacionId 
=  
fabricacion! ,
., -
Id- /
;/ 0
this 
. 
MateriaPrimaId 
=  !
materiaPrima" .
.. /
Id/ 1
;1 2
this 
. 
Fabricacion 
= 
fabricacion *
;* +
this 
. 
MateriaPrima 
= 
materiaPrima  ,
;, -
this   
.   
Cantidad   
=   
cantidad   $
;  $ %
this!! 
.!! 
Costo!! 
=!! 
materiaPrima!! %
.!!% &
CostoUnitario!!& 3
;!!3 4
}"" 	
public## 
FabricacionDetalle## !
(##! "
)##" #
{$$ 	
}%% 	
public&& 
FabricacionDetalle&& !
SetCantidad&&" -
(&&- .
decimal&&. 5
cantidad&&6 >
)&&> ?
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
}** 	
}++ 
},, ¿
dc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Contacto.cs
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
}88 ø
`c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\Role.cs
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
} µ.
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
= 
terceroBuilder +
.+ ,
	Contactos, 5
;5 6
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
}CC †%
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
public 
decimal 
GetPrecioProducto (
(( )
int) ,
id- /
)/ 0
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
}77 Â8
xc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Tercero\TerceroClientePrecioProducto.cs
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
class (
TerceroClientePrecioProducto -
:. /
Entity0 6
<6 7
int7 :
>: ;
{		 
public

 
int

 
	ClienteId

 
{

 
get

 "
;

" #
private

$ +
set

, /
;

/ 0
}

1 2
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
public 
TerceroCliente 
Cliente %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
public 
Producto 
Producto  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Precio 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Costo 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public (
TerceroClientePrecioProducto +
(+ ,
), -
{ 	
} 	
public (
TerceroClientePrecioProducto +
(+ ,/
#TerceroClientePrecioProductoBuilder, O/
#terceroClientePrecioProductoBuilderP s
)s t
{ 	
this 
. 
Cliente 
= /
#terceroClientePrecioProductoBuilder >
.> ?
Cliente? F
;F G
this 
. 
Producto 
= /
#terceroClientePrecioProductoBuilder ?
.? @
Producto@ H
;H I
this 
. 

ProductoId 
= /
#terceroClientePrecioProductoBuilder A
.A B

ProductoIdB L
;L M
this 
. 
	ClienteId 
= /
#terceroClientePrecioProductoBuilder @
.@ A
	ClienteIdA J
;J K
this 
. 
Precio 
= /
#terceroClientePrecioProductoBuilder =
.= >
Precio> D
;D E
this 
. 
Costo 
= /
#terceroClientePrecioProductoBuilder <
.< =
Producto= E
.E F
CostoUnitarioF S
;S T
} 	
public   
class   /
#TerceroClientePrecioProductoBuilder   8
{!! 	
public"" 
int"" 
	ClienteId""  
{""! "
get""# &
;""& '
private""( /
set""0 3
;""3 4
}""5 6
public## 
int## 

ProductoId## !
{##" #
get##$ '
;##' (
private##) 0
set##1 4
;##4 5
}##6 7
public$$ 
TerceroCliente$$ !
Cliente$$" )
{$$* +
get$$, /
;$$/ 0
private$$1 8
set$$9 <
;$$< =
}$$> ?
public%% 
Producto%% 
Producto%% $
{%%% &
get%%' *
;%%* +
private%%, 3
set%%4 7
;%%7 8
}%%9 :
public&& 
decimal&& 
Precio&& !
{&&" #
get&&$ '
;&&' (
private&&) 0
set&&1 4
;&&4 5
}&&6 7
public'' /
#TerceroClientePrecioProductoBuilder'' 6
(''6 7
TerceroCliente''7 E
cliente''F M
,''M N
Producto(( 
producto(( !
)((! "
{)) 
this** 
.** 
Producto** 
=** 
producto**  (
;**( )
this++ 
.++ 
Cliente++ 
=++ 
cliente++ &
;++& '
this,, 
.,, 

ProductoId,, 
=,,  !
producto,," *
.,,* +
Id,,+ -
;,,- .
this-- 
.-- 
	ClienteId-- 
=--  
cliente--! (
.--( )
Id--) +
;--+ ,
}.. 
public// /
#TerceroClientePrecioProductoBuilder// 6
	SetPrecio//7 @
(//@ A
decimal//A H
precio//I O
)//O P
{00 
this11 
.11 
Precio11 
=11 
precio11 $
;11$ %
return22 
this22 
;22 
}33 
private44 
void44 +
ValidarPrecioNoMenorAlPermitido44 8
(448 9
)449 :
{55 
if66 
(66 
this66 
.66 
Producto66 !
.66! "
Tipo66" &
!=66' )
Tipo66* .
.66. /

ParaVender66/ 9
)669 :
{77 
throw88 
new88 %
InvalidOperationException88 7
(887 8
$"888 :
El producto 88: F
"88F G
+88H I
$"99 
{99 
Producto99 #
.99# $
Nombre99$ *
}99* +
 no se puede vender99+ >
"99> ?
)99? @
;99@ A
}:: 
if;; 
(;; 
this;; 
.;; 
Precio;; 
<;;  !
Producto;;" *
.;;* +!
PrecioSugeridoDeVenta;;+ @
);;@ A
{<< 
throw== 
new== %
InvalidOperationException== 7
(==7 8
$str==8 H
+==I J
$">> 
	producto >> #
{>># $
Producto>>$ ,
.>>, -
Nombre>>- 3
}>>3 4"
 no puede ser menor al>>4 J
">>J K
+>>L M
$"??  
 precio sugerido de ?? .
{??. /
Producto??/ 7
.??7 8!
PrecioSugeridoDeVenta??8 M
}??M N
"??N O
)??O P
;??P Q
}@@ 
}BB 
publicCC (
TerceroClientePrecioProductoCC /
BuildCC0 5
(CC5 6
)CC6 7
{DD +
ValidarPrecioNoMenorAlPermitidoEE /
(EE/ 0
)EE0 1
;EE1 2(
TerceroClientePrecioProductoFF ,
precioProductoFF- ;
=FF< =
newFF> A(
TerceroClientePrecioProductoGG 0
(GG0 1
thisGG1 5
)GG5 6
;GG6 7
returnHH 
precioProductoHH %
;HH% &
}II 
}JJ 	
}KK 
}LL Õ
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
} Ó
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
} „&
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
}@@ ·
_c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Transaccion.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Transaccion 
: 
Entity %
<% &
int& )
>) *
{		 
[

 	
Column

	 
(

 
TypeName

 
=

 
$str

 (
)

( )
]

) *
public 
decimal 
Monto 
{ 
get "
;" #
set$ '
;' (
}) *
public 
TipoDeTransaccion  
TipoDeTransaccion! 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
Concepto 
Concepto  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
Fecha 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
DateTime. 6
.6 7
Now7 :
;: ;
public 
Transaccion 
( 
) 
{ 	
} 	
public 
Transaccion 
( 
TipoDeTransaccion ,
tipoDeTransaccion- >
,> ?
Concepto@ H
conceptoI Q
,Q R
decimal 
monto 
) 
{ 	
this 
. 
TipoDeTransaccion "
=# $
tipoDeTransaccion% 6
;6 7
this 
. 
Concepto 
= 
concepto $
;$ %
this 
. 
Monto 
= 
monto 
; 
} 	
} 
public 

enum 
TipoDeTransaccion !
{ 
Egreso 
, 
Ingreso 
}   
public!! 

enum!! 
Concepto!! 
{"" 
PagoDeServicios## 
,## 
VentaDeProductos$$ 
,$$ "
CompraDeMateriasPrimas%% 
}&& 
}'' —P
Yc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\Venta.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public		 

class		 
Venta		 
:		 
Entity		 
<		  
int		  #
>		# $
{

 
public 
TerceroUsuario 
Usuario %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
public 
TerceroCliente 
Cliente %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
public 
List 
< 

VentaAbono 
> 
Abonos  &
{' (
get) ,
;, -
private. 5
set6 9
;9 :
}; <
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Total 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
	Pendiente  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Pagado 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
	Descuento  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
	TotalReal  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Utilidad 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 
decimal 
UtilidadReal #
{$ %
get& )
=>* ,
Utilidad- 5
-6 7
	Descuento8 A
;A B
}C D
public 
Estado 
Estado 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
=3 4
Estado5 ;
.; <
	Pendiente< E
;E F
public 
DateTime 
Fecha 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
public 
List 
< 
VentaDetalle  
>  !
VentaDetalles" /
{0 1
get2 5
;5 6
private7 >
set? B
;B C
}D E
public 
List 
< 

Devolucion 
> 
Devoluciones  ,
{- .
get/ 2
;2 3
private4 ;
set< ?
;? @
}A B
public 
Venta 
( 
) 
{   	
this!! 
.!! 
VentaDetalles!! 
=!!  
new!!! $
List!!% )
<!!) *
VentaDetalle!!* 6
>!!6 7
(!!7 8
)!!8 9
;!!9 :
this"" 
."" 
Devoluciones"" 
="" 
new""  #
List""$ (
<""( )

Devolucion"") 3
>""3 4
(""4 5
)""5 6
;""6 7
this## 
.## 
Abonos## 
=## 
new## 
List## "
<##" #

VentaAbono### -
>##- .
(##. /
)##/ 0
;##0 1
this$$ 
.$$ 
Fecha$$ 
=$$ 
DateTime$$ !
.$$! "
Now$$" %
;$$% &
}%% 	
public'' 
Venta'' 
('' 
VentaBuilder'' !
ventaBuilder''" .
)''. /
{(( 	
this)) 
.)) 
VentaDetalles)) 
=))  
new))! $
List))% )
<))) *
VentaDetalle))* 6
>))6 7
())7 8
)))8 9
;))9 :
this** 
.** 
Devoluciones** 
=** 
new**  #
List**$ (
<**( )

Devolucion**) 3
>**3 4
(**4 5
)**5 6
;**6 7
this++ 
.++ 
Abonos++ 
=++ 
new++ 
List++ "
<++" #

VentaAbono++# -
>++- .
(++. /
)++/ 0
;++0 1
this,, 
.,, 
Usuario,, 
=,, 
ventaBuilder,, '
.,,' (
Usuario,,( /
;,,/ 0
this-- 
.-- 
Cliente-- 
=-- 
ventaBuilder-- '
.--' (
Cliente--( /
;--/ 0
this.. 
... 
Fecha.. 
=.. 
DateTime.. !
...! "
Now.." %
;..% &
}// 	
public00 
void00 
SetDescuento00  
(00  !
decimal00! (
	descuento00) 2
)002 3
{11 	
if22 
(22 
Utilidad22 
*22 
$num22  
<22! "
	descuento22# ,
)22, -
{33 
throw44 
new44 %
InvalidOperationException44 3
(443 4
$str444 N
)44N O
;44O P
}55 
this66 
.66 
	Descuento66 
=66 
	descuento66 &
;66& '
this77 
.77 
	TotalReal77 
-=77 
	descuento77 '
;77' (
this88 
.88 
	Pendiente88 
-=88 
	descuento88 '
;88' (
}99 	
public:: 
void:: 
AgregarDetalle:: "
(::" #
VentaDetalle::# /
detalle::0 7
)::7 8
{;; 	
this<< 
.<< 
VentaDetalles<< 
.<< 
Add<< "
(<<" #
detalle<<# *
)<<* +
;<<+ ,
this== 
.== 
Total== 
+=== 
detalle== !
.==! "

ValorTotal==" ,
;==, -
this>> 
.>> 
	TotalReal>> 
+=>> 
detalle>> %
.>>% &

ValorTotal>>& 0
;>>0 1
this?? 
.?? 
Utilidad?? 
+=?? 
detalle?? $
.??$ %
Utilidad??% -
;??- .
this@@ 
.@@ 
	Pendiente@@ 
+=@@ 
detalle@@ %
.@@% &

ValorTotal@@& 0
;@@0 1
}AA 	
publicBB 
voidBB 
AgregarAbonoBB  
(BB  !

VentaAbonoBB! +
abonoBB, 1
)BB1 2
{CC 	
thisDD 
.DD 
AbonosDD 
.DD 
AddDD 
(DD 
abonoDD !
)DD! "
;DD" #
thisEE 
.EE 
PagadoEE 
+=EE 
abonoEE  
.EE  !
ValorEE! &
;EE& '
thisFF 
.FF 
	PendienteFF 
-=FF 
abonoFF #
.FF# $
ValorFF$ )
;FF) * 
CambiarEstadoDeVentaGG  
(GG  !
)GG! "
;GG" #
}HH 	
privateII 
voidII  
CambiarEstadoDeVentaII )
(II) *
)II* +
{JJ 	
ifKK 
(KK 
thisKK 
.KK 
PagadoKK 
==KK 
thisKK #
.KK# $
	TotalRealKK$ -
)KK- .
{LL 
thisMM 
.MM 
EstadoMM 
=MM 
EstadoMM $
.MM$ %
PagadoMM% +
;MM+ ,
}NN 
}OO 	
publicQQ 
classQQ 
VentaBuilderQQ !
{RR 	
publicSS 
TerceroUsuarioSS !
UsuarioSS" )
{SS* +
getSS, /
;SS/ 0
privateSS1 8
setSS9 <
;SS< =
}SS> ?
publicTT 
TerceroClienteTT !
ClienteTT" )
{TT* +
getTT, /
;TT/ 0
privateTT1 8
setTT9 <
;TT< =
}TT> ?
publicUU 
VentaBuilderUU 
(UU  
TerceroUsuarioUU  .
usuarioUU/ 6
,UU6 7
TerceroClienteUU8 F
clienteUUG N
)UUN O
{VV 
thisWW 
.WW 
UsuarioWW 
=WW 
usuarioWW &
;WW& '
thisXX 
.XX 
ClienteXX 
=XX 
clienteXX &
;XX& '
}YY 
publicZZ 
VentaZZ 
BuildZZ 
(ZZ 
)ZZ  
{[[ 
Venta\\ 
venta\\ 
=\\ 
new\\ !
Venta\\" '
(\\' (
this\\( ,
)\\, -
;\\- .
return]] 
venta]] 
;]] 
}^^ 
}__ 	
}`` 
publicaa 

enumaa 
Estadoaa 
{bb 
	Pendientecc 
,cc 
Pagadodd 
,dd 
Anuladoee 
}ff 
}gg ¦
^c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\VentaAbono.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 

VentaAbono 
: 
Entity $
<$ %
int% (
>( )
{ 
[		 	
Column			 
(		 
TypeName		 
=		 
$str		 )
)		) *
]		* +
public

 
decimal

 
Valor

 
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
public 
Venta 
Venta 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 

FechaAbono "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 

VentaAbono 
( 
VentaAbonoBuilder +
ventaAbonoBuilder, =
)= >
{ 	
this 
. 
Valor 
= 
ventaAbonoBuilder *
.* +
Valor+ 0
;0 1
this 
. 
Venta 
= 
ventaAbonoBuilder *
.* +
Venta+ 0
;0 1
this 
. 

FechaAbono 
= 
DateTime &
.& '
Now' *
;* +
} 	
private 

VentaAbono 
( 
) 
{ 	
} 	
public 
class 
VentaAbonoBuilder &
{ 	
public 
decimal 
Valor  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
public 
Venta 
Venta 
{  
get! $
;$ %
private& -
set. 1
;1 2
}3 4
public 
VentaAbonoBuilder $
($ %
Venta% *
venta+ 0
,0 1
decimal2 9
valor: ?
)? @
{ 
this 
. 
Venta 
= 
venta "
;" #
this 
. 
Valor 
= 
valor "
;" #
} 
public   

VentaAbono   
Build   #
(  # $
)  $ %
{!!  
ValidarValorDelAbono"" $
(""$ %
)""% &
;""& '

VentaAbono## 
abono##  
=##! "
new### &

VentaAbono##' 1
(##1 2
this##2 6
)##6 7
;##7 8
return$$ 
abono$$ 
;$$ 
}%% 
private'' 
void''  
ValidarValorDelAbono'' -
(''- .
)''. /
{(( 
if)) 
()) 
Valor)) 
>)) 
Venta)) !
.))! "
	Pendiente))" +
)))+ ,
{** 
throw++ 
new++ %
InvalidOperationException++ 7
(++7 8
$"++8 :!
El valor a abonar es ++: O
"++O P
+++Q R
$",, %
superior al pendiente de ,, 3
{,,3 4
Venta,,4 9
.,,9 :
	Pendiente,,: C
},,C D
",,D E
),,E F
;,,F G
}-- 
if.. 
(.. 
Valor.. 
<.. 
$num.. 
).. 
{// 
throw00 
new00 %
InvalidOperationException00 7
(007 8
$str008 W
)00W X
;00X Y
}11 
}22 
}33 	
}44 
}55 ˜P
`c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Entities\VentaDetalle.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public		 

class		 
VentaDetalle		 
:		 

BaseEntity		  *
{

 
public 
int 
VentaId 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
int 

ProductoId 
{ 
get  #
;# $
private% ,
set- 0
;0 1
}2 3
public 
Venta 
Venta 
{ 
get  
;  !
private" )
set* -
;- .
}/ 0
public 
Producto 
Producto  
{! "
get# &
;& '
private( /
set0 3
;3 4
}5 6
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
Cantidad 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
PrecioUnitario %
{& '
get( +
;+ ,
private- 4
set5 8
;8 9
}: ;
[ 	
Column	 
( 
TypeName 
= 
$str )
)) *
]* +
public 
decimal 
CostoUnitario $
{% &
get' *
;* +
private, 3
set4 7
;7 8
}9 :
public 
decimal 

ValorTotal !
{" #
get$ '
=>( *
PrecioUnitario+ 9
*: ;
Cantidad< D
;D E
}F G
public 
decimal 

CostoTotal !
{" #
get$ '
=>( *
CostoUnitario+ 8
*9 :
Cantidad; C
;C D
}E F
public 
decimal 
Utilidad 
{  !
get" %
=>& (

ValorTotal) 3
-4 5

CostoTotal6 @
;@ A
}B C
private 
VentaDetalle 
( 
) 
{ 	
} 	
public 
VentaDetalle 
( 
VentaDetalleBuilder /
ventaDetalleBuilder0 C
)C D
{ 	

ProductoId 
= 
ventaDetalleBuilder ,
., -

ProductoId- 7
;7 8
Producto   
=   
ventaDetalleBuilder   *
.  * +
Producto  + 3
;  3 4
Venta!! 
=!! 
ventaDetalleBuilder!! '
.!!' (
Venta!!( -
;!!- .
VentaId"" 
="" 
ventaDetalleBuilder"" )
."") *
VentaId""* 1
;""1 2
Cantidad## 
=## 
ventaDetalleBuilder## *
.##* +
Cantidad##+ 3
;##3 4
PrecioUnitario$$ 
=$$ 
ventaDetalleBuilder$$ 0
.$$0 1
ValorUnitario$$1 >
;$$> ?
CostoUnitario%% 
=%% 
ventaDetalleBuilder%% /
.%%/ 0
CostoUnitario%%0 =
;%%= >
}&& 	
public(( 
class(( 
VentaDetalleBuilder(( (
{)) 	
public** 
int** 
VentaId** 
{**  
get**! $
;**$ %
private**& -
set**. 1
;**1 2
}**3 4
public++ 
int++ 

ProductoId++ !
{++" #
get++$ '
;++' (
private++) 0
set++1 4
;++4 5
}++6 7
public,, 
Venta,, 
Venta,, 
{,,  
get,,! $
;,,$ %
private,,& -
set,,. 1
;,,1 2
},,3 4
public-- 
Producto-- 
Producto-- $
{--% &
get--' *
;--* +
private--, 3
set--4 7
;--7 8
}--9 :
public.. 
decimal.. 
Cantidad.. #
{..$ %
get..& )
;..) *
private..+ 2
set..3 6
;..6 7
}..8 9
public// 
decimal// 
CostoUnitario// (
{//) *
get//+ .
;//. /
private//0 7
set//8 ;
;//; <
}//= >
public00 
decimal00 
ValorUnitario00 (
{00) *
get00+ .
;00. /
private000 7
set008 ;
;00; <
}00= >
public11 
VentaDetalleBuilder11 &
(11& '
Venta11' ,
venta11- 2
,112 3
Producto114 <
producto11= E
)11E F
{22 
Venta33 
=33 
venta33 
;33 
Producto44 
=44 
producto44 #
;44# $
VentaId55 
=55 
venta55 
.55  
Id55  "
;55" #

ProductoId66 
=66 
producto66 %
.66% &
Id66& (
;66( )
CostoUnitario77 
=77 
producto77  (
.77( )
CostoUnitario77) 6
;776 7
}88 
public99 
VentaDetalleBuilder99 &
SetValor99' /
(99/ 0
decimal990 7
precio998 >
)99> ?
{:: 
ValorUnitario;; 
=;; 
precio;;  &
;;;& '
return<< 
this<< 
;<< 
}== 
public>> 
VentaDetalleBuilder>> &
SetCantidad>>' 2
(>>2 3
decimal>>3 :
cantidad>>; C
)>>C D
{?? 
Cantidad@@ 
=@@ 
cantidad@@ #
;@@# $
returnAA 
thisAA 
;AA 
}BB 
privateCC 
voidCC 0
$ValidarQueElProductoTengaExistenciasCC =
(CC= >
)CC> ?
{DD 
ifEE 
(EE 
ProductoEE 
.EE "
PuedeDescontarCantidadEE 3
(EE3 4
thisEE4 8
.EE8 9
CantidadEE9 A
)EEA B
.EEB C
AnyEEC F
(EEF G
)EEG H
)EEH I
{FF 
throwGG 
newGG %
InvalidOperationExceptionGG 7
(GG7 8
$"GG8 :
El producto GG: F
{GGF G
ProductoGGG O
.GGO P
NombreGGP V
}GGV W
 no GGW [
"GG[ \
+GG] ^
$"HH 6
*tiene existencias suficientes, solo tiene HH D
{HHD E
ProductoHHE M
.HHM N
CantidadHHN V
}HHV W
"HHX Y
+HHZ [
$"II 
{II 
ProductoII #
.II# $
UnidadDeMedidaII$ 2
.II2 3
ToStringII3 ;
(II; <
)II< =
}II= >
"II> ?
)II? @
;II@ A
}JJ 
}KK 
privateLL 
voidLL *
ValidarValorNoMenorAlPermitidoLL 7
(LL7 8
)LL8 9
{MM 
decimalNN 
precioNN 
=NN  
VentaNN! &
.NN& '
ClienteNN' .
.NN. /
GetPrecioProductoNN/ @
(NN@ A

ProductoIdNNA K
)NNK L
;NNL M
ifOO 
(OO 
precioOO 
==OO 
$numOO 
)OO  
{PP 
precioQQ 
=QQ 
ProductoQQ %
.QQ% &!
PrecioSugeridoDeVentaQQ& ;
;QQ; <
}RR 
ifSS 
(SS 
ValorUnitarioSS !
<SS" #
precioSS$ *
)SS* +
{TT 
throwUU 
newUU %
InvalidOperationExceptionUU 7
(UU7 8
$"UU8 :
El precio del UU: H
"UUH I
+UUJ K
$"VV 
	producto VV #
{VV# $
ProductoVV$ ,
.VV, -
NombreVV- 3
}VV3 4&
 es muy bajo, por lo menosVV4 N
"VVN O
+VVP Q
$"WW 
debe ser de WW &
{WW& '
precioWW' -
}WW- .
"WW. /
)WW/ 0
;WW0 1
}XX 
}YY 
privateZZ 
voidZZ -
!ValidarQueElProductoSeaParaVenderZZ :
(ZZ: ;
)ZZ; <
{[[ 
if\\ 
(\\ 
Producto\\ 
.\\ 
Tipo\\ !
!=\\" $
Tipo\\% )
.\\) *

ParaVender\\* 4
)\\4 5
{]] 
throw^^ 
new^^ %
InvalidOperationException^^ 7
(^^7 8
$"^^8 :
El producto ^^: F
{^^F G
Producto^^G O
.^^O P
Nombre^^P V
}^^V W
"^^X Y
+^^Z [
$"__ -
!no se puede vender, es solo para __ ;
{__; <
Producto__< D
.__D E
Tipo__E I
.__I J
ToString__J R
(__R S
)__S T
}__T U
"__U V
)__V W
;__W X
}`` 
}aa 
publicbb 
VentaDetallebb 
Buildbb  %
(bb% &
)bb& '
{cc -
!ValidarQueElProductoSeaParaVenderdd 1
(dd1 2
)dd2 3
;dd3 4*
ValidarValorNoMenorAlPermitidoee .
(ee. /
)ee/ 0
;ee0 10
$ValidarQueElProductoTengaExistenciasff 4
(ff4 5
)ff5 6
;ff6 7
VentaDetallegg 
detallegg $
=gg% &
newgg' *
VentaDetallegg+ 7
(gg7 8
thisgg8 <
)gg< =
;gg= >
returnhh 
detallehh 
;hh 
}ii 
}jj 	
}kk 
}ll Ã
sc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\AbstractFactory\IProductoFactory.cs
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
} 
€c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaFabricarFactory.cs
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
La especificaciÃ³n , >
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
} Î
~c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoParaVenderFactory.cs
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
La especificaciÃ³n   2
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
} ²

…c:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Factory\ConcreteFactories\ProductoSinEspecificacionFactory.cs
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
La especificaciÃ³n 2 D
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
lc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ICategoriaRepository.cs
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
  
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
}		 ¦
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
 š
gc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\IRoleRepository.cs
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
 º
oc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ISubCategoriaRepository.cs
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
}		 ¸
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
 »
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
}		 ¼
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
}		 ¸
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
}		 ¯
nc:\Users\duvan\source\repos\CompositePruebaDulces\CompositePruebaDulces\Repositories\ITransaccionRepository.cs
	namespace 	
Domain
 
. 
Repositories 
{ 
public 

	interface "
ITransaccionRepository +
:, -
IGenericRepository. @
<@ A
TransaccionA L
>L M
{ 
}		 
}

 Û
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
(> ?
decimal? F
cantidadG O
,O P
decimal 
costoUnitario !
,! "
decimal# * 
porcentajeDeUtilidad+ ?
=? @
$num@ A
)A B
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
} À
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
,P Q
decimalR Y
cantidadADescontarZ l
)l m
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