Ì
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
} ¡
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
} á!
^C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\CompraDetallesRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 
class  
CompraDetalleRequest "
{ 
public 
double	 
Valor 
{ 
get 
; 
set  
;  !
}" #
public 
double	 
Cantidad 
{ 
get 
; 
set  #
;# $
}% &
public		 
int			 

ProductoId		 
{		 
get		 
;		 
set		 "
;		" #
}		$ %
public

  
CompraDetalleRequest

	 
(

 
)

 
{ 
} 
public  
CompraDetalleRequest	 
( '
CompraDetalleRequestBuilder 9'
compraDetalleRequestBuilder: U
)U V
{ 
this 
. 
Cantidad 
= '
compraDetalleRequestBuilder .
.. /
Cantidad/ 7
;7 8
this 
. 
Valor 
= '
compraDetalleRequestBuilder +
.+ ,
Valor, 1
;1 2
this 
. 

ProductoId 
= '
compraDetalleRequestBuilder 0
.0 1

ProductoId1 ;
;; <
} 
public  
CompraDetalleRequest	 
Map !
(! "
CompraDetalle" /
detalle0 7
)7 8
{ 
this 
. 
Valor 
= 
detalle 
. 
Valor 
; 
this 
. 
Cantidad 
= 
detalle 
. 
Cantidad #
;# $
this 
. 

ProductoId 
= 
detalle 
. 
Producto %
.% &
Id& (
;( )
return 	
this
 
; 
} 
public 
class	 '
CompraDetalleRequestBuilder *
{ 
public 	
double
 
Valor 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public   	
double  
 
Cantidad   
{   
get   
;    
private  ! (
set  ) ,
;  , -
}  . /
public!! 	
int!!
 

ProductoId!! 
{!! 
get!! 
;!! 
private!!  '
set!!( +
;!!+ ,
}!!- .
public"" 	'
CompraDetalleRequestBuilder""
 %
(""% &
int""& )
producto""* 2
)""2 3
{## 
this$$ 
.$$ 	

ProductoId$$	 
=$$ 
producto$$ 
;$$ 
}%% 
public&& 	'
CompraDetalleRequestBuilder&&
 %
SetValor&&& .
(&&. /
double&&/ 5
valor&&6 ;
)&&; <
{'' 
this(( 
.(( 	
Valor((	 
=(( 
valor(( 
;(( 
return)) 

this)) 
;)) 
}** 
public++ 	'
CompraDetalleRequestBuilder++
 %
SetCantidad++& 1
(++1 2
double++2 8
cantidad++9 A
)++A B
{,, 
this-- 
.-- 	
Cantidad--	 
=-- 
cantidad-- 
;-- 
return.. 

this.. 
;.. 
}// 
public00 	 
CompraDetalleRequest00
 
Build00 $
(00$ %
)00% &
{11  
CompraDetalleRequest22 
compraDetalle22 &
=22' (
new22) , 
CompraDetalleRequest22- A
(22A B
this22B F
)22F G
;22G H
return33 

compraDetalle33 
;33 
}44 
}55 
}66 
}77 Ê2
VC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\CompraRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 
class 
CompraRequest 
: 
Request %
<% &
int& )
>) *
{		 
public

 
string

	 
NitProveedor

 
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
public #
TerceroProveedorRequest	  
	Proveedor! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
int	 
	UsuarioId 
{ 
get 
; 
set !
;! "
}# $
public 
double	 
Total 
{ 
get 
; 
set  
;  !
}" #
public 
DateTime	 
Fecha 
{ 
get 
; 
set "
;" #
}$ %
public 
List	 
<  
CompraDetalleRequest "
>" #
Detalles$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
CompraRequest	 
( 
) 
{ 
Detalles 
= 
new 
List 
<  
CompraDetalleRequest +
>+ ,
(, -
)- .
;. /
} 
public 
CompraRequest	 
(  
CompraRequestBuilder +
builder, 3
)3 4
{ 
this 
. 
	UsuarioId 
= 
builder 
. 
	UsuarioId %
;% &
this 
. 
NitProveedor 
= 
builder 
. 
NitProvedor *
;* +
this 
. 
Fecha 
= 
builder 
. 
Fecha 
; 
this 
. 
Detalles 
= 
builder 
. 
Detalles #
;# $
} 
public 
CompraRequest	 
Map 
( 
Compra !
compra" (
)( )
{ 
this 
. 
Id 

= 
compra 
. 
Id 
; 
if   
(   
compra   
.   
	Proveedor   
!=   
null   
)    
{!! 
this"" 
."" 	
NitProveedor""	 
="" 
compra"" 
."" 
	Proveedor"" (
.""( )
Tercero"") 0
.""0 1
Nit""1 4
;""4 5
}$$ 
if%% 
(%% 
compra%% 
.%% 
Usuario%% 
!=%% 
null%% 
)%% 
{&& 
this'' 
.'' 	
	UsuarioId''	 
='' 
compra'' 
.'' 
Usuario'' #
.''# $
Id''$ &
;''& '
})) 
this** 
.** 
Total** 
=** 
compra** 
.** 
Total** 
;** 
this++ 
.++ 
Fecha++ 
=++ 
compra++ 
.++ 
Fecha++ 
;++ 
compra,, 	
.,,	 

DetallesCompra,,
 
.,, 
ForEach,,  
(,,  !
(,,! "
detalle,," )
),,) *
=>,,+ -
{-- 
this.. 
... 	
Detalles..	 
... 
Add.. 
(.. 
new..  
CompraDetalleRequest.. .
(... /
)../ 0
...0 1
Map..1 4
(..4 5
detalle..5 <
)..< =
)..= >
;..> ?
}// 
)// 
;// 
return00 	
this00
 
;00 
}11 
public22 
class22	  
CompraRequestBuilder22 #
{33 
public44 	
string44
 
NitProvedor44 
{44 
get44 "
;44" #
private44$ +
set44, /
;44/ 0
}441 2
public55 	
int55
 
	UsuarioId55 
{55 
get55 
;55 
private55 &
set55' *
;55* +
}55, -
public66 	
DateTime66
 
Fecha66 
{66 
get66 
;66 
private66  '
set66( +
;66+ ,
}66- .
public77 	
List77
 
<77  
CompraDetalleRequest77 #
>77# $
Detalles77% -
{77. /
get770 3
;773 4
private775 <
set77= @
;77@ A
}77B C
public88 	 
CompraRequestBuilder88
 
(88 
string88 %
nitProvedor88& 1
,881 2
int883 6
	usuarioId887 @
)88@ A
{99 
this:: 
.:: 	
NitProvedor::	 
=:: 
nitProvedor:: "
;::" #
this;; 
.;; 	
	UsuarioId;;	 
=;; 
	usuarioId;; 
;;; 
this<< 
.<< 	
Fecha<<	 
=<< 
DateTime<< 
.<< 
Now<< 
;<< 
}== 
public>> 	 
CompraRequestBuilder>>
 
SetDetalles>> *
(>>* +
List>>+ /
<>>/ 0 
CompraDetalleRequest>>0 D
>>>D E
compraDetalles>>F T
)>>T U
{?? 
this@@ 
.@@ 	
Detalles@@	 
=@@ 
compraDetalles@@ "
;@@" #
returnAA 

thisAA 
;AA 
}BB 
publicCC 	
CompraRequestCC
 
BuildCC 
(CC 
)CC 
{DD 
CompraRequestEE 
compraEE 
=EE 
newEE 
CompraRequestEE ,
(EE, -
thisEE- 1
)EE1 2
;EE2 3
returnFF 

compraFF 
;FF 
}GG 
}HH 
}II 
}JJ Ï'
bC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\FabricacionDetalleRequest.cs
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
}EE ª(
[C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\FabricacionRequest.cs
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
public "
TerceroEmpleadoRequest %
TerceroEmpleado& 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
int 

IdProducto 
{ 
get  #
;# $
set% (
;( )
}* +
public 
double !
CantidadDeFabricacion +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
double 
CostoDeFabricacion (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
Especificacion 
Especificacion ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< %
FabricacionDetalleRequest -
>- .
Detalles/ 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
FabricacionRequest !
(! "
string" (
nitEmpleado) 4
,4 5
int5 8

IdProducto9 C
,C D
double 
cantidad 
, 
double #
costo$ )
,) *
Especificacion+ 9
especificacion: H
,H I
List 
< %
FabricacionDetalleRequest *
>* +&
fabricacionDetallesRequest, F
)F G
{ 	
this 
. 

IdProducto 
= 

IdProducto (
;( )
NitEmpleado 
= 
nitEmpleado %
;% &!
CantidadDeFabricacion !
=" #
cantidad$ ,
;, -
CostoDeFabricacion 
=  
costo! &
;& '
Especificacion 
= 
especificacion +
;+ ,
Detalles 
= &
fabricacionDetallesRequest 1
;1 2
} 	
public 
FabricacionRequest !
(! "
)" #
{   	
this!! 
.!! 
Detalles!! 
=!! 
new!! 
List!!  $
<!!$ %%
FabricacionDetalleRequest!!% >
>!!> ?
(!!? @
)!!@ A
;!!A B
}"" 	
public## 
FabricacionRequest## !
Map##" %
(##% &
Fabricacion##& 1
fabricacion##2 =
)##= >
{$$ 	
this%% 
.%% 
Id%% 
=%% 
fabricacion%% !
.%%! "
Id%%" $
;%%$ %
NitEmpleado&& 
=&& 
fabricacion&& %
.&&% &
TerceroEmpleado&&& 5
.&&5 6
Tercero&&6 =
.&&= >
Nit&&> A
;&&A B!
CantidadDeFabricacion'' !
=''" #
fabricacion''$ /
.''/ 0
Cantidad''0 8
;''8 9
CostoDeFabricacion(( 
=((  
fabricacion((! ,
.((, -
Costo((- 2
;((2 3
this)) 
.)) 
FechaCreacion)) 
=))  
fabricacion))! ,
.)), -
FechaCreacion))- :
;)): ;
this** 
.** 
TerceroEmpleado**  
=**! "
new**# &"
TerceroEmpleadoRequest**' =
(**= >
)**> ?
.**? @
Map**@ C
(**C D
fabricacion**D O
.**O P
TerceroEmpleado**P _
)**_ `
;**` a
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
.// 
Detalles// !
.//! "
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
}66 ˚
ZC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\PaginationRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class 
PaginationRequest "
{ 
public 
int 
Page 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
Rows 
{ 
get 
; 
set "
;" #
}$ %
private 
string 
_termSearch "
;" #
public		 
string		 

TermSearch		  
{		! "
get		# &
=>		' )
_termSearch		* 5
;		5 6
set		7 :
=>		; =
_termSearch		> I
=		J K
value		L Q
.		Q R
ToUpper		R Y
(		Y Z
)		Z [
;		[ \
}		] ^
}

 
} ∆%
aC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\ProductoCategoriaRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 

class $
ProductoCategoriaRequest )
:* +
Request, 3
<3 4
int4 7
>7 8
{		 
private

 
string

 
_nombreCategoria

 '
;

' (
public 
string 
NombreCategoria %
{& '
get( +
=>+ -
_nombreCategoria. >
;> ?
set@ C
=>D F
_nombreCategoriaG W
=X Y
valueZ _
._ `
ToUpper` g
(g h
)h i
;i j
}k l
public 
List 
< '
ProductoSubCategoriaRequest /
>/ 0
SubCategorias1 >
{? @
getA D
;D E
setF I
;I J
}K L
public $
ProductoCategoriaRequest '
(' (+
ProductoCategoriaRequestBuilder( G+
productoCategoriaRequestBuilderH g
)g h
{ 	
this 
. 
SubCategorias 
=  
new! $
List% )
<) *'
ProductoSubCategoriaRequest* E
>E F
(F G
)G H
;H I
this 
. 
NombreCategoria  
=! "+
productoCategoriaRequestBuilder# B
.B C
NombreC I
;I J
this 
. 
Id 
= +
productoCategoriaRequestBuilder 5
.5 6
Id6 8
;8 9
} 	
public $
ProductoCategoriaRequest '
(' (
)( )
{ 	
this 
. 
SubCategorias 
=  
new! $
List% )
<) *'
ProductoSubCategoriaRequest* E
>E F
(F G
)G H
;H I
} 	
public $
ProductoCategoriaRequest '
Map( +
(+ ,
ProductoCategoria, =
	categoria> G
)G H
{ 	
this 
. 
Id 
= 
	categoria 
.  
Id  "
;" #
this 
. 
NombreCategoria  
=! "
	categoria# ,
., -
Nombre- 3
;3 4
if 
( 
	categoria 
. 
SubCategorias '
!=( *
null+ /
)/ 0
{ 
	categoria 
. 
SubCategorias '
.' (
ForEach( /
(/ 0
	categoria0 9
=>: <
this= A
.A B
SubCategoriasB O
. 
Add 
( 
new '
ProductoSubCategoriaRequest 4
(4 5
)5 6
.6 7
Map7 :
(: ;
	categoria; D
)D E
)E F
)F G
;G H
} 
return   
this   
;   
}!! 	
public## 
class## +
ProductoCategoriaRequestBuilder## 4
{$$ 	
public%% 
int%% 
Id%% 
{%% 
get%% 
;%%  
private%%! (
set%%) ,
;%%, -
}%%. /
public&& 
string&& 
Nombre&&  
{&&! "
get&&# &
;&&& '
private&&( /
set&&0 3
;&&3 4
}&&5 6
public'' +
ProductoCategoriaRequestBuilder'' 2
(''2 3
string''3 9
nombre'': @
)''@ A
{(( 
this)) 
.)) 
Nombre)) 
=)) 
nombre)) $
;))$ %
}** 
public++ +
ProductoCategoriaRequestBuilder++ 2
SetId++3 8
(++8 9
int++9 <
id++= ?
)++? @
{,, 
this-- 
.-- 
Id-- 
=-- 
id-- 
;-- 
return.. 
this.. 
;.. 
}// 
public00 $
ProductoCategoriaRequest00 +
Build00, 1
(001 2
)002 3
{11 $
ProductoCategoriaRequest22 (
categoriaRequest22) 9
=22: ;
new22< ?$
ProductoCategoriaRequest22@ X
(22X Y
this22Y ]
)22] ^
;22^ _
return33 
categoriaRequest33 '
;33' (
}44 
}55 	
}66 
}77 új
XC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\ProductoRequest.cs
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
>& '
Fabricaciones( 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
IdSubCategoria !
{" #
get$ '
;' (
set) ,
;, -
}. /
public '
ProductoSubCategoriaRequest * 
SubCategoriaProducto+ ?
{@ A
getB E
;E F
setG J
;J K
}L M
public 
ProductoRequest 

Emboltorio )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
int 
IdEmboltorio 
{  !
get" %
;% &
set' *
;* +
}, -
public   
ProductoRequest   
(   
)    
{!! 	
Fabricaciones"" 
="" 
new"" 
List""  $
<""$ %
FabricacionRequest""% 7
>""7 8
(""8 9
)""9 :
;"": ;
}## 	
public%% 
ProductoRequest%% 
(%% "
ProductoRequestBuilder%% 5"
productoRequestBuilder%%6 L
)%%L M
{&& 	
this'' 
.'' 
Id'' 
='' "
productoRequestBuilder'' ,
.'', -
Id''- /
;''/ 0
this(( 
.(( 
CantidadProducto(( !
=((" #"
productoRequestBuilder(($ :
.((: ;
CantidadProducto((; K
;((K L
this)) 
.)) 
Especificacion)) 
=))  !"
productoRequestBuilder))" 8
.))8 9
Especificacion))9 G
;))G H
this** 
.** 
Tipo** 
=** "
productoRequestBuilder** .
.**. /
Tipo**/ 3
;**3 4
this++ 
.++ !
CostoUnitarioProducto++ &
=++' ("
productoRequestBuilder++) ?
.++? @!
CostoUnitarioProducto++@ U
;++U V
this,, 
.,, 
FechaCreacion,, 
=,,  "
productoRequestBuilder,,! 7
.,,7 8
FechaCreacion,,8 E
;,,E F
this-- 
.-- 
NombreProducto-- 
=--  !"
productoRequestBuilder--" 8
.--8 9
NombreProducto--9 G
;--G H
this.. 
... (
PorcentajeDeUtilidadProducto.. -
=... /"
productoRequestBuilder..0 F
...F G(
PorcentajeDeUtilidadProducto..G c
;..c d
this// 
.// 
IdSubCategoria// 
=//  !"
productoRequestBuilder//" 8
.//8 9
IdSubCategoria//9 G
;//G H
Fabricaciones00 
=00 
new00 
List00  $
<00$ %
FabricacionRequest00% 7
>007 8
(008 9
)009 :
;00: ;
}11 	
public33 
ProductoRequest33 
Map33 "
(33" #
Producto33# +
producto33, 4
)334 5
{44 	
this55 
.55 
Id55 
=55 
producto55 
.55 
Id55 !
;55! "
Especificacion66 
=66 
producto66 %
.66% &
Especificacion66& 4
;664 5
Tipo77 
=77 
producto77 
.77 
Tipo77  
;77  !
NombreProducto88 
=88 
producto88 %
.88% &
Nombre88& ,
;88, -
CantidadProducto99 
=99 
producto99 '
.99' (
Cantidad99( 0
;990 1!
CostoUnitarioProducto:: !
=::" #
producto::$ ,
.::, -
CostoUnitario::- :
;::: ;"
UnidadDeMedidaProducto;; "
=;;# $
producto;;% -
.;;- .
UnidadDeMedida;;. <
;;;< =(
PorcentajeDeUtilidadProducto<< (
=<<) *
producto<<+ 3
.<<3 4 
PorcentajeDeUtilidad<<4 H
;<<H I
FechaCreacion== 
=== 
producto== $
.==$ %
FechaCreacion==% 2
;==2 3
this>> 
.>> 
IdSubCategoria>> 
=>>  !
producto>>" *
.>>* +
SubCategoriaId>>+ 9
;>>9 :
if?? 
(?? 
producto?? 
.?? 
SubCategoria?? $
!=??% '
null??( ,
)??, -
this@@ 
.@@  
SubCategoriaProducto@@ )
=@@* +
new@@, /'
ProductoSubCategoriaRequest@@0 K
(@@K L
)@@L M
.AA 
MapAA 
(AA 
productoAA !
.AA! "
SubCategoriaAA" .
)AA. /
;AA/ 0
ifCC 
(CC 
productoCC 
.CC 
FabricacionesCC &
!=CC' )
nullCC* .
)CC. /
{DD 
productoEE 
.EE 
FabricacionesEE &
.EE& '
ForEachEE' .
(EE. /
(EE/ 0
fabricacionEE0 ;
)EE; <
=>EE= ?
{FF 
thisGG 
.GG 
FabricacionesGG &
.GG& '
AddGG' *
(GG* +
newGG+ .
FabricacionRequestGG/ A
(GGA B
)GGB C
.HH 
MapHH 
(HH 
fabricacionHH (
)HH( )
)HH) *
;HH* +
}II 
)II 
;II 
}KK 
returnLL 
thisLL 
;LL 
}MM 	
publicOO 
classOO "
ProductoRequestBuilderOO +
{PP 	
publicQQ 
intQQ 
IdQQ 
{QQ 
getQQ 
;QQ  
privateQQ! (
setQQ) ,
;QQ, -
}QQ. /
publicRR 
stringRR 
NombreProductoRR (
{SS 
getTT 
;TT 
privateUU 
setUU 
;UU 
}VV 
publicWW 
doubleWW 
CantidadProductoWW *
{WW+ ,
getWW- 0
;WW0 1
privateWW2 9
setWW: =
;WW= >
}WW? @
publicXX 
doubleXX !
CostoUnitarioProductoXX /
{XX0 1
getXX2 5
;XX5 6
privateXX7 >
setXX? B
;XXB C
}XXD E
publicYY 
UnidadDeMedidaYY !"
UnidadDeMedidaProductoYY" 8
{ZZ 
get[[ 
;[[ 
private\\ 
set\\ 
;\\ 
}]] 
public^^ 
double^^ (
PorcentajeDeUtilidadProducto^^ 6
{^^7 8
get^^9 <
;^^< =
private^^> E
set^^F I
;^^I J
}^^K L
public__ 
Especificacion__ !
Especificacion__" 0
{__1 2
get__3 6
;__6 7
private__8 ?
set__@ C
;__C D
}__E F
public`` 
Tipo`` 
Tipo`` 
{`` 
get`` "
;``" #
private``$ +
set``, /
;``/ 0
}``1 2
publicaa 
DateTimeaa 
FechaCreacionaa )
{aa* +
getaa, /
;aa/ 0
privateaa1 8
setaa9 <
;aa< =
}aa> ?
publicbb 
intbb 
IdSubCategoriabb %
{bb& '
getbb( +
;bb+ ,
privatebb- 4
setbb5 8
;bb8 9
}bb: ;
publiccc "
ProductoRequestBuildercc )
(cc) *
intcc* -
idcc. 0
,cc0 1
stringcc2 8
nombrecc9 ?
)cc? @
{dd 
thisee 
.ee 
NombreProductoee #
=ee$ %
nombreee& ,
.ee, -
ToUpperee- 4
(ee4 5
)ee5 6
;ee6 7
thisff 
.ff 
Idff 
=ff 
idff 
;ff 
}gg 
publicii "
ProductoRequestBuilderii )
SetCantidadii* 5
(ii5 6
doubleii6 <
cantidadii= E
)iiE F
{jj 
thiskk 
.kk 
CantidadProductokk %
=kk& '
cantidadkk( 0
;kk0 1
returnll 
thisll 
;ll 
}mm 
publicnn "
ProductoRequestBuildernn )
SetCostoUnitarionn* :
(nn: ;
doublenn; A
costonnB G
)nnG H
{oo 
thispp 
.pp !
CostoUnitarioProductopp *
=pp+ ,
costopp- 2
;pp2 3
returnqq 
thisqq 
;qq 
}rr 
publicss "
ProductoRequestBuilderss )
SetUnidadDeMedidass* ;
(ss; <
UnidadDeMedidass< J
medidassK Q
)ssQ R
{tt 
thisuu 
.uu "
UnidadDeMedidaProductouu +
=uu, -
medidauu. 4
;uu4 5
returnvv 
thisvv 
;vv 
}ww 
publicxx "
ProductoRequestBuilderxx )#
SetPorcentajeDeUtilidadxx* A
(xxA B
doublexxB H 
porcentajeDeUtilidadxxI ]
)xx] ^
{yy 
thiszz 
.zz (
PorcentajeDeUtilidadProductozz 1
=zz2 3 
porcentajeDeUtilidadzz4 H
;zzH I
return{{ 
this{{ 
;{{ 
}|| 
public}} "
ProductoRequestBuilder}} )
SetEspecificacion}}* ;
(}}; <
Especificacion}}< J
especificacion}}K Y
)}}Y Z
{~~ 
this 
. 
Especificacion #
=$ %
especificacion& 4
;4 5
return
ÄÄ 
this
ÄÄ 
;
ÄÄ 
}
ÅÅ 
public
ÇÇ $
ProductoRequestBuilder
ÇÇ )
SetTipo
ÇÇ* 1
(
ÇÇ1 2
Tipo
ÇÇ2 6
tipo
ÇÇ7 ;
)
ÇÇ; <
{
ÉÉ 
this
ÑÑ 
.
ÑÑ 
Tipo
ÑÑ 
=
ÑÑ 
tipo
ÑÑ  
;
ÑÑ  !
return
ÖÖ 
this
ÖÖ 
;
ÖÖ 
}
ÜÜ 
public
áá $
ProductoRequestBuilder
áá )
SetFechaCreacion
áá* :
(
áá: ;
DateTime
áá; C
fechaCreacion
ááD Q
)
ááQ R
{
àà 
this
ââ 
.
ââ 
FechaCreacion
ââ "
=
ââ# $
fechaCreacion
ââ% 2
;
ââ2 3
return
ää 
this
ää 
;
ää 
}
ãã 
public
åå $
ProductoRequestBuilder
åå )
SetSubCategoria
åå* 9
(
åå9 :
int
åå: =
subcategoria
åå> J
)
ååJ K
{
çç 
this
éé 
.
éé 
IdSubCategoria
éé #
=
éé$ %
subcategoria
éé& 2
;
éé2 3
return
èè 
this
èè 
;
èè 
}
êê 
public
ëë 
ProductoRequest
ëë "
Build
ëë# (
(
ëë( )
)
ëë) *
{
íí 
ProductoRequest
ìì 
productoRequest
ìì  /
=
ìì0 1
new
ìì2 5
ProductoRequest
ìì6 E
(
ììE F
this
ììF J
)
ììJ K
;
ììK L
return
îî 
productoRequest
îî &
;
îî& '
}
ïï 
}
ññ 	
}
óó 
}òò î)
dC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\ProductoSubCategoriaRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 
class '
ProductoSubCategoriaRequest )
:* +
Request, 3
<3 4
int4 7
>7 8
{ 
private		 	
string		
 
_nombreSubCategoria		 $
;		$ %
public

 
string

	 
NombreSubCategoria

 "
{ 
get 
=> 	
_nombreSubCategoria
 
; 
set 
=> 	
_nombreSubCategoria
 
= 
value  %
.% &
ToUpper& -
(- .
). /
;/ 0
} 
public 
int	 
IdCategoria 
{ 
get 
; 
set  #
;# $
}% &
public $
ProductoCategoriaRequest	 !
	Categoria" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
List	 
< 
ProductoRequest 
> 
	Productos (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public '
ProductoSubCategoriaRequest	 $
($ %
)% &
{ 
this 
. 
	Productos 
= 
new 
List 
< 
ProductoRequest ,
>, -
(- .
). /
;/ 0
} 
public '
ProductoSubCategoriaRequest	 $
($ %.
"ProductoSubCategoriaRequestBuilder% G.
"productoSubCategoriaRequestBuilderH j
)j k
{ 
this 
. 
Id 

= .
"productoSubCategoriaRequestBuilder /
./ 0
Id0 2
;2 3
this 
. 
NombreSubCategoria 
= .
"productoSubCategoriaRequestBuilder ?
.? @
NombreSubCategoria@ R
;R S
this 
. 
IdCategoria 
= .
"productoSubCategoriaRequestBuilder 8
.8 9
IdCategoria9 D
;D E
this 
. 
	Productos 
= 
new 
List 
< 
ProductoRequest ,
>, -
(- .
). /
;/ 0
} 
public '
ProductoSubCategoriaRequest	 $
Map% (
(( ) 
ProductoSubCategoria) =
subCategoria> J
)J K
{   
this!! 
.!! 
Id!! 

=!! 
subCategoria!! 
.!! 
Id!! 
;!! 
this"" 
."" 
NombreSubCategoria"" 
="" 
subCategoria"" )
."") *
Nombre""* 0
;""0 1
return## 	
this##
 
;## 
}$$ 
public%% 
class%%	 .
"ProductoSubCategoriaRequestBuilder%% 1
{&& 
public'' 	
int''
 
Id'' 
{'' 
get'' 
;'' 
private'' 
set''  #
;''# $
}''% &
public(( 	
string((
 
NombreSubCategoria(( #
{)) 
private** 
set** 
;** 
get** 
;** 
}++ 
public,, 	
int,,
 
IdCategoria,, 
{,, 
get,, 
;,,  
private,,! (
set,,) ,
;,,, -
},,. /
public-- 	.
"ProductoSubCategoriaRequestBuilder--
 ,
(--, -
string--- 3
nombre--4 :
)--: ;
{.. 
this// 
.// 	
NombreSubCategoria//	 
=// 
nombre// $
;//$ %
}00 
public11 	.
"ProductoSubCategoriaRequestBuilder11
 ,
SetId11- 2
(112 3
int113 6
id117 9
)119 :
{22 
this33 
.33 	
Id33	 
=33 
id33 
;33 
return44 

this44 
;44 
}55 
public66 	.
"ProductoSubCategoriaRequestBuilder66
 ,
SetIdCategoria66- ;
(66; <
int66< ?
idCategoria66@ K
)66K L
{77 
this88 
.88 	
IdCategoria88	 
=88 
idCategoria88 "
;88" #
return99 

this99 
;99 
}:: 
public;; 	'
ProductoSubCategoriaRequest;;
 %
Build;;& +
(;;+ ,
);;, -
{<< '
ProductoSubCategoriaRequest== 
subCategoriaRequest==  3
===4 5
new==6 9'
ProductoSubCategoriaRequest==: U
(==U V
this==V Z
)==Z [
;==[ \
return>> 

subCategoriaRequest>> 
;>> 
}?? 
}@@ 
}AA 
}BB Õ
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
}		 °$
dC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroClientePrecioRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 
class '
TerceroClientePrecioRequest )
{* +
public 
int	 

ProductoId 
{ 
get 
; 
set "
;" #
}$ %
private 	
string
 
_nombreProducto  
;  !
public 
string	 
NombreProducto 
{  
get! $
=>% '
_nombreProducto( 7
;7 8
set9 <
=>= ?
_nombreProducto@ O
=P Q
valueR W
.W X
ToUpperX _
(` a
)a b
;b c
}d e
public 
double	 
Precio 
{ 
get 
; 
set !
;! "
}# $
public		 '
TerceroClientePrecioRequest			 $
(		% &.
"TerceroClientePrecioRequestBuilder		& H
builder		I P
)		P Q
{		R S
this

 
.

 

ProductoId

 
=

 
builder

 
.

 

ProductoId

 '
;

' (
this 
. 
NombreProducto 
= 
$str 
+ 
builder %
.% &
NombreProducto& 4
;4 5
this 
. 
Precio 
= 
builder 
. 
Precio 
;  
} 
public '
TerceroClientePrecioRequest	 $
(% &
)& '
{( )
}* +
public '
TerceroClientePrecioRequest	 $
Map% (
() *(
TerceroClientePrecioProducto* F
precioG M
)M N
{O P
this 
. 

ProductoId 
= 
precio 
. 

ProductoId &
;& '
this 
. 
NombreProducto 
= 
precio 
.  
Producto  (
.( )
Nombre) /
;/ 0
this 
. 
Precio 
= 
precio 
. 
Precio 
; 
return 	
this
 
; 
} 
public (
TerceroClientePrecioProducto	 %
UnMap& +
(, -
)- .
{/ 0
return 	
null
 
; 
} 
public 
class	 .
"TerceroClientePrecioRequestBuilder 1
{2 3
public 	
int
 

ProductoId 
{ 
get 
; 
private  '
set( +
;+ ,
}- .
public 	
string
 
NombreProducto 
{  !
get" %
;% &
private' .
set/ 2
;2 3
}4 5
public 	
double
 
Precio 
{ 
get 
; 
private &
set' *
;* +
}, -
public 	.
"TerceroClientePrecioRequestBuilder
 ,
(- .
int. 1

idProducto2 <
,< =
double> D
precioE K
)K L
{M N
this 
. 	
Precio	 
= 
precio 
; 
this   
.   	

ProductoId  	 
=   

idProducto    
;    !
}!! 
public"" 	.
"TerceroClientePrecioRequestBuilder""
 ,
SetNombreProducto""- >
(""? @
string""@ F
nombreProducto""G U
)""U V
{""W X
this## 
.## 	
NombreProducto##	 
=## 
nombreProducto## (
;##( )
return$$ 

this$$ 
;$$ 
}%% 
public&& 	'
TerceroClientePrecioRequest&&
 %
Build&&& +
(&&, -
)&&- .
{&&/ 0'
TerceroClientePrecioRequest'' 
precioRequest''  -
=''. /
new''0 3'
TerceroClientePrecioRequest''4 O
(''P Q
this''Q U
)''U V
;''V W
return(( 

precioRequest(( 
;(( 
})) 
}** 
}++ 
},, ﬂ#
^C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroClienteRequest.cs
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
TerceroRequest	 
Tercero 
{  !
get" %
;% &
set' *
;* +
}, -
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
.%% 
Tercero%% 
=%% 
new%% 
TerceroRequest%% $
(%%$ %
)%%% &
.%%& '
Map%%' *
(%%* +
cliente%%+ 2
.%%2 3
Tercero%%3 :
)%%: ;
;%%; <
return&& 	
this&&
 
;&& 
}'' 
public(( 
TerceroCliente((	 
UnMap(( 
((( 
)(( 
{)) 
Tercero** 

tercero** 
=** 
this** 
.** 
Tercero** !
.**! "
UnMap**" '
(**' (
)**( )
;**) *
TerceroCliente++ 
cliente++ 
=++ 
new++ 
TerceroCliente++  .
.++. /!
TerceroClienteBuilder++/ D
(++D E
tercero++E L
)++L M
.,, 
Build,, 

(,,
 
),, 
;,, 
this-- 
.-- 
Precios-- 
.-- 
ForEach-- 
(-- 
x-- 
=>-- 
cliente-- $
.--$ %
	AddPrecio--% .
(--. /
x--/ 0
.--0 1
UnMap--1 6
(--6 7
)--7 8
)--8 9
)--9 :
;--: ;
return.. 	
cliente..
 
;.. 
}// 
}00 
}11 ‡
_C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroEmpleadoRequest.cs
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
TerceroRequest			 
Tercero		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
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
;) *
Tercero 

= 
new 
TerceroRequest 
(  
)  !
.! "
Map" %
(% &
empleado& .
.. /
Tercero/ 6
)6 7
;7 8
return 	
this
 
; 
}   
}!! 
}$$ ›
`C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroProveedorRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 
class #
TerceroProveedorRequest %
:& '
Request( /
</ 0
int0 3
>3 4
{ 
public		 
TerceroRequest			 
Tercero		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

	 

NitTercero

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
public #
TerceroProveedorRequest	  
(  !
TerceroRequest! /
tercero0 7
)7 8
{ 
this 
. 
Tercero 
= 
tercero 
; 
this 
. 

NitTercero 
= 
tercero 
. 

NitTercero '
;' (
} 
public #
TerceroProveedorRequest	  
(  !
)! "
{ 
} 
internal 
#
TerceroProveedorRequest "
Map# &
(& '
TerceroProveedor' 7
provedor8 @
)@ A
{ 
this 
. 
Id 

= 
provedor 
. 
Id 
; 
this 
. 
FechaCreacion 
= 
provedor  
.  !
FechaCreacion! .
;. /
this 
. 

NitTercero 
= 
provedor 
. 
Tercero %
.% &
Nit& )
;) *
this 
. 
Tercero 
= 
new 
TerceroRequest $
($ %
)% &
.& '
Map' *
(* +
provedor+ 3
.3 4
Tercero4 ;
); <
;< =
return 	
this
 
; 
} 
} 
} ç9
WC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroRequest.cs
	namespace 	
Application
 
. 
Request 
{ 
public 
class 
TerceroRequest 
: 
Request &
<& '
int' *
>* +
{, -
public 
string	 

NitTercero 
{ 
get  
;  !
set" %
;% &
}' (
private		 	
string		
 
_razonSocial		 
;		 
public

 
string

	 
RazonSocialTercero

 "
{

# $
get 
=> 	
_razonSocial
 
; 
set 
=> 	
_razonSocial
 
= 
value 
. 
ToUpper &
(' (
)( )
;) *
} 
public 
DateTime	 
FechaCreacion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
List	 
< 
ContactoRequest 
> 
ContactosTercero /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
TerceroRequest	 
( 
) 
{ 
this 
. 
ContactosTercero 
= 
new 
List #
<# $
ContactoRequest$ 3
>3 4
(5 6
)6 7
;7 8
} 
public 
TerceroRequest	 
( 
string 

nitTercero  *
,* +
string, 2
razonSocialTercero3 E
)E F
{G H

NitTercero 
= 

nitTercero 
; 
RazonSocialTercero 
= 
razonSocialTercero *
;* +
ContactosTercero 
= 
new 
List 
< 
ContactoRequest .
>. /
(0 1
)1 2
;2 3
} 
public 
TerceroRequest	 
Map 
( 
Tercero $
tercero% ,
), -
{. /
this 
. 
Id 

= 
tercero 
. 
Id 
; 
FechaCreacion 
= 
tercero 
. 
FechaCreacion (
;( )

NitTercero 
= 
tercero 
. 
Nit 
; 
RazonSocialTercero 
= 
tercero 
.  
RazonSocial  +
;+ ,
if 
( 
tercero 
. 
	Contactos 
!= 
null  
)  !
{" #
tercero   
.   
	Contactos   
.   
ForEach   
(   
(    
contacto    (
)  ( )
=>  * ,
{  - .
ContactosTercero!! 
.!! 
Add!! 
(!! 
new!! 
ContactoRequest!! .
(!!/ 0
)!!0 1
.!!1 2
Map!!2 5
(!!6 7
contacto!!7 ?
)!!? @
)!!@ A
;!!A B
}"" 
)"" 
;"" 
}## 
return$$ 	
this$$
 
;$$ 
}%% 
public&& 
Tercero&&	 
UnMap&& 
(&& 
)&& 
{'' 
List(( 
<(( 
Contacto(( 
>(( 
	contactos(( 
=(( 
new(( !
List((" &
<((& '
Contacto((' /
>((/ 0
(((0 1
)((1 2
;((2 3
this)) 
.)) 
ContactosTercero)) 
.)) 
ForEach))  
())  !
x))! "
=>))# %
	contactos))& /
.))/ 0
Add))0 3
())3 4
x))4 5
.))5 6
UnMap))6 ;
()); <
)))< =
)))= >
)))> ?
;))? @
Tercero++ 

tercero++ 
=++ 
new++ 
Tercero++  
.++  !
TerceroBuilder++! /
(++/ 0
this++0 4
.++4 5

NitTercero++5 ?
,++? @
this,, 
.,, 	
RazonSocialTercero,,	 
),, 
.,, 
SetId,, "
(,," #
this,,# '
.,,' (
Id,,( *
),,* +
.,,+ ,
SetContactos,,, 8
(,,8 9
	contactos,,9 B
),,B C
.,,C D
Build-- 	
(--	 

)--
 
;-- 
return.. 	
tercero..
 
;.. 
}// 
}00 
public22 
class22 
ContactoRequest22 
:22 
Request22  '
<22' (
int22( +
>22+ ,
{22- .
public33 
string33	 
TerceroDireccion33  
{33! "
get33# &
;33& '
set33( +
;33+ ,
}33- .
public44 
string44	  
TerceroNumeroCelular44 $
{44% &
get44' *
;44* +
set44, /
;44/ 0
}441 2
public55 
string55	 
TerceroEmail55 
{55 
get55 "
;55" #
set55$ '
;55' (
}55) *
public77 
ContactoRequest77	 
Map77 
(77 
Contacto77 &
contacto77' /
)77/ 0
{771 2
this88 
.88 
Id88 

=88 
contacto88 
.88 
Id88 
;88 
this99 
.99 
TerceroDireccion99 
=99 
contacto99 #
.99# $
	Direccion99$ -
;99- .
this:: 
.::  
TerceroNumeroCelular:: 
=:: 
contacto:: '
.::' (
NumeroCelular::( 5
;::5 6
this;; 
.;; 
TerceroEmail;; 
=;; 
contacto;; 
.;;  
Email;;  %
;;;% &
return<< 	
this<<
 
;<< 
}== 
public>> 
Contacto>>	 
UnMap>> 
(>> 
)>> 
{?? 
return@@ 	
new@@
 
Contacto@@ 
.@@ 
ContactoBuilder@@ &
(@@& '
)@@' (
.@@( )
SetDireccion@@) 5
(@@5 6
this@@6 :
.@@: ;
TerceroDireccion@@; K
)@@K L
.@@L M
SetEmailAA 
(AA 
thisAA 
.AA 
TerceroEmailAA 
)AA 
.AA  
SetNumeroCelularAA  0
(AA0 1
thisAA1 5
.AA5 6 
TerceroNumeroCelularAA6 J
)AAJ K
.BB 
SetIdBB 

(BB
 
thisBB 
.BB 
IdBB 
)BB 
.BB 
BuildBB 
(BB 
)BB 
;BB 
}CC 
}DD 
}EE ÷=
^C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Request\TerceroUsuarioRequest.cs
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
ToLower^ e
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
public 
RoleRequest 
Role 
{  !
get" %
;% &
set' *
;* +
}, -
public 
DateTime 
FechaCreacion %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public !
TerceroUsuarioRequest $
($ %
)% &
{ 	
} 	
public !
TerceroUsuarioRequest $
($ %(
TerceroUsuarioRequestBuilder% A!
terceroUsuarioBuilderB W
)W X
{ 	
this 
. 

NitTercero 
= !
terceroUsuarioBuilder 3
.3 4

NitTercero4 >
;> ?
this 
. 
UsuarioTercero 
=  !!
terceroUsuarioBuilder" 7
.7 8
UsuarioTercero8 F
;F G
this 
. 
PasswordTercero  
=! "!
terceroUsuarioBuilder# 8
.8 9
PasswordTercero9 H
;H I
this 
. 
Role 
= !
terceroUsuarioBuilder -
.- .
Role. 2
;2 3
this 
. 
Id 
= !
terceroUsuarioBuilder +
.+ ,
Id, .
;. /
} 	
public !
TerceroUsuarioRequest $
Map% (
(( )
TerceroUsuario) 7
usuario8 ?
)? @
{ 	
this   
.   
Id   
=   
usuario   
.   
Id    
;    !
this!! 
.!! 
FechaCreacion!! 
=!!  
usuario!!! (
.!!( )
FechaCreacion!!) 6
;!!6 7

NitTercero"" 
="" 
usuario""  
.""  !
Tercero""! (
.""( )
Nit"") ,
;"", -
UsuarioTercero## 
=## 
usuario## $
.##$ %
Usuario##% ,
;##, -
PasswordTercero$$ 
=$$ 
usuario$$ %
.$$% &
Password$$& .
;$$. /
this%% 
.%% 
Role%% 
=%% 
new%% 
RoleRequest%% '
(%%' (
)%%( )
.%%) *
Map%%* -
(%%- .
usuario%%. 5
.%%5 6
Role%%6 :
)%%: ;
;%%; <
return&& 
this&& 
;&& 
}'' 	
public)) 
class)) (
TerceroUsuarioRequestBuilder)) 1
{** 	
public++ 
int++ 
Id++ 
{++ 
get++ 
;++  
set++! $
;++$ %
}++& '
public,, 
string,, 

NitTercero,, $
{,,% &
get,,' *
;,,* +
private,,, 3
set,,4 7
;,,7 8
},,9 :
public-- 
string-- 
UsuarioTercero-- (
{--) *
get--+ .
;--. /
private--0 7
set--8 ;
;--; <
}--= >
public.. 
string.. 
PasswordTercero.. )
{..* +
get.., /
;../ 0
private..1 8
set..9 <
;..< =
}..> ?
public// 
RoleRequest// 
Role// #
{//$ %
get//& )
;//) *
private//+ 2
set//3 6
;//6 7
}//8 9
public00 (
TerceroUsuarioRequestBuilder00 /
(00/ 0
TerceroRequest000 >
terceroDuvan00? K
)00K L
{11 
this22 
.22 

NitTercero22 
=22  !
terceroDuvan22" .
.22. /

NitTercero22/ 9
;229 :
}33 
public55 (
TerceroUsuarioRequestBuilder55 /

SetUsuario550 :
(55: ;
string55; A
usuario55B I
)55I J
{66 
this77 
.77 
UsuarioTercero77 #
=77$ %
usuario77& -
;77- .
return88 
this88 
;88 
}99 
public:: (
TerceroUsuarioRequestBuilder:: /
SetPassword::0 ;
(::; <
string::< B
password::C K
)::K L
{;; 
this<< 
.<< 
PasswordTercero<< $
=<<% &
password<<' /
;<</ 0
return== 
this== 
;== 
}>> 
public?? (
TerceroUsuarioRequestBuilder?? /
SetRole??0 7
(??7 8
RoleRequest??8 C
role??D H
)??H I
{@@ 
thisAA 
.AA 
RoleAA 
=AA 
roleAA  
;AA  !
returnBB 
thisBB 
;BB 
}CC 
publicDD (
TerceroUsuarioRequestBuilderDD /
SetIdDD0 5
(DD5 6
intDD6 9
idDD: <
)DD< =
{EE 
thisFF 
.FF 
IdFF 
=FF 
idFF 
;FF 
returnGG 
thisGG 
;GG 
}HH 
publicII !
TerceroUsuarioRequestII (
BuildII) .
(II. /
)II/ 0
{JJ !
TerceroUsuarioRequestKK %
usuarioKK& -
=KK. /
newKK0 3!
TerceroUsuarioRequestKK4 I
(KKI J
thisKKJ N
)KKN O
;KKO P
returnLL 
usuarioLL 
;LL 
}MM 
}NN 	
}OO 
publicPP 

classPP 
RoleRequestPP 
:PP 
RequestPP &
<PP& '
intPP' *
>PP* +
{QQ 
privateRR 
stringRR 
_nombreRR 
;RR 
publicTT 
stringTT 
NombreTT 
{UU 	
getVV 
{VV 
returnVV 
_nombreVV  
;VV  !
}VV" #
setWW 
{WW 
_nombreWW 
=WW 
valueWW !
.WW! "
ToLowerWW" )
(WW) *
)WW* +
;WW+ ,
}WW- .
}XX 	
internalZZ 
RoleRequestZZ 
MapZZ  
(ZZ  !
RoleZZ! %
roleZZ& *
)ZZ* +
{[[ 	
this\\ 
.\\ 
Id\\ 
=\\ 
role\\ 
.\\ 
Id\\ 
;\\ 
this]] 
.]] 
Nombre]] 
=]] 
role]] 
.]] 
Nombre]] %
;]]% &
return^^ 
this^^ 
;^^ 
}__ 	
}`` 
}aa óD
fC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\CompraServices\CompraService.cs
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
.B C
NitProveedorC O
,O P
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
.G H
NitProveedorH T
}T U
"U V
+W X
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
.!!5 6
Id!!6 8
==!!9 ;
request!!< C
.!!C D
	UsuarioId!!D M
)!!M N
;!!N O
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
$"((  
El usuario con id ((  2
{((2 3
request((3 :
.((: ;
	UsuarioId((; D
}((D E
"((E F
+((G H
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
.88+ ,
Id88, .
==88/ 1
detalle882 9
.889 :

ProductoId88: D
,88D E
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
.PP7 8
IdPP8 :
==PP; =
detallePP> E
.PPE F

ProductoIdPPF P
)PPP Q
;PPQ R
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
$"RR  "
El producto con id RR" 5
{RR5 6
detalleRR6 =
.RR= >

ProductoIdRR> H
}RRH I

 no existeRRI S
"RRS T
)RRT U
;RRU V
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
$"TT  ",
 La cantidad del producto con id TT" B
{TTB C
detalleTTC J
.TTJ K

ProductoIdTTK U
}TTU V
 es invalidaTTV b
"TTb c
)TTc d
;TTd e
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
$"VV  ")
El valor del producto con id VV" ?
{VV? @
detalleVV@ G
.VVG H

ProductoIdVVH R
}VVR S
 es invalidaVVS _
"VV_ `
)VV` a
;VVa b
}WW 
)WW 
;WW 
returnXX 
erroresXX 
;XX 
}YY 	
}ZZ 
}[[ ß
vC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\CompraServices\ListarComprasPaginadasService.cs
	namespace 	
Application
 
. 
Services 
. 
CompraServices -
{ 
public		 
class		 )
ListarComprasPaginadasService		 +
{

 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
private 	
readonly
  
ListarComprasService '
comprasService( 6
;6 7
public )
ListarComprasPaginadasService	 &
(& '
IUnitOfWork' 2

unitOfWork3 =
)= >
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
this 
. 
comprasService 
= 
new  
ListarComprasService 1
(1 2
)2 3
;3 4
} 
public 
List	 
< 
CompraRequest 
> 
GetPaginados )
() *
PaginationRequest* ;
request< C
)C D
{ 
var 

allCompras 
= 
this 
. 
_unitOfWork $
.$ %
CompraRepository% 5
.5 6
GetAll6 <
(< =
)= >
;> ?
List 
< 
Compra 
> 
compras 
= 

allCompras $
. 
Skip 	
(	 

request
 
. 
Page 
- 
$num 
) 
. 
Take 	
(	 

request
 
. 
Rows 
) 
. 
ToList 
( 
)  
;  !
return 	
this
 
. 
comprasService 
. $
ConvertirComprasARequest 6
(6 7
compras7 >
)> ?
;? @
} 
} 
} Ù

mC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\CompraServices\ListarComprasService.cs
	namespace 	
Application
 
. 
Services 
. 
CompraServices -
{ 
public		 
class		  
ListarComprasService		 "
{

 
public  
ListarComprasService	 
( 
) 
{ 
} 
public 
List	 
< 
CompraRequest 
> $
ConvertirComprasARequest 5
(5 6
List6 :
<: ;
Compra; A
>A B
comprasC J
)J K
{ 
var 
comprasRequest 
= 
new 
List  
<  !
CompraRequest! .
>. /
(/ 0
)0 1
;1 2
compras 

.
 
ForEach 
( 
x 
=> 
comprasRequest &
.& '
Add' *
(* +
new+ .
CompraRequest/ <
(< =
)= >
.> ?
Map? B
(B C
xC D
)D E
)E F
)F G
;G H
return 	
comprasRequest
 
; 
} 
} 
} ı
ÑC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\CategoriaServices\ListarCategoriasService.cs
	namespace		 	
Application		
 
.		 
Services		 
.		 
ProductoServices		 /
.		/ 0
CategoriaServices		0 A
{

 
public 

class #
ListarCategoriasService (
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public #
ListarCategoriasService &
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
Response 
GetCategorias %
(% &
)& '
{ 	
var 

categorias 
= 
this !
.! "
_unitOfWork" -
.- .
CategoriaRepository. A
.A B
GetAllB H
(H I
)I J
.J K
ToListK Q
(Q R
)R S
;S T
if 
( 

categorias 
== 
null "
)" #
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 P
}Q R
;R S
} 
return 
new 
Response 
{  !
Data" &
=' ('
ConvertirCategoriasARequest) D
(D E

categoriasE O
)O P
}Q R
;R S
} 	
private 
List 
< $
ProductoCategoriaRequest -
>- .'
ConvertirCategoriasARequest/ J
(J K
ListK O
<O P
ProductoCategoriaP a
>a b

categoriasc m
)m n
{ 	
List 
< $
ProductoCategoriaRequest )
>) *
request+ 2
=3 4
new5 8
List9 =
<= >$
ProductoCategoriaRequest> V
>V W
(W X
)X Y
;Y Z

categorias   
.   
ForEach   
(   
x    
=>  ! #
request  $ +
.  + ,
Add  , /
(  / 0
new  0 3$
ProductoCategoriaRequest  4 L
(  L M
)  M N
.  N O
Map  O R
(  R S
x  S T
)  T U
)  U V
)  V W
;  W X
return!! 
request!! 
;!! 
}"" 	
}## 
}$$ ◊
áC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\CategoriaServices\ListarSubCategoriasService.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
./ 0
CategoriaServices0 A
{		 
public

 

class

 &
ListarSubCategoriasService

 +
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public &
ListarSubCategoriasService )
() *
IUnitOfWork* 5

unitOfWork6 @
)@ A
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
List 
< '
ProductoSubCategoriaRequest /
>/ 0*
ConvertirSubCategoriasARequest1 O
(O P
ListP T
<T U 
ProductoSubCategoriaU i
>i j
subCategoriask x
)x y
{ 	
List 
< '
ProductoSubCategoriaRequest ,
>, -
request. 5
=6 7
new8 ;
List< @
<@ A'
ProductoSubCategoriaRequestA \
>\ ]
(] ^
)^ _
;_ `
subCategorias 
. 
ForEach !
(! "
x" #
=>$ &
request' .
.. /
Add/ 2
(2 3
new3 6'
ProductoSubCategoriaRequest7 R
(R S
)S T
.T U
MapU X
(X Y
xY Z
)Z [
)[ \
)\ ]
;] ^
return 
request 
; 
} 	
public 
Response 
GetSubCategorias (
(( )
)) *
{ 	
var 
subCategorias 
= 
this  $
.$ %
_unitOfWork% 0
.0 1"
SubCategoriaRepository1 G
.G H
GetAllH N
(N O
)O P
.P Q
ToListQ W
(W X
)X Y
;Y Z
if 
( 
subCategorias 
==  
null! %
)% &
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 S
}T U
;U V
} 
return 
new 
Response 
{  !
Data" &
=' (*
ConvertirSubCategoriasARequest) G
(G H
subCategoriasH U
)U V
}W X
;X Y
} 	
public    
ProductoSubCategoria   ##
BuscarSubCategoriaConId  $ ;
(  ; <
int  < ?
idSubcategoria  @ N
)  N O
{!! 	
return"" 
this"" 
."" 
_unitOfWork"" #
.""# $"
SubCategoriaRepository""$ :
."": ;
FindFirstOrDefault## "
(##" #
subCategoria### /
=>##0 2
subCategoria##3 ?
.##? @
Id##@ B
==##C E
idSubcategoria##F T
)##T U
;##U V
}$$ 	
}%% 
}&& â 
òC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\CategoriaServices\ProductoCategoriaAgregarSubCategoriaService.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
./ 0
CategoriaServices0 A
{ 
public 

class 7
+ProductoCategoriaAgregarSubCategoriaService <
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
public 7
+ProductoCategoriaAgregarSubCategoriaService :
(: ;
IUnitOfWork; F

unitOfWorkG Q
)Q R
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
Agregar 
(  '
ProductoSubCategoriaRequest  ;
request< C
)C D
{ 	
ProductoCategoria 
	categoria '
=( )
this* .
.. /
_unitOfWork/ :
.: ;
CategoriaRepository; N
. 
FindBy 
( 
	categoria !
=>" $
	categoria% .
.. /
Id/ 1
==2 4
request5 <
.< =
IdCategoria= H
,H I
includeProperties !
:! "
$str# 2
)2 3
.3 4
FirstOrDefault4 B
(B C
)C D
;D E
if 
( 
	categoria 
== 
null !
)! "
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 P
}Q R
;R S
}  
ProductoSubCategoria  
subCategoria! -
=. /
	categoria0 9
.9 :
SubCategorias: G
. 
FirstOrDefault 
(  
subCategoria  ,
=>- /
subCategoria0 <
.< =
Nombre= C
==D F
requestG N
.N O
NombreSubCategoriaO a
)a b
;b c
if 
( 
subCategoria 
!= 
null  $
)$ %
{ 
return 
new 
Response #
{   
Mensaje!! 
=!! 
$"!!  
La subcategoria !!  0
{!!0 1
request!!1 8
.!!8 9
NombreSubCategoria!!9 K
}!!K L
 ya !!L P
"!!P Q
+!!R S
$""" #
se encuentra registrada"" -
"""- .
}## 
;## 
}$$ 
subCategoria&& 
=&& 
new&&  
ProductoSubCategoria&& 3
.'' '
ProductoSubCategoriaBuilder'' ,
('', -
request''- 4
.''4 5
NombreSubCategoria''5 G
)''G H
.''H I
Build''I N
(''N O
)''O P
;''P Q
	categoria)) 
.)) 
SubCategorias)) #
.))# $
Add))$ '
())' (
subCategoria))( 4
)))4 5
;))5 6
this** 
.** 
_unitOfWork** 
.** 
CategoriaRepository** 0
.**0 1
Edit**1 5
(**5 6
	categoria**6 ?
)**? @
;**@ A
this++ 
.++ 
_unitOfWork++ 
.++ 
Commit++ #
(++# $
)++$ %
;++% &
return-- 
new-- 
Response-- 
{.. 
Mensaje// 
=// 
$str// =
,//= >
Data00 
=00 
new00 $
ProductoCategoriaRequest00 3
(003 4
)004 5
.005 6
Map006 9
(009 :
	categoria00: C
)00C D
}11 
;11 
}22 	
}33 
}44 É
äC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\CategoriaServices\ProductoCategoriaCrearService.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
./ 0
CategoriaServices0 A
{ 
public 

class )
ProductoCategoriaCrearService .
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
public )
ProductoCategoriaCrearService ,
(, -
IUnitOfWork- 8

unitOfWork9 C
)C D
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
( $
ProductoCategoriaRequest 6
request7 >
)> ?
{ 	
ProductoCategoria 
	categoria '
=( )
this* .
.. /
_unitOfWork/ :
.: ;
CategoriaRepository; N
. 
FindBy 
( 
	categoria !
=>" $
	categoria% .
.. /
Nombre/ 5
==6 8
request9 @
.@ A
NombreCategoriaA P
,P Q
includeProperties !
:! "
$str# 2
)2 3
.3 4
FirstOrDefault4 B
(B C
)C D
;D E
if 
( 
	categoria 
!= 
null !
)! "
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$str G
} 
; 
} 
	categoria 
= 
new 
ProductoCategoria -
(- .
). /
;/ 0
	categoria 
. 
Nombre 
= 
request &
.& '
NombreCategoria' 6
;6 7
this   
.   
_unitOfWork   
.   
CategoriaRepository   0
.  0 1
Add  1 4
(  4 5
	categoria  5 >
)  > ?
;  ? @
this!! 
.!! 
_unitOfWork!! 
.!! 
Commit!! #
(!!# $
)!!$ %
;!!% &
return$$ 
new$$ 
Response$$ 
{%% 
Mensaje&& 
=&& 
$"&& *
Se ha registrado la categoria && :
{&&: ;
	categoria&&; D
.&&D E
Nombre&&E K
}&&K L
 con √©xito&&L V
"&&V W
,&&W X
Data'' 
='' 
new'' $
ProductoCategoriaRequest'' 3
(''3 4
)''4 5
.''5 6
Map''6 9
(''9 :
	categoria'': C
)''C D
}(( 
;(( 
}** 	
}++ 
},, “E
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
public 
class #
FabricacionCrearService %
{ 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
public #
FabricacionCrearService	  
(  !
IUnitOfWork! ,

unitOfWork- 7
)7 8
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
} 
public 
Response	 
IniciarFabricacion $
($ %
FabricacionRequest% 7
request8 ?
)? @
{ 
Producto  
productoParaFabricar  
=! "
this 
. 	
_unitOfWork	 
. 
ProductoRepository '
.' (
FindBy 

(
 
producto 
=> 
producto 
.  
Id  "
==# %
request& -
.- .

IdProducto. 8
,8 9
includeProperties 
: 
$str &
)& '
.' (
FirstOrDefault( 6
(6 7
)7 8
;8 9
if 
(  
productoParaFabricar 
== 
null #
)# $
{ 
return 

new 
Response 
{ 
Mensaje 
= 
$str ?
} 
; 
}   
if"" 
(""  
productoParaFabricar"" 
."" 
Especificacion"" *
==""+ -
Especificacion"". <
.""< =
MateriaPrima""= I
)""I J
{## 
return$$ 

new$$ 
Response$$ 
{%% 
Mensaje&& 
=&& 
$"&& 
El && 
{&&  
productoParaFabricar&& )
.&&) *
Nombre&&* 0
}&&0 1!
 no se puede fabricar&&1 F
"&&F G
}'' 
;'' 
}(( 
TerceroEmpleado** 
empleado** 
=** 
this** "
.**" #
_unitOfWork**# .
.**. /%
TerceroEmpleadoRepository**/ H
.**H I
FindBy++ 

(++
 
empleado++ 
=>++ 
empleado++ 
.++  
Tercero++  '
.++' (
Nit++( +
==++, .
request++/ 6
.++6 7
NitEmpleado++7 B
,++B C
includeProperties,, 
:,, 
$str,,  
),,  !
.,,! "
FirstOrDefault,," 0
(,,0 1
),,1 2
;,,2 3
if.. 
(.. 
empleado.. 
==.. 
null.. 
).. 
{// 
return00 

new00 
Response00 
{11 
Mensaje22 
=22 
$"22 3
'No hay un empleado con identificaci√≥n 22 7
{227 8
request228 ?
.22? @
NitEmpleado22@ K
}22K L
"22L M
}33 
;33 
}44 
if55 
(55 
request55 
.55 
Detalles55 
.55 
Count55 
==55  
$num55! "
)55" #
{66 
return77 

new77 
Response77 
{88 
Mensaje99 
=99 
$"99 /
#Por favor, agregue materias primas 99 4
"994 5
+996 7
$":: 
para fabricar el :: 
{::  
productoParaFabricar:: -
.::- .
Nombre::. 4
}::4 5
"::5 6
};; 
;;; 
}<< 
Fabricacion== 
fabricacion== 
=== 
new==  
Fabricacion==! ,
(==, -
empleado==- 5
)==5 6
;==6 7 
productoParaFabricar>> 
.>> 
AgregarFabricacion>> *
(>>* +
fabricacion>>+ 6
)>>6 7
;>>7 8
ProductoBB 
tempBB 
=BB 
nullBB 
;BB 
tempCC 
=CC 	2
&ComprobarExistenciasDeEnMateriasPrimasCC
 0
(CC0 1
requestCC1 8
,CC8 9
fabricacionCC: E
,CCE F
tempCCG K
)CCK L
;CCL M
ifEE 
(EE 
fabricacionEE 
.EE 
FabricacionDetallesEE &
.EE& '
CountEE' ,
!=EE- /
requestFF 
.FF 
DetallesFF 
.FF 
CountFF 
)FF 
{GG 
ifHH 
(HH 
tempHH 
==HH 
nullHH 
)HH 
{II 
returnJJ 
newJJ 
ResponseJJ 
{KK 
MensajeLL 
=LL 
$strLL 
+LL 
$"MM 
{MM 	
requestMM	 
.MM 
DetallesMM 
[MM 
fabricacionMM %
.MM% &
FabricacionDetallesMM& 9
.MM9 :
CountMM: ?
]MM? @
.MM@ A
NombreMateriaPrimaMMA S
}MMS T
"MMT U
+MMV W
$strNN 1
}OO 
;OO 
}PP 
returnQQ 

newQQ 
ResponseQQ 
{RR 
MensajeSS 
=SS 
$"SS -
!No hay cantidades suficientes de SS 2
{SS2 3
tempSS3 7
.SS7 8
NombreSS8 >
}SS> ?
, SS? A
"SSA B
+SSC D
$"TT 
	solo hay TT 
{TT 
tempTT 
.TT 
CantidadTT 
}TT 
"TT  
}UU 
;UU 
}WW 
fabricacionXX 
.XX /
#DescontarCantidadesEnMateriasPrimasXX 2
(XX2 3
)XX3 4
;XX4 5
thisYY 
.YY 
_unitOfWorkYY 
.YY 
ProductoRepositoryYY &
.YY& '
EditYY' +
(YY+ , 
productoParaFabricarYY, @
)YY@ A
;YYA B
thisZZ 
.ZZ 
_unitOfWorkZZ 
.ZZ 
CommitZZ 
(ZZ 
)ZZ 
;ZZ 
return[[ 	
new[[
 
Response[[ 
{\\ 
Mensaje]] 
=]] 
$str]] Z
,]]Z [
Data^^ 
=^^	 

request^^ 
.^^ 
Map^^ 
(^^ 
fabricacion^^ "
)^^" #
}__ 
;__ 
}`` 
privatebb 	
Productobb
 2
&ComprobarExistenciasDeEnMateriasPrimasbb 9
(bb9 :
FabricacionRequestbb: L
requestbbM T
,bbT U
Fabricacioncc 
fabricacioncc 
,cc 
Productocc $
tempcc% )
)cc) *
{dd 
foreachee 

(ee %
FabricacionDetalleRequestee %
detalleee& -
inee. 0
requestee1 8
.ee8 9
Detallesee9 A
)eeA B
{ff 
Productogg  
productoMateriaPrimagg !
=gg" #
thishh 	
.hh	 

_unitOfWorkhh
 
.hh 
ProductoRepositoryhh (
.hh( )
FindFirstOrDefaultii 
(ii 
productoii  
=>ii! #
productoii$ ,
.ii, -
Nombreii- 3
==ii4 6
detalleii7 >
.ii> ?
NombreMateriaPrimaii? Q
)iiQ R
;iiR S
ifjj 
(jj  
productoMateriaPrimajj 
==jj 
nulljj  $
)jj$ %
{kk 
breakll 

;ll
 
}mm 
elsenn 
ifnn	 
(nn  
productoMateriaPrimann !
.nn! ""
PuedeDescontarCantidadoo 
(oo 
detalleoo #
.oo# $ 
CantidadMateriaPrimaoo$ 8
)oo8 9
.oo9 :
Anyoo: =
(oo= >
)oo> ?
)oo? @
{pp 
tempqq 	
=qq
  
productoMateriaPrimaqq  
;qq  !
breakrr 

;rr
 
}ss 
fabricaciontt 
.tt 
AgregarDetalleuu 
(uu 
newuu 
FabricacionDetalleuu )
(uu) *
fabricacionuu* 5
,uu5 6 
productoMateriaPrimauu7 K
,uuK L
detallevv 
.vv  
CantidadMateriaPrimavv  
)vv  !
)vv! "
;vv" #
}ww 
returnyy 	
tempyy
 
;yy 
}zz 
}{{ 
}|| ˛3
jC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductos.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{		 
public

 
class

 
ListarProductos

 
{ 
	protected 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
public 
ListarProductos	 
( 
IUnitOfWork $

unitOfWork% /
)/ 0
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
} 
public 
ListarProductos	 
( 
) 
{ 
} 
public 
List	 
< 
ProductoRequest 
> &
ConvertirProductosARequest 9
(9 :
List: >
<> ?
Producto? G
>G H
	productosI R
)R S
{ 
List 
< 
ProductoRequest 
> 
request  
=! "
new# &
List' +
<+ ,
ProductoRequest, ;
>; <
(< =
)= >
;> ?
	productos 
. 
ForEach 
( 
x 
=> 
request !
.! "
Add" %
(% &
new& )
ProductoRequest* 9
(9 :
): ;
.; <
Map< ?
(? @
x@ A
)A B
)B C
)C D
;D E
return 	
request
 
; 
} 
public 
Response	 
GetAllProductos !
(! "
)" #
{ 
Response 
productoResponse 
= 
new "
Response# +
(+ ,
), -
;- .
productoResponse   
.   
Data   
=   &
ConvertirProductosARequest   5
(  5 6
this!! 
.!! 	
_unitOfWork!!	 
.!! 
ProductoRepository!! '
.!!' (
GetAll!!( .
(!!. /
)!!/ 0
.!!0 1
ToList!!1 7
(!!7 8
)!!8 9
)!!9 :
;!!: ;
return"" 	
productoResponse""
 
;"" 
}## 
public$$ 
Response$$	 
BuscarProducto$$  
($$  !
int$$! $
id$$% '
)$$' (
{%% 
Producto&& 
producto&& 
=&& 
this&& 
.&& 
_unitOfWork&& '
.&&' (
ProductoRepository&&( :
.&&: ;
FindBy'' 	
(''	 

producto''
 
=>'' 
producto'' 
.'' 
Id'' !
==''" $
id''% '
,''' (
includeProperties(( 
:(( 
$str(( $
)(($ %
.)) 
FirstOrDefault)) 
()) 
))) 
;)) 
if++ 
(++ 
producto++ 
==++ 
null++ 
)++ 
{,, 
return-- 

new-- 
Response-- 
{-- 
Mensaje-- !
=--" #
$"--$ &
El producto con Id --& 9
{--9 :
id--: <
}--< =
, no fue encontrado--= P
"--P Q
}--R S
;--S T
}..  
ProductoSubCategoria// 
subCategoria// $
=//% &
new//' *&
ListarSubCategoriasService//+ E
(//E F
this//F J
.//J K
_unitOfWork//K V
)//V W
.00 #
BuscarSubCategoriaConId00 
(00 
producto00 %
.00% &
SubCategoriaId00& 4
)004 5
;005 6
subCategoria11 
.11 
	Productos11 
=11 
null11  
;11  !
producto22 
.22 
SubCategoria22 
=22 
subCategoria22 '
;22' (
return44 	
new44
 
Response44 
{55 
Data66 
=66	 

new66 
ProductoRequest66 
(66 
)66  
.66  !
Map66! $
(66$ %
producto66% -
)66- .
}77 
;77 
}88 
public99 
Response99	 (
BuscarFabricaionesDeProducto99 .
(99. /
int99/ 2
id993 5
)995 6
{:: 
Producto;; 
producto;; 
=;; 
this;; 
.;; 
_unitOfWork;; '
.;;' (
ProductoRepository;;( :
.;;: ;
FindBy<< 	
(<<	 

producto<<
 
=><< 
producto<< 
.<< 
Id<< !
==<<" $
id<<% '
,<<' (
includeProperties== 
:== 
$str== >
)==> ?
.==? @
FirstOrDefault>> 
(>> 
)>> 
;>> 
if?? 
(?? 
producto?? 
==?? 
null?? 
)?? 
{@@ 
returnAA 

newAA 
ResponseAA 
{AA 
MensajeAA !
=AA" #
$"AA$ &
El producto con Id AA& 9
{AA9 :
idAA: <
}AA< =
, no fue encontradoAA= P
"AAP Q
}AAR S
;AAS T
}BB 
ifDD 
(DD 
productoDD 
.DD 
EspecificacionDD 
==DD !
EspecificacionDD" 0
.DD0 1
MateriaPrimaDD1 =
)DD= >
{EE 
returnFF 

newFF 
ResponseFF 
{GG 
MensajeHH 
=HH 
$"HH 
El producto HH 
{HH 
productoHH &
.HH& '
NombreHH' -
}HH- .

 no tiene HH. 8
"HH8 9
+HH: ;
$"II 4
(fabricaiones porque no se puede fabricarII 0
"II0 1
}JJ 
;JJ 
}KK 
returnLL 	
newLL
 
ResponseLL 
{MM 
DataNN 
=NN	 

newNN 
ProductoRequestNN 
(NN 
)NN  
.NN  !
MapNN! $
(NN$ %
productoNN% -
)NN- .
.NN. /
FabricacionesNN/ <
}OO 
;OO 
}PP 
}QQ 
}RR Û
sC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductosPaginados.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{		 
public

 
class

 $
ListarProductosPaginados

 &
{ 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
public $
ListarProductosPaginados	 !
(! "
IUnitOfWork" -

unitOfWork. 8
)8 9
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
} 
public 
Response	 
GetProductos 
( 
int "
page# '
,' (
int) ,
rows- 1
,1 2
string3 9

termSearch: D
=E F
$strG I
)I J
{ 
var 
allProducts 
= 
this 
. 
_unitOfWork %
.% &
ProductoRepository& 8
.8 9
GetAll9 ?
(? @
)@ A
;A B
List 
< 
Producto 
> 
	productos 
= 
allProducts )
. 
Where 

(
 
Producto 
=> 
Producto 
.  
Nombre  &
.& '
Contains' /
(/ 0

termSearch0 :
): ;
); <
. 
Skip 	
(	 

page
 
- 
$num 
) 
. 
Take 	
(	 

rows
 
) 
. 
ToList 
( 
) 
; 
return 	
new
 
Response 
{ 
Data 
=	 

new 
ListarProductos 
( 
)  
.  !&
ConvertirProductosARequest! ;
(; <
	productos< E
)E F
} 
; 
} 
}   
}!! ˛
uC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductosPorBusqueda.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public 
class &
ListarProductosPorBusqueda (
{ 
} 
}		 ª
vC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductosPorCategoria.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public		 
class		 '
ListarProductosPorCategoria		 )
{

 
private 	
readonly
 
IUnitOfWork 

unitOfWork )
;) *
private 	
readonly
 
ListarProductos "
listarProductos# 2
;2 3
public '
ListarProductosPorCategoria	 $
($ %
IUnitOfWork% 0

unitOfWork1 ;
); <
{ 
this 
. 

unitOfWork 
= 

unitOfWork 
;  
this 
. 
listarProductos 
= 
new 
ListarProductos -
(- .
this. 2
.2 3

unitOfWork3 =
)= >
;> ?
} 
public 
List	 
< 
ProductoRequest 
> 
Get "
(" #
int# &
id' )
)) *
{ 
var 

categorias 
= 
this 
. 

unitOfWork #
.# $
CategoriaRepository$ 7
. 
FindBy 
( 
x 
=> 
x 
. 
Id 
== 
id 
, 
includeProperties .
:. /
$str0 I
)I J
. 
FirstOrDefault 
( 
) 
; 
var 
	productos 
= 
new 
List 
< 
Producto $
>$ %
(% &
)& '
;' (

categorias 
. 
SubCategorias 
. 
ForEach #
(# $
sub$ '
=>( *
sub+ .
.. /
	Productos/ 8
.8 9
ForEach9 @
(@ A
prodA E
=>F H
	productosI R
.R S
AddS V
(V W
prodW [
)[ \
)\ ]
)] ^
;^ _
return 	
listarProductos
 
. &
ConvertirProductosARequest 4
(4 5
	productos5 >
)> ?
;? @
} 
} 
}   â
yC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductosPorSubCategoria.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public 
class *
ListarProductosPorSubCategoria ,
{		 
private

 	
readonly


 
IUnitOfWork

 
_unitOfWork

 *
;

* +
private 	
readonly
 
ListarProductos "
listarProductos# 2
;2 3
public *
ListarProductosPorSubCategoria	 '
(' (
IUnitOfWork( 3

unitOfWork4 >
)> ?
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
this 
. 
listarProductos 
= 
new 
ListarProductos -
(- .
). /
;/ 0
} 
public 
List	 
< 
ProductoRequest 
> 
Get "
(" #
int# &
idSubCategoria' 5
)5 6
{ 
var 
	productos 
= 
this 
. 
_unitOfWork #
.# $
ProductoRepository$ 6
. 
FindBy 
( 
x 
=> 
x 
. 
SubCategoriaId !
==" $
idSubCategoria% 3
)3 4
.4 5
ToList5 ;
(; <
)< =
;= >
return 	
this
 
. 
listarProductos 
. &
ConvertirProductosARequest 9
(9 :
	productos: C
)C D
;D E
} 
} 
} Î
qC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ListarProductosPorTipo.cs
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
;+ ,
if 
( 
! 
filtrado 
. 
Any 
( 
) 
)  
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$"0 2%
No hay productos de tipo 2 K
{K L
_tipoL Q
.Q R
ToStringR Z
(Z [
)[ \
}\ ]
"] ^
}_ `
;` a
} 
return 
new 
Response 
{ 
Data 
= 
this 
. &
ConvertirProductosARequest 6
(6 7
filtrado7 ?
.? @
ToList@ F
(F G
)G H
)H I
} 
; 
}   	
}!! 
}"" ‘,
oC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoCrearService.cs
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
class  
ProductoCrearService %
:& '
ProductoService( 7
{ 
public  
ProductoCrearService #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
:< =
base> B
(B C

unitOfWorkC M
)M N
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
,- .
request/ 6
.6 7(
PorcentajeDeUtilidadProducto7 S
)S T
;T U
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
;L M 
ProductoSubCategoria  
subCategoria! -
=. /#
BuscarSubCategoriaConId0 G
(G H
requestH O
.O P
IdSubCategoriaP ^
)^ _
;_ `
if 
( 
subCategoria 
== 
null  $
)$ %
{ 
return 
new 
Response #
{   
Mensaje!! 
=!! 
$str!! A
}"" 
;"" 
}## 
Producto%% 
producto%% 
=%% 
this%%  $
.%%$ %
_unitOfWork%%% 0
.%%0 1
ProductoRepository%%1 C
.%%C D
FindFirstOrDefault&& "
(&&" #
t&&# $
=>&&% '
t&&( )
.&&) *
Nombre&&* 0
==&&1 3
request&&4 ;
.&&; <
NombreProducto&&< J
)&&J K
;&&K L
if(( 
((( 
producto(( 
!=(( 
null((  
)((  !
return)) 
new)) 
Response)) #
{))$ %
Mensaje))& -
=)). /
$str))0 G
}))H I
;))I J
try** 
{++ 
producto,, 
=,, 
new,,  
CrearProductoFactory,, 3
(,,3 4
request,,4 ;
.,,; <
Tipo,,< @
),,@ A
.,,A B
CrearProducto-- 
(-- 
request-- %
.--% &
Especificacion--& 4
)--4 5
;--5 6
}.. 
catch// 
(// %
InvalidOperationException// ,
e//- .
)//. /
{00 
return11 
new11 
Response11 #
{11$ %
Mensaje11& -
=11. /
e110 1
.111 2
Message112 9
}11: ;
;11; <
}22 
var33 

emboltorio33 
=33 
this33 !
.33! "
_unitOfWork33" -
.33- .
ProductoRepository33. @
.44 
FindFirstOrDefault44 #
(44# $
x44$ %
=>44& (
x44) *
.44* +
Id44+ -
==44. 0
request441 8
.448 9
IdEmboltorio449 E
)44E F
;44F G
producto66 
.66 
	SetNombre66 
(66 
request66 &
.66& '
NombreProducto66' 5
)665 6
.666 7
SetCantidad667 B
(66B C
request66C J
.66J K
CantidadProducto66K [
)66[ \
.66\ ]
SetCostoUnitario77  
(77  !
request77! (
.77( )!
CostoUnitarioProducto77) >
)77> ?
.77? @#
SetPorcentajeDeUtilidad88 '
(88' (
request88( /
.88/ 0(
PorcentajeDeUtilidadProducto880 L
)88L M
.88M N
SetUnidadDeMedida99 !
(99! "
request99" )
.99) *"
UnidadDeMedidaProducto99* @
)99@ A
;99A B
producto:: 
.:: 
SetEnvoltorio:: "
(::" #

emboltorio::# -
)::- .
;::. /
producto;; 
.;; 
SetSubCategoria;; $
(;;$ %
subCategoria;;% 1
);;1 2
;;;2 3
this== 
.== 
_unitOfWork== 
.== 
ProductoRepository== /
.==/ 0
Add==0 3
(==3 4
producto==4 <
)==< =
;=== >
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
$strAA 9
,AA9 :
DataBB 
=BB 
newBB 
ProductoRequestBB *
(BB* +
)BB+ ,
.BB, -
MapBB- 0
(BB0 1
productoBB1 9
)BB9 :
}CC 
;CC 
}DD 	
}FF 
}GG á
jC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\ProductoServices\ProductoService.cs
	namespace 	
Application
 
. 
Services 
. 
ProductoServices /
{ 
public		 

abstract		 
class		 
ProductoService		 )
{

 
	protected 
IUnitOfWork 
_unitOfWork )
;) *
	protected 
ProductoService !
(! "
IUnitOfWork" -

unitOfWork. 8
)8 9
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
	protected 
IEnumerable 
< 
Producto &
>& '
GetProductos( 4
(4 5
)5 6
{ 	
return 
_unitOfWork 
. 
ProductoRepository 1
.1 2
FindBy2 8
(8 9
)9 :
;: ;
} 	
	protected 
ProductoRequest !
Map" %
(% &
Producto& .
producto/ 7
)7 8
{ 	
ProductoRequest 
request #
=$ %
new& )
ProductoRequest* 9
(9 :
): ;
;; <
return 
request 
. 
Map 
( 
producto '
)' (
;( )
} 	
	protected  
ProductoSubCategoria &#
BuscarSubCategoriaConId' >
(> ?
int? B
idSubcategoriaC Q
)Q R
{ 	
return 
this 
. 
_unitOfWork #
.# $"
SubCategoriaRepository$ :
.: ;
FindFirstOrDefault "
(" #
subCategoria# /
=>0 2
subCategoria3 ?
.? @
Id@ B
==C E
idSubcategoriaE S
)S T
;T U
} 	
public 
abstract 
Response  
Crear! &
(& '
ProductoRequest' 6
request7 >
)> ?
;? @
} 
}   ¬
äC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ClienteServices\ActualizarTerceroClienteService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
ClienteServices0 ?
{ 
public 
class +
ActualizarTerceroClienteService -
{		 
public

 +
ActualizarTerceroClienteService

	 (
(

( )
)

) *
{ 
} 
} 
} €
âC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ClienteServices\ListarClientesPaginadosService.cs
	namespace		 	
Application		
 
.		 
Services		 
.		 
TercerosServices		 /
.		/ 0
ClienteServices		0 ?
{

 
public 

class *
ListarClientesPaginadosService /
:0 1
IGetPaginados2 ?
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public *
ListarClientesPaginadosService -
(- .
IUnitOfWork. 9

unitOfWork: D
)D E
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
GetPaginados $
($ %
PaginationRequest% 6
request7 >
)> ?
{ 	
var 
allProducts 
= 
this "
." #
_unitOfWork# .
.. /$
TerceroClienteRepository/ G
. 
FindBy #
(# $
includeProperties$ 5
:5 6
$str7 @
)@ A
;A B
List 
< 
TerceroCliente 
>  
terceros! )
=* +
allProducts, 7
. 
Where 
( 
tercero 
=> !
tercero" )
.) *
Tercero* 1
.1 2
RazonSocial2 =
.= >
Contains> F
(F G
requestG N
.N O

TermSearchO Y
)Y Z
)Z [
. 
Skip 
( 
request 
. 
Page "
-# $
$num% &
)& '
. 
Take 
( 
request 
. 
Rows "
)" #
.# $
ToList$ *
(* +
)+ ,
;, -
return 
new 
Response 
{ 
Data 
= (
ConvertirProveedoresARequest 3
(3 4
terceros4 <
)< =
} 
; 
}   	
private!! 
List!! 
<!! !
TerceroClienteRequest!! *
>!!* +(
ConvertirProveedoresARequest!!, H
(!!H I
List!!I M
<!!M N
TerceroCliente!!N \
>!!\ ]
terceros!!^ f
)!!f g
{"" 	
List## 
<## !
TerceroClienteRequest## &
>##& '
request##( /
=##0 1
new##2 5
List##6 :
<##: ;!
TerceroClienteRequest##; P
>##P Q
(##Q R
)##R S
;##S T
terceros$$ 
.$$ 
ForEach$$ 
($$ 
x$$ 
=>$$ !
request$$" )
.$$) *
Add$$* -
($$- .
new$$. 1!
TerceroClienteRequest$$2 G
($$G H
)$$H I
.$$I J
Map$$J M
($$M N
x$$N O
)$$O P
)$$P Q
)$$Q R
;$$R S
return%% 
request%% 
;%% 
}&& 	
}'' 
}(( ê?
ÖC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ClienteServices\TerceroClienteCrearService.cs
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
}XX ©
rC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\Contracts\IGetPaginados.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
	Contracts0 9
{ 
public 

	interface 
IGetPaginados "
{ 
Response 
GetPaginados 
( 
PaginationRequest /
request0 7
)7 8
;8 9
}		 
}

 ™
{C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\EmpleadoServices\ListarEmpleados.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
EmpleadoServices0 @
{ 
public 
class 
ListarEmpleados 
{		 
private

 	
readonly


 
IUnitOfWork

 
_unitOfWork

 *
;

* +
public 
ListarEmpleados	 
( 
IUnitOfWork $

unitOfWork% /
)/ 0
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
} 
public 
ListarEmpleados	 
( 
) 
{ 
} 
public 
Response	 
Get 
( 
) 
{ 
var 
	empleados 
= 
this 
. 
_unitOfWork #
.# $%
TerceroEmpleadoRepository$ =
. 
FindBy 
( 
includeProperties 
: 
$str (
)( )
.) *
ToList* 0
(0 1
)1 2
;2 3
if 
( 
! 
	empleados 
. 
Any 
( 
) 
) 
{ 
return 

new 
Response 
{ 
Mensaje !
=" #
$str$ C
}D E
;E F
} 
return 	
new
 
Response 
{ 
Data 
= .
"ConvertirTercerosEmpleadosARequest  B
(B C
	empleadosC L
)L M
}N O
;O P
} 
public 
List	 
< "
TerceroEmpleadoRequest $
>$ %.
"ConvertirTercerosEmpleadosARequest& H
(H I
ListI M
<M N
TerceroEmpleadoN ]
>] ^
terceros_ g
)g h
{ 
List   
<   "
TerceroEmpleadoRequest   
>   
request    '
=  ( )
new  * -
List  . 2
<  2 3"
TerceroEmpleadoRequest  3 I
>  I J
(  J K
)  K L
;  L M
terceros!! 
.!! 
ForEach!! 
(!! 
x!! 
=>!! 
request!!  
.!!  !
Add!!! $
(!!$ %
new!!% ("
TerceroEmpleadoRequest!!) ?
(!!? @
)!!@ A
.!!A B
Map!!B E
(!!E F
x!!F G
)!!G H
)!!H I
)!!I J
;!!J K
return"" 	
request""
 
;"" 
}## 
}$$ 
}%% ∂
ãC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\EmpleadoServices\ListarEmpleadosPaginadosService.cs
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
public		 
class		 +
ListarEmpleadosPaginadosService		 -
{

 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
private 	
readonly
 
ListarEmpleados "
listarEmpleados# 2
;2 3
public +
ListarEmpleadosPaginadosService	 (
(( )
IUnitOfWork) 4

unitOfWork5 ?
)? @
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
this 
. 
listarEmpleados 
= 
new 
ListarEmpleados -
(- .
). /
;/ 0
} 
public 
Response	 
Get 
( 
PaginationRequest '
request( /
)/ 0
{ 
var 
allProducts 
= 
this 
. 
_unitOfWork %
.% &%
TerceroEmpleadoRepository& ?
. 
FindBy 
( 
includeProperties 
: 
$str (
)( )
;) *
List 
< 
TerceroEmpleado 
> 
terceros !
=" #
allProducts$ /
. 
Where 

(
 
tercero 
=> 
tercero 
. 
Tercero %
.% &
RazonSocial& 1
.1 2
Contains2 :
(: ;
request; B
.B C

TermSearchC M
)M N
)N O
. 
Skip 	
(	 

request
 
. 
Page 
- 
$num 
) 
. 
Take 	
(	 

request
 
. 
Rows 
) 
. 
ToList 
( 
)  
;  !
return 	
new
 
Response 
{ 
Data 
=	 

this 
. 
listarEmpleados 
.  .
"ConvertirTercerosEmpleadosARequest  B
(B C
tercerosC K
)K L
} 
; 
}   
}!! 
}"" Æ
ÜC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\EmpleadoServices\ListarEmpleadosPorBusqueda.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
EmpleadoServices0 @
{ 
public 
class &
ListarEmpleadosPorBusqueda (
{		 
private

 	
readonly


 
IUnitOfWork

 
_unitOfWork

 *
;

* +
private 	
readonly
 
ListarEmpleados "
_listarEmpleados# 3
;3 4
public &
ListarEmpleadosPorBusqueda	 #
(# $
IUnitOfWork$ /

unitOfWork0 :
): ;
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
this 
. 
_listarEmpleados 
= 
new 
ListarEmpleados .
(. /
)/ 0
;0 1
} 
public 
List	 
< "
TerceroEmpleadoRequest $
>$ %
GetList& -
(- .
string. 4
search5 ;
); <
{ 

IQueryable 
< 
TerceroEmpleado 
> 
	empleados (
=) *
this+ /
./ 0
_unitOfWork0 ;
. %
TerceroEmpleadoRepository 
. 
FindBy 
( 
includeProperties 
: 
$str (
)( )
;) *
	empleados 
= 
	empleados 
. 
Where 
( 
x  
=>! #
x$ %
.% &
Tercero& -
.- .
RazonSocial. 9
.9 :
Contains: B
(B C
searchC I
)I J
)J K
;K L
return 	
this
 
. 
_listarEmpleados 
. .
"ConvertirTercerosEmpleadosARequest '
(' (
	empleados( 1
.1 2
ToList2 8
(8 9
)9 :
): ;
;; <
} 
} 
} œ
àC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\EmpleadoServices\TerceroEmpleadoBuscarService.cs
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
$strI \
)\ ]
. 
FirstOrDefault 
( 
) 
; 
if 
( 
empleado 
== 
null  
)  !
{ 
return 
new 
Response #
{ 
Mensaje 
= 
$str :
} 
; 
} 
return 
new 
Response 
{ 
Data 
= 
new "
TerceroEmpleadoRequest 1
(1 2
)2 3
.3 4
Map4 7
(7 8
empleado8 @
)@ A
}   
;   
}!! 	
}"" 
}## É
áC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\EmpleadoServices\TerceroEmpleadoCrearService.cs
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
}00 ≥
~C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ProveedorServices\ListarProveedores.cs
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
public 
class 
ListarProveedores 
{		 
private

 	
readonly


 
IUnitOfWork

 
_unitOfWork

 *
;

* +
public 
ListarProveedores	 
( 
IUnitOfWork &

unitOfWork' 1
)1 2
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
} 
public 
ListarProveedores	 
( 
) 
{ 
} 
public 
Response	 
Get 
( 
) 
{ 
var 
proveedores 
= 
this 
. 
_unitOfWork %
.% &%
TerceroProvedorRepository& ?
. 
FindBy 
( 
includeProperties 
: 
$str (
)( )
.) *
ToList* 0
(0 1
)1 2
;2 3
if 
( 
! 
proveedores 
. 
Any 
( 
) 
) 
{ 
return 

new 
Response 
{ 
Mensaje !
=" #
$str$ E
}F G
;G H
} 
return 	
new
 
Response 
{ 
Data 
= (
ConvertirProveedoresARequest  <
(< =
proveedores= H
)H I
}J K
;K L
} 
public 
List	 
< #
TerceroProveedorRequest %
>% &(
ConvertirProveedoresARequest' C
(C D
ListD H
<H I
TerceroProveedorI Y
>Y Z
terceros[ c
)c d
{ 
List   
<   #
TerceroProveedorRequest   
>    
request  ! (
=  ) *
new  + .
List  / 3
<  3 4#
TerceroProveedorRequest  4 K
>  K L
(  L M
)  M N
;  N O
terceros!! 
.!! 
ForEach!! 
(!! 
x!! 
=>!! 
request!!  
.!!  !
Add!!! $
(!!$ %
new!!% (#
TerceroProveedorRequest!!) @
(!!@ A
)!!A B
.!!B C
Map!!C F
(!!F G
x!!G H
)!!H I
)!!I J
)!!J K
;!!K L
return"" 	
request""
 
;"" 
}## 
}$$ 
}%% Æ
éC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ProveedorServices\ListarProveedoresPaginadosService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
ProveedorServices0 A
{ 
public		 
class		 -
!ListarProveedoresPaginadosService		 /
{

 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
private 	
readonly
 
ListarProveedores $
_listar% ,
;, -
public -
!ListarProveedoresPaginadosService	 *
(* +
IUnitOfWork+ 6

unitOfWork7 A
)A B
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
this 
. 
_listar 
= 
new 
ListarProveedores '
(' (
)( )
;) *
} 
public 
Response	 
GetPaginados 
( 
PaginationRequest 0
request1 8
)8 9
{ 
var 
allProducts 
= 
this 
. 
_unitOfWork %
.% &%
TerceroProvedorRepository& ?
. 
FindBy 
( 
includeProperties 
: 
$str (
)( )
;) *
List 
< 
TerceroProveedor 
> 
terceros "
=# $
allProducts% 0
. 
Where 

(
 
tercero 
=> 
tercero 
. 
Tercero %
.% &
RazonSocial& 1
.1 2
Contains2 :
(: ;
request; B
.B C

TermSearchC M
)M N
)N O
. 
Skip 	
(	 

request
 
. 
Page 
- 
$num 
) 
. 
Take 	
(	 

request
 
. 
Rows 
) 
. 
ToList 
( 
)  
;  !
return 	
new
 
Response 
{ 
Data 
=	 

this 
. 
_listar 
. (
ConvertirProveedoresARequest 4
(4 5
terceros5 =
)= >
} 
; 
}   
}"" 
}## å
âC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\ProveedorServices\TerceroProveedorCrearService.cs
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
( #
TerceroProveedorRequest 5
request6 =
)= >
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
new,, #
TerceroProveedorRequest,, 2
(,,2 3
),,3 4
.,,4 5
Map,,5 8
(,,8 9
provedor,,9 A
),,A B
}-- 
;-- 
}.. 	
}// 
}00 ç
âC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\TerceroServices\ListarTercerosPaginadosService.cs
	namespace 	
Application
 
. 
Services 
. 
TercerosServices /
./ 0
TerceroServices0 ?
{		 
public

 

class

 *
ListarTercerosPaginadosService

 /
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public *
ListarTercerosPaginadosService -
(- .
IUnitOfWork. 9

unitOfWork: D
)D E
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
public 
Response 
Get 
( 
PaginationRequest -
request. 5
)5 6
{ 	
var 
allProducts 
= 
this "
." #
_unitOfWork# .
.. /
TerceroRepository/ @
.@ A
GetAllA G
(G H
)H I
;I J
List 
< 
Tercero 
> 
terceros "
=# $
allProducts% 0
. 
Where 
( 
tercero 
=> !
tercero" )
.) *
RazonSocial* 5
.5 6
Contains6 >
(> ?
request? F
.F G

TermSearchG Q
)Q R
)R S
. 
Skip 
( 
request 
. 
Page "
-# $
$num% &
)& '
. 
Take 
( 
request 
. 
Rows "
)" #
.# $
ToList$ *
(* +
)+ ,
;, -
return 
new 
Response 
{ 
Data 
= %
ConvertirTercerosARequest 0
(0 1
terceros1 9
)9 :
} 
; 
} 	
private 
List 
< 
TerceroRequest #
># $%
ConvertirTercerosARequest% >
(> ?
List? C
<C D
TerceroD K
>K L
tercerosM U
)U V
{   	
List!! 
<!! 
TerceroRequest!! 
>!!  
request!!! (
=!!) *
new!!+ .
List!!/ 3
<!!3 4
TerceroRequest!!4 B
>!!B C
(!!C D
)!!D E
;!!E F
terceros"" 
."" 
ForEach"" 
("" 
x"" 
=>"" !
request""" )
."") *
Add""* -
(""- .
new"". 1
TerceroRequest""2 @
(""@ A
)""A B
.""B C
Map""C F
(""F G
x""G H
)""H I
)""I J
)""J K
;""K L
return## 
request## 
;## 
}$$ 	
}%% 
}&& √
~C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\TerceroServices\TerceroCrearService.cs
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
C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\TerceroServices\TerceroGetAllService.cs
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
} ·
{C:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\UsuarioServices\RoleCrearService.cs
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
class 
RoleCrearService !
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
public 
RoleCrearService 
(  
IUnitOfWork  +

unitOfWork, 6
)6 7
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
( 
RoleRequest )
request* 1
)1 2
{ 	
Role 
role 
= 
this 
. 
_unitOfWork (
.( )
RoleRepository) 7
.7 8
FindFirstOrDefault "
(" #
role# '
=>( *
role+ /
./ 0
Nombre0 6
==7 9
request: A
.A B
NombreB H
)H I
;I J
if 
( 
role 
!= 
null 
) 
{ 
return 
new 
Response #
{$ %
Mensaje& -
=. /
$str0 T
}U V
;V W
} 
role 
= 
new 
Role 
( 
) 
; 
role 
. 
Nombre 
= 
request !
.! "
Nombre" (
;( )
this 
. 
_unitOfWork 
. 
RoleRepository +
.+ ,
Add, /
(/ 0
role0 4
)4 5
;5 6
this 
. 
_unitOfWork 
. 
Commit #
(# $
)$ %
;% &
return 
new 
Response 
{  !
Mensaje" )
=* +
$str, P
}Q R
;R S
} 	
} 
}   ≈%
ÖC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\UsuarioServices\TerceroUsuarioCrearService.cs
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
} 
Role 
role 
= 
this 
. 
_unitOfWork (
.( )
RoleRepository) 7
.7 8
FindFirstOrDefault "
(" #
role# '
=>( *
role+ /
./ 0
Nombre0 6
==7 9
request: A
.A B
RoleB F
.F G
NombreG M
)M N
;N O
if!! 
(!! 
role!! 
==!! 
null!! 
)!! 
{"" 
return## 
new## 
Response## #
{$$ 
Mensaje%% 
=%% 
$"%%  
El role %%  (
{%%( )
request%%) 0
.%%0 1
Role%%1 5
.%%5 6
Nombre%%6 <
}%%< =
 que le desea%%= J
"%%J K
+%%L M
$"&& 1
%asignar al usuario no esta disponible&& ;
"&&; <
}'' 
;'' 
}(( 
TerceroUsuario** 
terceroUsuario** )
=*** +
new**, /
TerceroUsuario**0 >
.**> ?!
TerceroUsuarioBuilder**? T
(**T U
tercero**U \
)**\ ]
.**] ^
SetPassword++ 
(++ 
request++ #
.++# $
PasswordTercero++$ 3
)++3 4
.++4 5

SetUsuario++5 ?
(++? @
request++@ G
.++G H
UsuarioTercero++H V
)++V W
.++W X
SetRol,, 
(,, 
role,, 
),, 
.,, 
Build,, "
(,," #
),,# $
;,,$ %
this.. 
... 
_unitOfWork.. 
... $
TerceroUsuarioRepository.. 5
...5 6
Add..6 9
(..9 :
terceroUsuario..: H
)..H I
;..I J
this// 
.// 
_unitOfWork// 
.// 
Commit// #
(//# $
)//$ %
;//% &
return00 
new00 
Response00 
{11 
Mensaje22 
=22 
$str22 8
,228 9
Data33 
=33 
request33 
.33 
Map33 "
(33" #
terceroUsuario33# 1
)331 2
}44 
;44 
}66 	
}77 
}88 ¡
áC:\Users\duvan\source\repos\CompositePruebaDulces\Application\Services\TercerosServices\UsuarioServices\TerceroUsuarioValidarService.cs
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
$strP ^
)^ _
._ `
FirstOrDefault` n
(n o
)o p
;p q
} 	
} 
} 