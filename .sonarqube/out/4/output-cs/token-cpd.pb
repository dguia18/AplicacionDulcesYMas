Á
YC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Authentication\ITokenProvider.cs
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
} ú
WC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Authentication\JsonWebToken.cs
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
} ˙*
VC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Authentication\JwtProvider.cs
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
}== º
ZC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Controllers\ProductoController.cs
	namespace 	
WebApi
 
. 
Controllers 
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
ProductoController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
DulcesYmasContext *
_context+ 3
;3 4
public 
ProductoController !
(! "
DulcesYmasContext" 3
context4 ;
,; <
IUnitOfWork= H

unitOfWorkI S
)S T
{ 	
_context 
= 
context 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[ 	
	Authorize	 
] 
[ 	
HttpPost	 
( 
$str  
)  !
]! "
public 
ActionResult 
< 
Response $
>$ %
Post& *
(* +
ProductoRequest+ :
productoRequest; J
)J K
{ 	
Response 
response 
= 
new  #%
ProductoMateriaPrimaCrear$ =
(= >
_unitOfWork> I
)I J
.J K
CrearProducto 
( 
productoRequest -
)- .
;. /
return 
Ok 
( 
response 
) 
;  
}   	
[!! 	
HttpGet!!	 
]!! 
public"" 
ActionResult"" 
<"" 
Response"" $
>""$ %
GetAll""& ,
("", -
)""- .
{## 	
return$$ 
new$$ 
ListarProductos$$ &
($$& '
this$$' +
.$$+ ,
_unitOfWork$$, 7
)$$7 8
.$$8 9
GetAllProductos$$9 H
($$H I
)$$I J
;$$J K
}%% 	
[&& 	
HttpGet&&	 
(&& 
$str&& 
)&&  
]&&  !
public'' 
ActionResult'' 
<'' 
Response'' $
>''$ %
GetMateriaPrima''& 5
(''5 6
)''6 7
{(( 	
return)) 
new)) "
ListarProductosPorTipo)) -
())- .
this)). 2
.))2 3
_unitOfWork))3 >
)))> ?
.))? @
EstablecerTipo** 
(** 
Tipo** #
.**# $
MateriaPrima**$ 0
)**0 1
.**1 2
Filtrar**2 9
(**9 :
)**: ;
;**; <
}++ 	
},, 
}-- ä
YC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Controllers\TerceroController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
TerceroController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
DulcesYmasContext *
_context+ 3
;3 4
public 
TerceroController  
(  !
DulcesYmasContext! 2
context3 :
,: ;
IUnitOfWork< G

unitOfWorkH R
)R S
{ 	
_context 
= 
context 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
ActionResult 
Post  
(  !
TerceroRequest! /
request0 7
)7 8
{ 	
var 
response 
= 
new 
TerceroCrear +
(+ ,
this, 0
.0 1
_unitOfWork1 <
)< =
.= >
CrearTercero> J
(J K
requestK R
)R S
;S T
return 
Ok 
( 
response 
) 
;  
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
ActionResult 
PostUsuario '
(' (!
TerceroUsuarioRequest( =
request> E
)E F
{ 	
var 
response 
= 
new 
CrearUsuario +
(+ ,
this, 0
.0 1
_unitOfWork1 <
)< =
.= >
SaveUsuario> I
(I J
requestJ Q
)Q R
;R S
return   
Ok   
(   
response   
)   
;    
}!! 	
}$$ 
}%% “
WC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Controllers\TokenController.cs
	namespace		 	
WebApi		
 
.		 
Controllers		 
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
TokenController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
ITokenProvider '
_tokenProvider( 6
;6 7
private 
readonly 
DulcesYmasContext *
_context+ 3
;3 4
public 
TokenController 
( 
DulcesYmasContext 0
context1 8
,8 9
ITokenProvider 
tokenProvider (
,( )
IUnitOfWork* 5

unitOfWork6 @
)@ A
{ 	
_context 
= 
context 
; 
_tokenProvider 
= 
tokenProvider *
;* +
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
[ 	
HttpPost	 
] 
public 
JsonWebToken 
Post  
(  !!
TerceroUsuarioRequest! 6
usuarioRequest7 E
)E F
{ 	
var 
user 
= 
new 
ValidarUsuario )
() *
this* .
.. /
_unitOfWork/ :
): ;
.; <!
ValidarTerceroUsuario %
(% &
usuarioRequest& 4
)4 5
;5 6
if   
(   
user   
==   
null   
)   
{!! 
throw"" 
new"" '
UnauthorizedAccessException"" 5
(""5 6
)""6 7
;""7 8
}## 
return$$ 
new$$ 
JsonWebToken$$ #
{%% 
AccessToken&& 
=&& 
_tokenProvider&& ,
.&&, -

CreateToke&&- 7
(&&7 8
user&&8 <
,&&< =
DateTime&&> F
.&&F G
UtcNow&&G M
.&&M N
AddHours&&N V
(&&V W
$num&&W X
)&&X Y
)&&Y Z
,&&Z [
	ExpiresIn'' 
='' 
$num'' 
}(( 
;(( 
})) 	
}** 
}++ ı
aC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Controllers\WeatherForecastController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
[		 
ApiController		 
]		 
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
 
)

 
]

 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{ 	
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
var 
rng 
= 
new 
Random  
(  !
)! "
;" #
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date 
= 
DateTime 
.  
Now  #
.# $
AddDays$ +
(+ ,
index, 1
)1 2
,2 3
TemperatureC   
=   
rng   "
.  " #
Next  # '
(  ' (
-  ( )
$num  ) +
,  + ,
$num  - /
)  / 0
,  0 1
Summary!! 
=!! 
	Summaries!! #
[!!# $
rng!!$ '
.!!' (
Next!!( ,
(!!, -
	Summaries!!- 6
.!!6 7
Length!!7 =
)!!= >
]!!> ?
}"" 
)"" 
.## 
ToArray## 
(## 
)## 
;## 
}$$ 	
}%% 
}&& ´

CC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Program.cs
	namespace 	
WebApi
 
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
} ú/
CC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\Startup.cs
	namespace 	
WebApi
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services!! 
.!! 
AddDbContext!! 
<!! 
DulcesYmasContext!! *
>!!* +
("" 
opt"" 
=>""	 
opt"" 
."" 
UseSqlServer"" 
("" 
$str	"" é
)
""é è
)
""è ê
;
""ê ë
var## 
tokenProvider## 
=## 
new## 
JwtProvider## &
(##& '
$str##' /
,##/ 0
$str##1 ;
,##; <
$str##= I
)##I J
;##J K
services$$ 
.$$ 
AddSingleton$$ 
<$$ 
ITokenProvider$$ '
>$$' (
($$( )
tokenProvider$$) 6
)$$6 7
;$$7 8
services%% 
.%% 
AddAuthentication%% 
(%% 
JwtBearerDefaults%% /
.%%/ 0 
AuthenticationScheme%%0 D
)%%D E
.%%E F
AddJwtBearer&& 
(&& 
options&& 
=>&& 
{'' 
options(( 
.((  
RequireHttpsMetadata(( !
=((" #
false(($ )
;(() *
options)) 
.)) %
TokenValidationParameters)) &
=))' (
tokenProvider))) 6
.))6 7#
GetValidationParameters))7 N
())N O
)))O P
;))P Q
}** 
)** 
;** 
services++ 
.++ 
AddAuthorization++ 
(++ 
auth++ !
=>++" $
{,, 
auth-- 
.-- 	
DefaultPolicy--	 
=-- 
new-- &
AuthorizationPolicyBuilder-- 7
(--7 8
)--8 9
.--9 :$
AddAuthenticationSchemes.. 
(.. 
JwtBearerDefaults.. .
.... / 
AuthenticationScheme../ C
)..C D
...D E$
RequireAuthenticatedUser// 
(// 
)// 
.// 
Build00 	
(00	 

)00
 
;00 
}11 
)11 
;11 
services66 
.66 
	AddScoped66 
<66 
IUnitOfWork66 !
,66! "

UnitOfWork66# -
>66- .
(66. /
)66/ 0
;660 1
services77 
.77 
	AddScoped77 
<77 

IDbContext77  
,77  !
DulcesYmasContext77" 3
>773 4
(774 5
)775 6
;776 7
services99 
.99 
AddControllers99 
(99 
)99 
;99 
services>> 
.>> 
AddSwaggerGen>> 
(>> 
c>> 
=>>> 
{?? 
c@@ 
.@@ 

SwaggerDoc@@ 
(@@ 
$str@@ 
,@@ 
new@@ 
OpenApiInfo@@ &
{AA 
VersionBB 
=BB 
$strBB 
,BB 
TitleCC 

=CC 
$strCC 
,CC 
DescriptionDD 
=DD 
$strDD 4
,DD4 5
TermsOfServiceEE 
=EE 
newEE 
UriEE 
(EE 
$strEE A
)EEA B
,EEB C
ContactFF 
=FF 
newFF 
OpenApiContactFF !
{GG 
NameHH 

=HH 
$strHH 
,HH 
EmailII 
=II 
stringII 
.II 
EmptyII 
,II 
UrlJJ 	
=JJ
 
newJJ 
UriJJ 
(JJ 
$strJJ D
)JJD E
,JJE F
}KK 
,KK 
LicenseLL 
=LL 
newLL 
OpenApiLicenseLL !
{MM 
NameNN 

=NN 
$strNN )
,NN) *
UrlOO 	
=OO
 
newOO 
UriOO 
(OO 
$strOO 7
)OO7 8
,OO8 9
}PP 
}QQ 
)QQ 
;QQ 
}RR 
)RR 
;RR 
}UU 
publicXX 
voidXX	 
	ConfigureXX 
(XX 
IApplicationBuilderXX +
appXX, /
,XX/ 0
IWebHostEnvironmentXX1 D
envXXE H
)XXH I
{YY 	
ifZZ 
(ZZ 
envZZ 
.ZZ 
IsDevelopmentZZ !
(ZZ! "
)ZZ" #
)ZZ# $
{[[ 
app\\ 
.\\ %
UseDeveloperExceptionPage\\ -
(\\- .
)\\. /
;\\/ 0
}]] 
app__ 
.__ 
UseHttpsRedirection__ #
(__# $
)__$ %
;__% &
appaa 
.aa 

UseRoutingaa 
(aa 
)aa 
;aa 
appcc 
.cc 
UseAuthorizationcc  
(cc  !
)cc! "
;cc" #
appee 
.ee 
UseAuthenticationee 
(ee 
)ee 
;ee 
appgg 
.gg 
UseEndpointsgg 
(gg 
	endpointsgg &
=>gg' )
{hh 
	endpointsii 
.ii 
MapControllersii (
(ii( )
)ii) *
;ii* +
}jj 
)jj 
;jj 
}kk 	
}ll 
}mm À
KC:\Users\duvan\source\repos\CompositePruebaDulces\WebApi\WeatherForecast.cs
	namespace 	
WebApi
 
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