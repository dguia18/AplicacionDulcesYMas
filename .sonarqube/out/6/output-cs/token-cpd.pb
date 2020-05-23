Ó
`C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Authentication\ITokenProvider.cs
	namespace 	
WebApi
 
. 
Authentication 
{ 
public 

	interface 
ITokenProvider #
{		 
string

 

CreateToke

 
(

 
TerceroUsuario

 (
user

) -
,

- .
DateTime

/ 7
expiry

8 >
)

> ?
;

? @%
TokenValidationParameters !#
GetValidationParameters" 9
(9 :
): ;
;; <
} 
} £
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
} Å+
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
string 

CreateToke  
(  !
TerceroUsuario! /
user0 4
,4 5
DateTime6 >
expiry? E
)E F
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
.!!. /
Rol!!/ 2
.!!2 3
ToString!!3 ;
(!!; <
)!!< =
)!!= >
,!!> ?
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
}== Õ
_C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\CompraController.cs
	namespace 	
WebApiAngular
 
. 
Controllers #
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
CompraController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 

IDbContext #

_dbContext$ .
;. /
public 
CompraController 
(  
IUnitOfWork  +

unitOfWork, 6
,6 7

IDbContext8 B
	dbContextC L
)L M
{ 	
this 
. 

_dbContext 
= 
	dbContext '
;' (
this 
. 
_unitOfWork 
= 

unitOfWork )
;) *
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
ActionResult 
< 
Response $
>$ %
HacerCompra& 1
(1 2
CompraRequest2 ?
request@ G
)G H
{ 	
Response 
response 
= 
new  #
CompraService$ 1
(1 2
_unitOfWork2 =
)= >
.> ?
HacerCompraService? Q
(Q R
requestR Y
)Y Z
;Z [
return 
Ok 
( 
response 
) 
;  
} 	
} 
}   ®=
aC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\ProductoController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
Route 
( 	
$str	 
) 
] 
[ 
ApiController 
] 
public 
class 
ProductoController  
:! "
ControllerBase# 1
{2 3
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
private 	
readonly
 
DulcesYmasContext $
_context% -
;- .
public 
ProductoController	 
( 
DulcesYmasContext .
context/ 6
,6 7
IUnitOfWork8 C

unitOfWorkD N
)N O
{P Q
_context 
= 
context 
; 
_unitOfWork 
= 

unitOfWork 
; 
} 
[ 
HttpPost 
( 
$str 
) 
] 
public 
ActionResult	 
< 
Response 
> 
Post  $
(% &
ProductoRequest& 5
productoRequest6 E
)E F
{G H
Response 
response 
= 
new %
ProductoMateriaPrimaCrear 4
(5 6
_unitOfWork6 A
)A B
.B C
CrearProducto 
( 
productoRequest !
)! "
;" #
return 	
Ok
 
( 
response 
) 
; 
} 
[   
HttpGet   

(   
$str   
)   
]   
public!! 
ActionResult!!	 
<!! 
Response!! 
>!! 
GetMateriasPrima!!  0
(!!1 2
)!!2 3
{!!4 5
return"" 	
new""
 "
ListarProductosPorTipo"" $
(""% &
this""& *
.""* +
_unitOfWork""+ 6
)""6 7
.""7 8
EstablecerTipo## 
(## 
Tipo## 
.## 
MateriaPrima## $
)##$ %
.##% &
Filtrar##& -
(##. /
)##/ 0
;##0 1
}$$ 
[&& 
HttpGet&& 

(&& 
$str&& 
)&& 
]&& 
public'' 
ActionResult''	 
<'' 
Response'' 
>'' 
GetProducto''  +
('', -
int''- 0
Id''1 3
)''3 4
{''5 6
Response(( 
response(( 
=(( 
new(( 
ListarProductos(( *
(((+ ,
_unitOfWork((, 7
)((7 8
.((8 9
BuscarProducto)) 
()) 
Id)) 
))) 
;)) 
return** 	
Ok**
 
(** 
response** 
)** 
;** 
}++ 
[-- 
HttpPost-- 
(-- 
$str-- #
)--# $
]--$ %
public.. 
ActionResult..	 
<.. 
Response.. 
>.. $
PostProductoParaFabricar..  8
(..9 :
ProductoRequest..: I
productoRequest..J Y
)..Y Z
{..[ \
Response// 
response// 
=// 
new// ,
 ProductoParaFabricarCrearService// ;
(//< =
_unitOfWork//= H
)//H I
.//I J
CrearProducto00 
(00 
productoRequest00 !
)00! "
;00" #
return11 	
Ok11
 
(11 
response11 
)11 
;11 
}22 
[44 
HttpGet44 

(44 
$str44 "
)44" #
]44# $
public55 
ActionResult55	 
<55 
Response55 
>55 $
GetProductosParaFabricar55  8
(559 :
)55: ;
{55< =
return66 	
new66
 "
ListarProductosPorTipo66 $
(66$ %
this66% )
.66) *
_unitOfWork66* 5
)665 6
.666 7
EstablecerTipo77 
(77 
Tipo77 
.77 
ParaFabricar77 #
)77# $
.77$ %
Filtrar77% ,
(77, -
)77- .
;77. /
}88 
[:: 
HttpPost:: 
(:: 
$str:: /
)::/ 0
]::0 1
public;; 
ActionResult;;	 
<;; 
Response;; 
>;; 
PostFabricar;;  ,
(;;- .
FabricacionRequest;;. @
fabricacionRequest;;A S
);;S T
{;;U V
Response<< 
response<< 
=<< 
new<< #
FabricacionCrearService<< 2
(<<3 4
_unitOfWork<<4 ?
)<<? @
.<<@ A
IniciarFabricacion== 
(== 
fabricacionRequest== )
)==) *
;==* +
return>> 	
Ok>>
 
(>> 
response>> 
)>> 
;>> 
}?? 
[@@ 
HttpGet@@ 

(@@
 
$str@@ 2
)@@2 3
]@@3 4
publicAA 
ResponseAA	 
GetFabricacionesAA "
(AA" #
intAA# &
idAA' )
)AA) *
{BB 
ResponseCC 
responseCC 
=CC 
newCC 
ListarProductosCC *
(CC* +
thisCC+ /
.CC/ 0
_unitOfWorkCC0 ;
)CC; <
.CC< =(
BuscarFabricaionesDeProductoCC= Y
(CCY Z
idCCZ \
)CC\ ]
;CC] ^
returnDD 	
responseDD
 
;DD 
}EE 
[FF 
HttpPostFF 
(FF 
$strFF !
)FF! "
]FF" #
publicGG 
ActionResultGG	 
<GG 
ResponseGG 
>GG "
PostProductoParaVenderGG  6
(GG7 8
ProductoRequestGG8 G
productoRequestGGH W
)GGW X
{GGY Z
ResponseHH 
responseHH 
=HH 
newHH *
ProductoParaVenderCrearServiceHH 9
(HH: ;
_unitOfWorkHH; F
)HHF G
.HHG H
CrearProductoII 
(II 
productoRequestII !
)II! "
;II" #
returnJJ 	
OkJJ
 
(JJ 
responseJJ 
)JJ 
;JJ 
}KK 
[MM 
HttpGetMM 

(MM
 
$strMM 
)MM  
]MM  !
publicNN 
ActionResultNN	 
<NN 
ResponseNN 
>NN "
GetProductosParaVenderNN  6
(NN6 7
)NN7 8
{OO 
returnPP 	
newPP
 "
ListarProductosPorTipoPP $
(PP$ %
thisPP% )
.PP) *
_unitOfWorkPP* 5
)PP5 6
.PP6 7
EstablecerTipoQQ 
(QQ 
TipoQQ 
.QQ 

ParaVenderQQ !
)QQ! "
.QQ" #
FiltrarQQ# *
(QQ* +
)QQ+ ,
;QQ, -
}RR 
[UU 
HttpGetUU 

]UU
 
publicVV 
ActionResultVV	 
<VV 
ResponseVV 
>VV 
GetAllVV  &
(VV' (
)VV( )
{VV* +
returnWW 	
newWW
 
ListarProductosWW 
(WW 
thisWW #
.WW# $
_unitOfWorkWW$ /
)WW/ 0
.WW0 1
GetAllProductosWW1 @
(WWA B
)WWB C
;WWC D
}XX 
}ZZ 
}[[ °'
`C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\TerceroController.cs
	namespace 	
WebApi
 
. 
Controllers 
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
TerceroController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
DulcesYmasContext *
_context+ 3
;3 4
public 
TerceroController  
(  !
DulcesYmasContext! 2
context3 :
,: ;
IUnitOfWork< G

unitOfWorkH R
)R S
{ 	
_context 
= 
context 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
ActionResult 
Post  
(  !
TerceroRequest! /
request0 7
)7 8
{ 	
var 
response 
= 
new 
TerceroCrear +
(+ ,
this, 0
.0 1
_unitOfWork1 <
)< =
.= >
CrearTercero> J
(J K
requestK R
)R S
;S T
return 
Ok 
( 
response 
) 
;  
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
ActionResult 
PostUsuario '
(' (!
TerceroUsuarioRequest( =
request> E
)E F
{ 	
var   
response   
=   
new   
CrearUsuario   +
(  + ,
this  , 0
.  0 1
_unitOfWork  1 <
)  < =
.  = >
SaveUsuario  > I
(  I J
request  J Q
)  Q R
;  R S
return!! 
Ok!! 
(!! 
response!! 
)!! 
;!!  
}"" 	
[## 	
HttpPost##	 
(## 
$str## 
)## 
]## 
public$$ 
ActionResult$$ 
PostEmpleado$$ (
($$( )"
TerceroEmpleadoRequest$$) ?
request$$@ G
)$$G H
{%% 	
var&& 
response&& 
=&& 
new&&  
TerceroEmpleadoCrear&& 3
(&&3 4
this&&4 8
.&&8 9
_unitOfWork&&9 D
)&&D E
.&&E F
Crear&&F K
(&&K L
request&&L S
)&&S T
;&&T U
return'' 
Ok'' 
('' 
response'' 
)'' 
;''  
}(( 	
[)) 	
HttpGet))	 
()) 
$str))  
)))  !
]))! "
public** 
ActionResult** 
GetEmpleado** '
(**' (
int**( +
id**, .
)**. /
{++ 	
var,, 
response,, 
=,, 
new,, !
ListarTerceroEmpleado,, 4
(,,4 5
this,,5 9
.,,9 :
_unitOfWork,,: E
),,E F
.,,F G
BuscarEmpleado,,G U
(,,U V
id,,V X
),,X Y
;,,Y Z
return-- 
Ok-- 
(-- 
response-- 
)-- 
;--  
}.. 	
[// 	
HttpPost//	 
(// 
$str// 
)// 
]// 
public00 
ActionResult00 
PostProvedor00 (
(00( )"
TerceroProvedorRequest00) ?
request00@ G
)00G H
{11 	
var22 
response22 
=22 
new22 "
TerceroProvedorService22 5
(225 6
this226 :
.22: ;
_unitOfWork22; F
)22F G
.22G H!
CrearTerceroProveedor22H ]
(22] ^
request22^ e
)22e f
;22f g
return33 
Ok33 
(33 
response33 
)33 
;33  
}44 	
[55 	
HttpGet55	 
(55 
$str55 
)55 
]55 
public66 
IEnumerable66 
<66 
TerceroRequest66 )
>66) *
GetTerceros66+ 6
(666 7
)667 8
{77 	
return88 
new88 
BuscarTercero88 $
(88$ %
this88% )
.88) *
_unitOfWork88* 5
)885 6
.886 7
GetTerceros887 B
(88B C
)88C D
;88D E
}99 	
}:: 
};; Ÿ
^C:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\TokenController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
TokenController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
ITokenProvider '
_tokenProvider( 6
;6 7
private 
readonly 
DulcesYmasContext *
_context+ 3
;3 4
public 
TokenController 
( 
DulcesYmasContext 0
context1 8
,8 9
ITokenProvider 
tokenProvider (
,( )
IUnitOfWork* 5

unitOfWork6 @
)@ A
{ 	
_context 
= 
context 
; 
_tokenProvider 
= 
tokenProvider *
;* +
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[ 	
HttpPost	 
] 
public   
JsonWebToken   
Post    
(    !!
TerceroUsuarioRequest  ! 6
usuarioRequest  7 E
)  E F
{!! 	
var"" 
user"" 
="" 
new"" 
ValidarUsuario"" )
("") *
this""* .
."". /
_unitOfWork""/ :
)"": ;
.""; <!
ValidarTerceroUsuario## %
(##% &
usuarioRequest##& 4
)##4 5
;##5 6
if$$ 
($$ 
user$$ 
==$$ 
null$$ 
)$$ 
{%% 
throw&& 
new&& '
UnauthorizedAccessException&& 5
(&&5 6
)&&6 7
;&&7 8
}'' 
return(( 
new(( 
JsonWebToken(( #
{)) 
AccessToken** 
=** 
_tokenProvider** ,
.**, -

CreateToke**- 7
(**7 8
user**8 <
,**< =
DateTime**> F
.**F G
UtcNow**G M
.**M N
AddHours**N V
(**V W
$num**W X
)**X Y
)**Y Z
,**Z [
	ExpiresIn++ 
=++ 
$num++ 
},, 
;,, 
}-- 	
}.. 
}// É
hC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Controllers\WeatherForecastController.cs
	namespace 	
WebApiAngular
 
. 
Controllers #
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
var 
rng 
= 
new 
Random  
(  !
)! "
;" #
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date   
=   
DateTime   
.    
Now    #
.  # $
AddDays  $ +
(  + ,
index  , 1
)  1 2
,  2 3
TemperatureC!! 
=!! 
rng!! "
.!!" #
Next!!# '
(!!' (
-!!( )
$num!!) +
,!!+ ,
$num!!- /
)!!/ 0
,!!0 1
Summary"" 
="" 
	Summaries"" #
[""# $
rng""$ '
.""' (
Next""( ,
("", -
	Summaries""- 6
.""6 7
Length""7 =
)""= >
]""> ?
}## 
)## 
.$$ 
ToArray$$ 
($$ 
)$$ 
;$$ 
}%% 	
}&& 
}'' ü
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
} •

JC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Program.cs
	namespace

 	
WebApiAngular


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ∂?
JC:\Users\duvan\source\repos\CompositePruebaDulces\WebApiAngular\Startup.cs
	namespace 	
WebApiAngular
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services"" 
."" 
AddDbContext"" !
<""! "
DulcesYmasContext""" 3
>""3 4
(## 
opt## 
=>## 
opt## 
.## 
UseSqlServer## (
(##( )
$str	##) ö
)
##ö õ
)
##õ ú
;
##ú ù
var$$ 
tokenProvider$$ 
=$$ 
new$$  #
JwtProvider$$$ /
($$/ 0
$str$$0 8
,$$8 9
$str$$: D
,$$D E
$str$$F R
)$$R S
;$$S T
services&& 
.&& 
AddSingleton&& !
<&&! "
ITokenProvider&&" 0
>&&0 1
(&&1 2
tokenProvider&&2 ?
)&&? @
;&&@ A
services'' 
.'' 
AddAuthentication'' &
(''& '
JwtBearerDefaults''' 8
.''8 9 
AuthenticationScheme''9 M
)''M N
.''N O
AddJwtBearer(( 
((( 
options(( $
=>((% '
{)) 
options** 
.**  
RequireHttpsMetadata** 0
=**1 2
false**3 8
;**8 9
options++ 
.++ %
TokenValidationParameters++ 5
=++6 7
tokenProvider++8 E
.++E F#
GetValidationParameters++F ]
(++] ^
)++^ _
;++_ `
},, 
),, 
;,, 
services-- 
.-- 
AddAuthorization-- %
(--% &
auth--& *
=>--+ -
{.. 
auth// 
.// 
DefaultPolicy// "
=//# $
new//% (&
AuthorizationPolicyBuilder//) C
(//C D
)//D E
.//E F$
AddAuthenticationSchemes00 (
(00( )
JwtBearerDefaults00) :
.00: ; 
AuthenticationScheme00; O
)00O P
.00P Q$
RequireAuthenticatedUser11 (
(11( )
)11) *
.11* +
Build22 
(22 
)22 
;22 
}33 
)33 
;33 
services99 
.99 
	AddScoped99 
<99 
IUnitOfWork99 *
,99* +

UnitOfWork99, 6
>996 7
(997 8
)998 9
;999 :
services:: 
.:: 
	AddScoped:: 
<:: 

IDbContext:: )
,::) *
DulcesYmasContext::+ <
>::< =
(::= >
)::> ?
;::? @
services<< 
.<< #
AddControllersWithViews<< ,
(<<, -
)<<- .
;<<. /
services>> 
.>> 
AddSpaStaticFiles>> &
(>>& '
configuration>>' 4
=>>>5 7
{?? 
configuration@@ 
.@@ 
RootPath@@ &
=@@' (
$str@@) 9
;@@9 :
}AA 
)AA 
;AA 
servicesEE 
.EE 
AddSwaggerGenEE "
(EE" #
cEE# $
=>EE% '
{FF 
cGG 
.GG 

SwaggerDocGG 
(GG 
$strGG !
,GG! "
newGG# &
OpenApiInfoGG' 2
{HH 
VersionII 
=II 
$strII "
,II" #
TitleJJ 
=JJ 
$strJJ &
,JJ& '
DescriptionKK 
=KK  !
$strKK" C
,KKC D
TermsOfServiceLL "
=LL# $
newLL% (
UriLL) ,
(LL, -
$strLL- P
)LLP Q
,LLQ R
ContactMM 
=MM 
newMM !
OpenApiContactMM" 0
{NN 
NameOO 
=OO 
$strOO )
,OO) *
EmailPP 
=PP 
stringPP  &
.PP& '
EmptyPP' ,
,PP, -
UrlQQ 
=QQ 
newQQ !
UriQQ" %
(QQ% &
$strQQ& V
)QQV W
,QQW X
}RR 
,RR 
LicenseSS 
=SS 
newSS !
OpenApiLicenseSS" 0
{TT 
NameUU 
=UU 
$strUU ;
,UU; <
UrlVV 
=VV 
newVV !
UriVV" %
(VV% &
$strVV& I
)VVI J
,VVJ K
}WW 
}XX 
)XX 
;XX 
}YY 
)YY 
;YY 
}\\ 	
public__ 
void__ 
	Configure__ 
(__ 
IApplicationBuilder__ 1
app__2 5
,__5 6
IWebHostEnvironment__7 J
env__K N
)__N O
{`` 	
ifaa 
(aa 
envaa 
.aa 
IsDevelopmentaa !
(aa! "
)aa" #
)aa# $
{bb 
appcc 
.cc %
UseDeveloperExceptionPagecc -
(cc- .
)cc. /
;cc/ 0
}dd 
elseee 
{ff 
appgg 
.gg 
UseExceptionHandlergg '
(gg' (
$strgg( 0
)gg0 1
;gg1 2
appii 
.ii 
UseHstsii 
(ii 
)ii 
;ii 
}jj 
appll 
.ll 
UseHttpsRedirectionll #
(ll# $
)ll$ %
;ll% &
appmm 
.mm 
UseStaticFilesmm 
(mm 
)mm  
;mm  !
ifnn 
(nn 
!nn 
envnn 
.nn 
IsDevelopmentnn "
(nn" #
)nn# $
)nn$ %
{oo 
apppp 
.pp 
UseSpaStaticFilespp %
(pp% &
)pp& '
;pp' (
}qq 
appss 
.ss 

UseRoutingss 
(ss 
)ss 
;ss 
appvv 
.vv 

UseSwaggervv 
(vv 
)vv 
;vv 
appww 
.ww 
UseSwaggerUIww 
(ww 
optionsxx 
=>xx 
{yy 
optionszz 
.zz 
SwaggerEndpointzz +
(zz+ ,
$strzz, F
,zzF G
$strzzH _
)zz_ `
;zz` a
}{{ 
)|| 
;|| 
app 
. 
UseEndpoints 
( 
	endpoints &
=>' )
{
ÄÄ 
	endpoints
ÅÅ 
.
ÅÅ  
MapControllerRoute
ÅÅ ,
(
ÅÅ, -
name
ÇÇ 
:
ÇÇ 
$str
ÇÇ #
,
ÇÇ# $
pattern
ÉÉ 
:
ÉÉ 
$str
ÉÉ @
)
ÉÉ@ A
;
ÉÉA B
}
ÑÑ 
)
ÑÑ 
;
ÑÑ 
app
ÜÜ 
.
ÜÜ 
UseSpa
ÜÜ 
(
ÜÜ 
spa
ÜÜ 
=>
ÜÜ 
{
áá 
spa
ãã 
.
ãã 
Options
ãã 
.
ãã 

SourcePath
ãã &
=
ãã' (
$str
ãã) 4
;
ãã4 5
if
çç 
(
çç 
env
çç 
.
çç 
IsDevelopment
çç %
(
çç% &
)
çç& '
)
çç' (
{
éé 
spa
èè 
.
èè !
UseAngularCliServer
èè +
(
èè+ ,
	npmScript
èè, 5
:
èè5 6
$str
èè7 >
)
èè> ?
;
èè? @
}
êê 
}
ëë 
)
ëë 
;
ëë 
}
íí 	
}
ìì 
}îî Ÿ
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