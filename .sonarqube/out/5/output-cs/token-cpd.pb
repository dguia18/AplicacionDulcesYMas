Ô
`C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Authentication\ITokenProvider.cs
	namespace 	
WebApi
 
. 
Authentication 
{ 
public 

	interface 
ITokenProvider #
{ 
string		 
CreateToken		 
(		 
TerceroUsuario		 )
user		* .
,		. /
DateTime		0 8
expiry		9 ?
)		? @
;		@ A%
TokenValidationParameters

 !#
GetValidationParameters

" 9
(

9 :
)

: ;
;

; <
} 
} £
^C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Authentication\JsonWebToken.cs
	namespace 	
WebApi
 
. 
Authentication 
{ 
public 

class 
JsonWebToken 
{ 
public 
string 
AccessToken !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
	TokenType 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
	ExpiresIn 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
string		 
RefreshToken		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
} 
} É+
]C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Authentication\JwtProvider.cs
	namespace

 	
WebApi


 
.

 
Authentication

 
{ 
public 

class 
JwtProvider 
: 
ITokenProvider -
{ 
private 
readonly 
RsaSecurityKey '
_key( ,
;, -
private 
readonly 
string 
	_algoritm  )
;) *
private 
readonly 
string 
_issuer  '
;' (
private 
readonly 
string 
	_audience  )
;) *
public 
JwtProvider 
( 
string !
issuer" (
,( )
string* 0
audience1 9
,9 :
string; A
keyNameB I
)I J
{ 	
var 

parameters 
= 
new  
CspParameters! .
(. /
)/ 0
{1 2
KeyContainerName3 C
=D E
keyNameF M
}N O
;O P
var 
provider 
= 
new $
RSACryptoServiceProvider 7
(7 8
$num8 <
,< =

parameters> H
)H I
;I J
this 
. 
_key 
= 
new 
RsaSecurityKey *
(* +
provider+ 3
)3 4
;4 5
this 
. 
	_algoritm 
= 
SecurityAlgorithms /
./ 0
RsaSha256Signature0 B
;B C
this 
. 
_issuer 
= 
issuer !
;! "
this 
. 
	_audience 
= 
audience %
;% &
} 	
public 
string 
CreateToken !
(! "
TerceroUsuario" 0
user1 5
,5 6
DateTime7 ?
expiry@ F
)F G
{ 	#
JwtSecurityTokenHandler #
tokenHandler$ 0
=1 2
new3 6#
JwtSecurityTokenHandler7 N
(N O
)O P
;P Q
var 
identity 
= 
new 
ClaimsIdentity -
(- .
new. 1
List2 6
<6 7
Claim7 <
>< =
(= >
)> ?
{ 
new   
Claim   
(   

ClaimTypes   $
.  $ %
Name  % )
,  ) *
$"  * ,
{  , -
user  - 1
.  1 2
Tercero  2 9
.  9 :
RazonSocial  : E
}  E F
"  F G
)  G H
,  H I
new!! 
Claim!! 
(!! 

ClaimTypes!! $
.!!$ %
Role!!% )
,!!) *
user!!* .
.!!. /
Role!!/ 3
.!!3 4
ToString!!4 <
(!!< =
)!!= >
)!!> ?
,!!? @
new"" 
Claim"" 
("" 

ClaimTypes"" $
.""$ %

PrimarySid""% /
,""/ 0
user""0 4
.""4 5
Id""5 7
.""7 8
ToString""8 @
(""@ A
)""A B
)""B C
}## 
,## 
$str## 
)$$ 
;$$ 
SecurityToken%% 
token%% 
=%%  !
tokenHandler%%" .
.%%. /"
CreateJwtSecurityToken%%/ E
(%%E F
new&& #
SecurityTokenDescriptor&& +
{'' 
Audience(( 
=(( 
this(( #
.((# $
	_audience(($ -
,((- .
Issuer)) 
=)) 
this)) !
.))! "
_issuer))" )
,))) *
SigningCredentials** &
=**' (
new**) ,
SigningCredentials**- ?
(**? @
this**@ D
.**D E
_key**E I
,**I J
this**K O
.**O P
	_algoritm**P Y
)**Y Z
,**Z [
Expires++ 
=++ 
expiry++ $
.++$ %
ToUniversalTime++% 4
(++4 5
)++5 6
,++6 7
Subject,, 
=,, 
identity,, &
}-- 
)-- 
;-- 
return.. 
tokenHandler.. 
...  

WriteToken..  *
(..* +
token..+ 0
)..0 1
;..1 2
}// 	
public11 %
TokenValidationParameters11 (#
GetValidationParameters11) @
(11@ A
)11A B
{22 	
return33 
new33 %
TokenValidationParameters33 0
{44 
IssuerSigningKey55  
=55! "
this55# '
.55' (
_key55( ,
,55, -
ValidAudience66 
=66 
this66  $
.66$ %
	_audience66% .
,66. /
ValidIssuer77 
=77 
this77 "
.77" #
_issuer77# *
,77* +
ValidateLifetime88  
=88! "
true88# '
,88' (
	ClockSkew99 
=99 
TimeSpan99 $
.99$ %
FromSeconds99% 0
(990 1
$num991 2
)992 3
}:: 
;:: 
};; 	
}<< 
}== ∞
bC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\CategoriaController.cs
	namespace 	
WebApiAngular
 
. 
Controllers #
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 
CategoriaController

 $
:

% &
ControllerBase

' 5
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
CategoriaController "
(" #
IUnitOfWork# .

unitOfWork/ 9
)9 :
{ 	
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
[ 	
HttpPost	 
] 
public 
ActionResult 
< 
Response $
>$ %
PostCategoria& 3
(3 4$
ProductoCategoriaRequest4 L
requestM T
)T U
{ 	
Response 
response 
= 
new  #)
ProductoCategoriaCrearService$ A
(A B
thisB F
.F G
_unitOfWorkG R
)R S
.S T
CrearT Y
(Y Z
requestZ a
)a b
;b c
return 
Ok 
( 
response 
) 
;  
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
GetCategorias *
(* +
)+ ,
{ 	
Response 
response 
= 
new  ##
ListarCategoriasService$ ;
(; <
this< @
.@ A
_unitOfWorkA L
)L M
. 
GetCategorias 
( 
)  
;  !
if 
( 
response 
. 
Data 
==  
null! %
)% &
{ 
return 
NotFound 
(  
response  (
.( )
Mensaje) 0
)0 1
;1 2
} 
else   
return!! 
Ok!! 
(!! 
response!! "
)!!" #
;!!# $
}"" 	
[## 	
HttpPost##	 
(## 
$str##  
)##  !
]##! "
public$$ 
ActionResult$$ 
<$$ 
Response$$ $
>$$$ %
AgregarSubCategoria$$& 9
($$9 :'
ProductoSubCategoriaRequest$$: U
request$$V ]
)$$] ^
{%% 	
Response&& 
response&& 
=&& 
new&&  #7
+ProductoCategoriaAgregarSubCategoriaService&&$ O
(&&O P
this&&P T
.&&T U
_unitOfWork&&U `
)&&` a
.&&a b
Agregar'' 
('' 
request'' 
)''  
;''  !
return(( 
Ok(( 
((( 
response(( 
)(( 
;((  
})) 	
[** 	
HttpGet**	 
(** 
$str** 
)**  
]**  !
public++ 
ActionResult++ 
<++ 
Response++ $
>++$ %
GetSubCategorias++& 6
(++6 7
)++7 8
{,, 	
Response-- 
response-- 
=-- 
new--  #&
ListarSubCategoriasService--$ >
(--> ?
this--? C
.--C D
_unitOfWork--D O
)--O P
.--P Q
GetSubCategorias..  
(..  !
)..! "
;.." #
return// 
Ok// 
(// 
response// 
)// 
;//  
}00 	
}11 
}22 ô
_C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\CompraController.cs
	namespace 	
WebApiAngular
 
. 
Controllers #
{		 
[

 
Route

 
(

 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 
class 
CompraController 
:  
ControllerBase! /
{ 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
public 
CompraController	 
( 
IUnitOfWork %

unitOfWork& 0
)0 1
{ 
this 
. 
_unitOfWork 
= 

unitOfWork  
;  !
} 
[ 
HttpPost 
( 
$str 
) 
] 
public 
ActionResult	 
< 
Response 
> 
HacerCompra  +
(+ ,
CompraRequest, 9
request: A
)A B
{ 
Response 
response 
= 
new 
CompraService (
(( )
_unitOfWork) 4
)4 5
.5 6
HacerCompraService6 H
(H I
requestI P
)P Q
;Q R
if 
( 
response 
. 
Data 
== 
null 
) 
{ 
return 


BadRequest 
( 
response 
. 
Mensaje &
)& '
;' (
} 
return 	
Ok
 
( 
response 
) 
; 
} 
[ 
HttpPost 
( 
$str 
) 
] 
public   
IActionResult  	 
GetPaginados   #
(  # $
PaginationRequest  $ 5
request  6 =
)  = >
{!! 
var"" 
response"" 
="" 
new"" )
ListarComprasPaginadasService"" 3
(""3 4
this""4 8
.""8 9
_unitOfWork""9 D
)""D E
.## 
GetPaginados## 
(## 
request## 
)## 
;## 
if$$ 
($$ 
response$$ 
.$$ 
Count$$ 
==$$ 
$num$$ 
)$$ 
return%% 

NotFound%% 
(%% 
$str%% >
)%%> ?
;%%? @
return&& 	
Ok&&
 
(&& 
response&& 
)&& 
;&& 
}'' 
}(( 
})) ÒE
aC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\ProductoController.cs
	namespace

 	
WebApi


 
.

 
Controllers

 
{ 
[ 
Route 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 
class 
ProductoController  
:! "
ControllerBase# 1
{ 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
public 
ProductoController	 
( 
IUnitOfWork '

unitOfWork( 2
)2 3
{ 
_unitOfWork 
= 

unitOfWork 
; 
} 
[ 
HttpPost 
( 
$str 
) 
] 
public 
IActionResult	 
Post 
( 
ProductoRequest +
productoRequest, ;
); <
{ 
Response 
response 
= 
new  
ProductoCrearService /
(/ 0
_unitOfWork0 ;
); <
.< =
Crear 
( 	
productoRequest	 
) 
; 
if 
( 
response 
. 
Data 
== 
null 
) 
{ 
return   


BadRequest   
(   
response   
.   
Mensaje   &
)  & '
;  ' (
}!! 
return"" 	
Ok""
 
("" 
response"" 
)"" 
;"" 
}## 
[%% 
HttpGet%% 

(%%
 
$str%% 
)%% 
]%% 
public&& 
IActionResult&&	 
GetProductosPorTipo&& *
(&&* +
Tipo&&+ /
tipo&&0 4
)&&4 5
{'' 
Response(( 
response(( 
=(( 
new(( "
ListarProductosPorTipo(( 1
(((1 2
this((2 6
.((6 7
_unitOfWork((7 B
)((B C
.((C D
EstablecerTipo)) 
()) 
tipo)) 
))) 
.)) 
Filtrar)) 
())  
)))  !
;))! "
if** 
(** 
response** 
.** 
Data** 
==** 
null** 
)** 
return++ 

NotFound++ 
(++ 
response++ 
.++ 
Mensaje++ $
)++$ %
;++% &
return,, 	
Ok,,
 
(,, 
response,, 
),, 
;,, 
}-- 
[// 
HttpGet// 

(//
 
$str// 
)//  
]//  !
public00 
IActionResult00	 $
GetProductosPorCategoria00 /
(00/ 0
int000 3
id004 6
)006 7
{11 
var22 
response22 
=22 
new22 '
ListarProductosPorCategoria22 1
(221 2
this222 6
.226 7
_unitOfWork227 B
)22B C
.22C D
Get33 
(33 
id33 	
)33	 

;33
 
if44 
(44 
response44 
.44 
Count44 
==44 
$num44 
)44 
return55 

NotFound55 
(55 
$str55 >
)55> ?
;55? @
return66 	
Ok66
 
(66 
response66 
)66 
;66 
}77 
[99 
HttpGet99 

(99
 
$str99 "
)99" #
]99# $
public:: 
IActionResult::	 '
GetProductosPorSubCategoria:: 2
(::2 3
int::3 6
id::7 9
)::9 :
{;; 
var<< 
response<< 
=<< 
new<< *
ListarProductosPorSubCategoria<< 4
(<<4 5
this<<5 9
.<<9 :
_unitOfWork<<: E
)<<E F
.<<F G
Get== 
(== 
id== 	
)==	 

;==
 
if>> 
(>> 
response>> 
.>> 
Count>> 
==>> 
$num>> 
)>> 
return?? 

NotFound?? 
(?? 
$str?? >
)??> ?
;??? @
return@@ 	
Ok@@
 
(@@ 
response@@ 
)@@ 
;@@ 
}AA 
[CC 
HttpGetCC 

(CC
 
$strCC 
)CC 
]CC 
publicDD 
IActionResultDD	 
GetProductoDD "
(DD" #
intDD# &
IdDD' )
)DD) *
{EE 
ResponseFF 
responseFF 
=FF 
newFF 
ListarProductosFF *
(FF* +
_unitOfWorkFF+ 6
)FF6 7
.FF7 8
BuscarProductoGG 
(GG 
IdGG 
)GG 
;GG 
ifHH 
(HH 
responseHH 
.HH 
DataHH 
==HH 
nullHH 
)HH 
{II 
returnJJ 

NotFoundJJ 
(JJ 
responseJJ 
.JJ 
MensajeJJ $
)JJ$ %
;JJ% &
}KK 
returnLL 	
OkLL
 
(LL 
responseLL 
)LL 
;LL 
}MM 
[OO 
HttpPostOO 
(OO 
$strOO .
)OO. /
]OO/ 0
publicPP 
ActionResultPP	 
<PP 
ResponsePP 
>PP 
PostFabricarPP  ,
(PP, -
FabricacionRequestPP- ?
fabricacionRequestPP@ R
)PPR S
{QQ 
ResponseRR 
responseRR 
=RR 
newRR #
FabricacionCrearServiceRR 2
(RR2 3
_unitOfWorkRR3 >
)RR> ?
.RR? @
IniciarFabricacionSS 
(SS 
fabricacionRequestSS (
)SS( )
;SS) *
ifTT 
(TT 
responseTT 
.TT 
DataTT 
==TT 
nullTT 
)TT 
{UU 
returnVV 


BadRequestVV 
(VV 
responseVV 
.VV 
MensajeVV &
)VV& '
;VV' (
}WW 
returnXX 	
OkXX
 
(XX 
responseXX 
)XX 
;XX 
}YY 
[[[ 
HttpGet[[ 

([[
 
$str[[ 4
)[[4 5
][[5 6
public\\ 
IActionResult\\	 
GetFabricaciones\\ '
(\\' (
int\\( +
id\\, .
)\\. /
{]] 
Response^^ 
response^^ 
=^^ 
new^^ 
ListarProductos^^ *
(^^* +
this^^+ /
.^^/ 0
_unitOfWork^^0 ;
)^^; <
.^^< =(
BuscarFabricaionesDeProducto^^= Y
(^^Y Z
id^^Z \
)^^\ ]
;^^] ^
if__ 
(__ 
response__ 
.__ 
Mensaje__ 
!=__ 
null__ 
)__  
{`` 
returnaa 


BadRequestaa 
(aa 
responseaa 
.aa 
Mensajeaa &
)aa& '
;aa' (
}bb 
returncc 	
Okcc
 
(cc 
responsecc 
)cc 
;cc 
}dd 
[ff 
HttpPostff 
(ff 
$strff 
)ff 
]ff 
publicgg 
ActionResultgg	 
<gg 
Responsegg 
>gg !
GetProductosPaginadosgg  5
(gg5 6
PaginationRequestgg6 G
requestggH O
)ggO P
{hh 
returnii 	
newii
 $
ListarProductosPaginadosii &
(ii& '
thisii' +
.ii+ ,
_unitOfWorkii, 7
)ii7 8
.jj 
GetProductosjj 
(jj 
requestjj 
.jj 
Pagejj 
,jj 
requestjj  '
.jj' (
Rowsjj( ,
,jj, -
requestjj. 5
.jj5 6

TermSearchjj6 @
)jj@ A
;jjA B
}kk 
[mm 
HttpGetmm 

]mm
 
publicnn 
ActionResultnn	 
<nn 
Responsenn 
>nn 
GetAllnn  &
(nn& '
)nn' (
{oo 
returnpp 	
newpp
 
ListarProductospp 
(pp 
thispp "
.pp" #
_unitOfWorkpp# .
)pp. /
.pp/ 0
GetAllProductospp0 ?
(pp? @
)pp@ A
;ppA B
}qq 
}ss 
}tt Âc
`C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\TerceroController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
Route 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 
class 
TerceroController 
:  !
ControllerBase" 0
{ 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
public 
TerceroController	 
( 
IUnitOfWork &

unitOfWork' 1
)1 2
{ 
_unitOfWork 
= 

unitOfWork 
; 
} 
[ 
HttpPost 
( 
$str 
) 
] 
public 
ActionResult	 
Post 
( 
TerceroRequest )
request* 1
)1 2
{ 
var 
response 
= 
new 
TerceroCrearService )
() *
this* .
.. /
_unitOfWork/ :
): ;
. 
CrearTercero 
( 
request 
) 
; 
return 	
Ok
 
( 
response 
) 
; 
} 
[!! 
HttpGet!! 

(!!
 
$str!! 
)!! 
]!! 
public"" 
IActionResult""	  
GetTercerosPaginados"" +
(""+ ,
PaginationRequest"", =
request""> E
)""E F
{## 
Response$$ 
response$$ 
=$$ 
new$$ *
ListarTercerosPaginadosService$$ 9
($$9 :
_unitOfWork$$: E
)$$E F
.%% 
Get%% 
(%% 	
request%%	 
)%% 
;%% 
if&& 
(&& 
response&& 
.&& 
Data&& 
==&& 
null&& 
)&& 
return'' 


BadRequest'' 
('' 
$str'' 6
)''6 7
;''7 8
return(( 	
Ok((
 
((( 
response(( 
)(( 
;(( 
})) 
[++ 
HttpPost++ 
(++ 
$str++ 
)++ 
]++ 
public,, 
ActionResult,,	 
PostUsuario,, !
(,,! "!
TerceroUsuarioRequest,," 7
request,,8 ?
),,? @
{-- 
var.. 
response.. 
=.. 
new.. &
TerceroUsuarioCrearService.. 0
(..0 1
this..1 5
...5 6
_unitOfWork..6 A
)..A B
.// 
Crear// 

(//
 
request// 
)// 
;// 
return00 	
Ok00
 
(00 
response00 
)00 
;00 
}11 
[33 
HttpPost33 
(33 
$str33 
)33 
]33 
public44 
IActionResult44	 
PostEmpleado44 #
(44# $"
TerceroEmpleadoRequest44$ :
request44; B
)44B C
{55 
var66 
response66 
=66 
new66 '
TerceroEmpleadoCrearService66 1
(661 2
this662 6
.666 7
_unitOfWork667 B
)66B C
.77 
Crear77 

(77
 
request77 
)77 
;77 
if88 
(88 
response88 
.88 
Data88 
==88 
null88 
)88 
{99 
return:: 


BadRequest:: 
(:: 
response:: 
.:: 
Mensaje:: &
)::& '
;::' (
};; 
return<< 	
Ok<<
 
(<< 
response<< 
)<< 
;<< 
}== 
[?? 
HttpGet?? 

(??
 
$str?? 
)?? 
]?? 
public@@ 
IActionResult@@	 
GetEmpleados@@ #
(@@# $
)@@$ %
{AA 
varBB 
responseBB 
=BB 
newBB 
ListarEmpleadosBB %
(BB% &
thisBB& *
.BB* +
_unitOfWorkBB+ 6
)BB6 7
.BB7 8
GetCC 
(CC 
)CC 
;CC 	
ifDD 
(DD 
responseDD 
.DD 
DataDD 
==DD 
nullDD 
)DD 
returnEE 


BadRequestEE 
(EE 
responseEE 
.EE 
MensajeEE &
)EE& '
;EE' (
returnFF 	
OkFF
 
(FF 
responseFF 
)FF 
;FF 
}GG 
[II 
HttpGetII 

(II
 
$strII (
)II( )
]II) *
publicJJ 
IActionResultJJ	 #
GetEmpleadosPorBusquedaJJ .
(JJ. /
stringJJ/ 5
searchJJ6 <
)JJ< =
{KK 
varLL 
responseLL 
=LL 
newLL &
ListarEmpleadosPorBusquedaLL 0
(LL0 1
thisLL1 5
.LL5 6
_unitOfWorkLL6 A
)LLA B
.LLB C
GetListMM 

(MM
 
searchMM 
)MM 
;MM 
returnOO 	
OkOO
 
(OO 
responseOO 
)OO 
;OO 
}PP 
[RR 
HttpGetRR 

(RR
 
$strRR 
)RR 
]RR 
publicSS 
IActionResultSS	 
GetEmpleadoSS "
(SS" #
intSS# &
idSS' )
)SS) *
{TT 
ResponseUU 
responseUU 
=UU 
newUU (
TerceroEmpleadoBuscarServiceUU 7
(UU7 8
thisUU8 <
.UU< =
_unitOfWorkUU= H
)UUH I
.VV 
BuscarEmpleadoVV 
(VV 
idVV 
)VV 
;VV 
ifWW 
(WW 
responseWW 
.WW 
DataWW 
==WW 
nullWW 
)WW 
returnXX 

NotFoundXX 
(XX 
$strXX +
)XX+ ,
;XX, -
returnYY 	
OkYY
 
(YY 
responseYY 
)YY 
;YY 
}ZZ 
[\\ 
HttpPost\\ 
(\\ 
$str\\ $
)\\$ %
]\\% &
public]] 
ActionResult]]	 
<]] 
Response]] 
>]] !
GetEmpleadosPaginados]]  5
(]]5 6
PaginationRequest]]6 G
request]]H O
)]]O P
{^^ 
Response__ 
response__ 
=__ 
new__ +
ListarEmpleadosPaginadosService__ :
(__: ;
_unitOfWork__; F
)__F G
.`` 
Get`` 
(`` 	
request``	 
)`` 
;`` 
varaa 
dataaa 
=aa 
(aa 
Listaa 
<aa "
TerceroEmpleadoRequestaa *
>aa* +
)aa+ ,
responseaa, 4
.aa4 5
Dataaa5 9
;aa9 :
ifbb 
(bb 
databb 
.bb 
Countbb 
==bb 
$numbb 
)bb 
returncc 

NotFoundcc 
(cc 
$strcc 5
)cc5 6
;cc6 7
returndd 	
Okdd
 
(dd 
responsedd 
)dd 
;dd 
}ee 
[gg 
HttpPostgg 
(gg 
$strgg 
)gg 
]gg 
publichh 
ActionResulthh	 
PostProvedorhh "
(hh" ##
TerceroProveedorRequesthh# :
requesthh; B
)hhB C
{ii 
varjj 
responsejj 
=jj 
newjj (
TerceroProveedorCrearServicejj 2
(jj2 3
thisjj3 7
.jj7 8
_unitOfWorkjj8 C
)jjC D
.kk 
Crearkk 

(kk
 
requestkk 
)kk 
;kk 
ifll 
(ll 
responsell 
.ll 
Datall 
==ll 
nullll 
)ll 
{mm 
returnnn 

NotFoundnn 
(nn 
responsenn 
.nn 
Mensajenn $
)nn$ %
;nn% &
}oo 
returnpp 	
Okpp
 
(pp 
responsepp 
)pp 
;pp 
}qq 
[ss 
HttpGetss 

(ss
 
$strss 
)ss 
]ss 
publictt 
IActionResulttt	 
GetProveedorestt %
(tt% &
)tt& '
{uu 
varvv 
responsevv 
=vv 
newvv 
ListarProveedoresvv '
(vv' (
thisvv( ,
.vv, -
_unitOfWorkvv- 8
)vv8 9
.vv9 :
Getww 
(ww 
)ww 
;ww 	
ifxx 
(xx 
responsexx 
.xx 
Dataxx 
==xx 
nullxx 
)xx 
returnyy 


BadRequestyy 
(yy 
$stryy 7
)yy7 8
;yy8 9
returnzz 	
Okzz
 
(zz 
responsezz 
)zz 
;zz 
}{{ 
[}} 
HttpPost}} 
(}} 
$str}} &
)}}& '
]}}' (
public~~ 
IActionResult~~	 #
GetProveedoresPaginados~~ .
(~~. /
PaginationRequest~~/ @
request~~A H
)~~H I
{ 
Response
ÄÄ 
response
ÄÄ 
=
ÄÄ 
new
ÄÄ /
!ListarProveedoresPaginadosService
ÄÄ <
(
ÄÄ< =
_unitOfWork
ÄÄ= H
)
ÄÄH I
.
ÅÅ 
GetPaginados
ÅÅ 
(
ÅÅ 
request
ÅÅ 
)
ÅÅ 
;
ÅÅ 
var
ÇÇ 
data
ÇÇ 
=
ÇÇ 
(
ÇÇ 
List
ÇÇ 
<
ÇÇ %
TerceroProveedorRequest
ÇÇ +
>
ÇÇ+ ,
)
ÇÇ, -
response
ÇÇ- 5
.
ÇÇ5 6
Data
ÇÇ6 :
;
ÇÇ: ;
if
ÉÉ 
(
ÉÉ 
data
ÉÉ 
.
ÉÉ 
Count
ÉÉ 
==
ÉÉ 
$num
ÉÉ 
)
ÉÉ 
return
ÑÑ 

NotFound
ÑÑ 
(
ÑÑ 
$str
ÑÑ 7
)
ÑÑ7 8
;
ÑÑ8 9
return
ÖÖ 	
Ok
ÖÖ
 
(
ÖÖ 
response
ÖÖ 
)
ÖÖ 
;
ÖÖ 
}
ÜÜ 
[
àà 
HttpPost
àà 
(
àà 
$str
àà #
)
àà# $
]
àà$ %
public
ââ 
IActionResult
ââ	 "
GetClientesPaginados
ââ +
(
ââ+ ,
PaginationRequest
ââ, =
request
ââ> E
)
ââE F
{
ää 
Response
ãã 
response
ãã 
=
ãã 
new
ãã ,
ListarClientesPaginadosService
ãã 9
(
ãã9 :
_unitOfWork
ãã: E
)
ããE F
.
åå 
GetPaginados
åå 
(
åå 
request
åå 
)
åå 
;
åå 
var
çç 
data
çç 
=
çç 
(
çç 
List
çç 
<
çç #
TerceroClienteRequest
çç )
>
çç) *
)
çç* +
response
çç+ 3
.
çç3 4
Data
çç4 8
;
çç8 9
if
éé 
(
éé 
data
éé 
.
éé 
Count
éé 
==
éé 
$num
éé 
)
éé 
return
èè 

NotFound
èè 
(
èè 
$str
èè 4
)
èè4 5
;
èè5 6
return
êê 	
Ok
êê
 
(
êê 
response
êê 
)
êê 
;
êê 
}
ëë 
[
ìì 
HttpGet
ìì 

(
ìì
 
$str
ìì 
)
ìì 
]
ìì 
public
îî 
IEnumerable
îî	 
<
îî 
TerceroRequest
îî #
>
îî# $
GetTerceros
îî% 0
(
îî0 1
)
îî1 2
{
ïï 
return
ññ 	
new
ññ
 "
TerceroGetAllService
ññ "
(
ññ" #
this
ññ# '
.
ññ' (
_unitOfWork
ññ( 3
)
ññ3 4
.
ññ4 5
GetTerceros
ññ5 @
(
ññ@ A
)
ññA B
;
ññB C
}
óó 
}
òò 
}ôô ∞
^C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\TokenController.cs
	namespace

 	
WebApi


 
.

 
Controllers

 
{ 
[ 
Route 
( 
$str 
) 
] 
[ 
ApiController 
] 
public 
class 
TokenController 
: 
ControllerBase  .
{ 
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
private 	
readonly
 
ITokenProvider !
_tokenProvider" 0
;0 1
public 
TokenController	 
( 
ITokenProvider 
tokenProvider 
,  
IUnitOfWork! ,

unitOfWork- 7
)7 8
{ 
_tokenProvider 
= 
tokenProvider !
;! "
_unitOfWork 
= 

unitOfWork 
; 
} 
[ 
HttpPost 
] 
public 
IActionResult	 
Post 
( !
TerceroUsuarioRequest 1
usuarioRequest2 @
)@ A
{ 
var 
user 
= 
new (
TerceroUsuarioValidarService .
(. /
this/ 3
.3 4
_unitOfWork4 ?
)? @
.@ A!
ValidarTerceroUsuario 
( 
usuarioRequest (
)( )
;) *
if 
( 
user 
== 
null 
) 
{ 
return   

Unauthorized   
(   
$str   5
+  6 7
$str!! 
)!! 
;!! 
}"" 
return## 	
Ok##
 
(## 
new## 
JsonWebToken## 
{$$ 
AccessToken%% 
=%% 
_tokenProvider%%  
.%%  !
CreateToken%%! ,
(%%, -
user%%- 1
,%%1 2
DateTime%%3 ;
.%%; <
UtcNow%%< B
.%%B C
AddHours%%C K
(%%K L
$num%%L M
)%%M N
)%%N O
,%%O P
	ExpiresIn&& 
=&& 
$num&& 
}'' 
)'' 
;'' 
}(( 
})) 
}** ü
UC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Pages\Error.cshtml.cs
	namespace

 	
WebApiAngular


 
.

 
Pages

 
{ 
[ 
ResponseCache 
( 
Duration 
= 
$num 
,  
Location! )
=* +!
ResponseCacheLocation, A
.A B
NoneB F
,F G
NoStoreH O
=P Q
trueR V
)V W
]W X
public 

class 

ErrorModel 
: 
	PageModel '
{ 
private 
readonly 
ILogger  
<  !

ErrorModel! +
>+ ,
_logger- 4
;4 5
public 

ErrorModel 
( 
ILogger !
<! "

ErrorModel" ,
>, -
logger. 4
)4 5
{ 	
_logger 
= 
logger 
; 
} 	
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
public 
void 
OnGet 
( 
) 
{ 	
	RequestId 
= 
Activity  
.  !
Current! (
?( )
.) *
Id* ,
??- /
HttpContext0 ;
.; <
TraceIdentifier< K
;K L
} 	
} 
} π

JC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Program.cs
	namespace 	
WebApiAngular
 
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} „C
JC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Startup.cs
	namespace 	
WebApiAngular
 
{ 
public 
class 
Startup 
{ 
public 
Startup	 
( 
IConfiguration 
configuration  -
)- .
{ 
Configuration 
= 
configuration  
;  !
} 
public 
IConfiguration	 
Configuration %
{& '
get( +
;+ ,
}- .
public 
void	 
ConfigureServices 
(  
IServiceCollection  2
services3 ;
); <
{ 
var 
connectionString 
= 
Configuration '
.' (
GetConnectionString( ;
(; <
$str< O
)O P
;P Q
services 
. 
AddDbContext 
< 
DulcesYmasContext *
>* +
(   
opt   
=>  	 
opt   
.   
UseSqlServer   
(   
connectionString   -
)  - .
)  . /
;  / 0
var!! 
tokenProvider!! 
=!! 
new!! 
JwtProvider!! &
(!!& '
$str!!' /
,!!/ 0
$str!!1 ;
,!!; <
$str!!= I
)!!I J
;!!J K
services## 
.## 
AddSingleton## 
<## 
ITokenProvider## '
>##' (
(##( )
tokenProvider##) 6
)##6 7
;##7 8
services$$ 
.$$ 
AddAuthentication$$ 
($$ 
JwtBearerDefaults$$ /
.$$/ 0 
AuthenticationScheme$$0 D
)$$D E
.$$E F
AddJwtBearer%% 
(%% 
options%% 
=>%% 
{&& 
options'' 
.''  
RequireHttpsMetadata'' !
=''" #
false''$ )
;'') *
options(( 
.(( %
TokenValidationParameters(( &
=((' (
tokenProvider(() 6
.((6 7#
GetValidationParameters((7 N
(((N O
)((O P
;((P Q
})) 
))) 
;)) 
services** 
.** 
AddAuthorization** 
(** 
auth** !
=>**" $
{++ 
auth,, 
.,, 	
DefaultPolicy,,	 
=,, 
new,, &
AuthorizationPolicyBuilder,, 7
(,,7 8
),,8 9
.,,9 :$
AddAuthenticationSchemes-- 
(-- 
JwtBearerDefaults-- .
.--. / 
AuthenticationScheme--/ C
)--C D
.--D E$
RequireAuthenticatedUser.. 
(.. 
).. 
... 
Build// 	
(//	 

)//
 
;// 
}00 
)00 
;00 
services33 
.33 
	AddScoped33 
<33 
IUnitOfWork33 !
,33! "

UnitOfWork33# -
>33- .
(33. /
)33/ 0
;330 1
services44 
.44 
	AddScoped44 
<44 

IDbContext44  
,44  !
DulcesYmasContext44" 3
>443 4
(444 5
)445 6
;446 7
services66 
.66 #
AddControllersWithViews66 #
(66# $
)66$ %
.77 
AddNewtonsoftJson77 
(77 
options77 
=>77  "
options88 
.88 	
SerializerSettings88	 
.88 !
ReferenceLoopHandling88 1
=882 3

Newtonsoft884 >
.88> ?
Json88? C
.88C D!
ReferenceLoopHandling88D Y
.88Y Z
Ignore88Z `
)99 
;99 
services:: 
.:: 
AddSpaStaticFiles:: 
(:: 
configuration:: +
=>::, .
{;; 
configuration<< 
.<< 
RootPath<< 
=<< 
$str<< -
;<<- .
}== 
)== 
;== 
servicesAA 
.AA 
AddSwaggerGenAA 
(AA 
cAA 
=>AA 
{BB 
cCC 
.CC 

SwaggerDocCC 
(CC 
$strCC 
,CC 
newCC 
OpenApiInfoCC &
{DD 
VersionEE 
=EE 
$strEE 
,EE 
TitleFF 

=FF 
$strFF 
,FF 
DescriptionGG 
=GG 
$strGG 4
,GG4 5
TermsOfServiceHH 
=HH 
newHH 
UriHH 
(HH 
$strHH A
)HHA B
,HHB C
ContactII 
=II 
newII 
OpenApiContactII !
{JJ 
NameKK 

=KK 
$strKK 
,KK 
EmailLL 
=LL 
stringLL 
.LL 
EmptyLL 
,LL 
UrlMM 	
=MM
 
newMM 
UriMM 
(MM 
$strMM D
)MMD E
,MME F
}NN 
,NN 
LicenseOO 
=OO 
newOO 
OpenApiLicenseOO !
{PP 
NameQQ 

=QQ 
$strQQ )
,QQ) *
UrlRR 	
=RR
 
newRR 
UriRR 
(RR 
$strRR 7
)RR7 8
,RR8 9
}SS 
}TT 
)TT 
;TT 
}UU 
)UU 
;UU 
}XX 
publicZZ 
voidZZ	 
	ConfigureZZ 
(ZZ 
IApplicationBuilderZZ +
appZZ, /
,ZZ/ 0
IWebHostEnvironmentZZ1 D
envZZE H
)ZZH I
{[[ 
if\\ 
(\\ 
env\\ 

.\\
 
IsDevelopment\\ 
(\\ 
)\\ 
)\\ 
{]] 
app^^ 
.^^ %
UseDeveloperExceptionPage^^ !
(^^! "
)^^" #
;^^# $
}__ 
else`` 
{aa 
appbb 
.bb 
UseExceptionHandlerbb 
(bb 
$strbb $
)bb$ %
;bb% &
appcc 
.cc 
UseHstscc 
(cc 
)cc 
;cc 
}dd 
appff 
.ff 
UseHttpsRedirectionff 
(ff 
)ff 
;ff 
appgg 
.gg 
UseStaticFilesgg 
(gg 
)gg 
;gg 
ifhh 
(hh 
!hh 
envhh 
.hh 
IsDevelopmenthh 
(hh 
)hh 
)hh 
{ii 
appjj 
.jj 
UseSpaStaticFilesjj 
(jj 
)jj 
;jj 
}kk 
appmm 
.mm 

UseRoutingmm 
(mm 
)mm 
;mm 
apppp 
.pp 

UseSwaggerpp 
(pp 
)pp 
;pp 
appqq 
.qq 
UseSwaggerUIqq 
(qq 
optionsrr 
=>rr 
{ss 
optionstt 
.tt 
SwaggerEndpointtt 
(tt 
$strtt 7
,tt7 8
$strtt9 P
)ttP Q
;ttQ R
}uu 
)vv 
;vv 
appyy 
.yy 
UseEndpointsyy 
(yy 
	endpointsyy 
=>yy  
{zz 
	endpoints{{ 
.{{ 
MapControllerRoute{{  
({{  !
name|| 	
:||	 

$str|| 
,|| 
pattern}} 
:}} 
$str}} 1
)}}1 2
;}}2 3
}~~ 
)~~ 
;~~ 
app
ÄÄ 
.
ÄÄ 
UseSpa
ÄÄ 
(
ÄÄ 
spa
ÄÄ 
=>
ÄÄ 
{
ÅÅ 
spa
ÉÉ 
.
ÉÉ 
Options
ÉÉ 
.
ÉÉ 

SourcePath
ÉÉ 
=
ÉÉ 
$str
ÉÉ (
;
ÉÉ( )
if
ÖÖ 
(
ÖÖ 
env
ÖÖ 
.
ÖÖ 
IsDevelopment
ÖÖ 
(
ÖÖ 
)
ÖÖ 
)
ÖÖ 
{
ÜÜ 
spa
áá 
.
áá 	!
UseAngularCliServer
áá	 
(
áá 
	npmScript
áá &
:
áá& '
$str
áá( /
)
áá/ 0
;
áá0 1
}
àà 
}
ââ 
)
ââ 
;
ââ 
}
ää 
}
ãã 
}åå Ÿ
RC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\WeatherForecast.cs
	namespace 	
WebApiAngular
 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
TemperatureC		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
int 
TemperatureF 
=>  "
$num# %
+& '
(( )
int) ,
), -
(- .
TemperatureC. :
/; <
$num= C
)C D
;D E
public 
string 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 