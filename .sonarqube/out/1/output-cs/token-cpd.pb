˛:
ZC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Base\GenericRepository.cs
	namespace		 	
Infrastructure		
 
.		 
Base		 
{

 
public 
class 
GenericRepository 
<  
T  !
>! "
:# $
IGenericRepository% 7
<7 8
T8 9
>9 :
where 	
T
 
: 

BaseEntity 
{ 
	protected 

IDbContext 
_db 
; 
	protected 
readonly 
DbSet 
< 
T 
> 
_dbset $
;$ %
	protected 
GenericRepository 
( 

IDbContext (
context) 0
)0 1
{ 
_db 
= 
context	 
; 
_dbset 	
=
 
context 
. 
Set 
< 
T 
> 
( 
) 
; 
} 
public 
virtual	 
IEnumerable 
< 
T 
> 
GetAll  &
(& '
)' (
{ 
return 	
_dbset
 
. 
AsEnumerable 
< 
T 
>  
(  !
)! "
;" #
} 
public 
virtual	 
T 
Find 
( 
object 
id !
)! "
{ 
return   	
_dbset  
 
.   
Find   
(   
id   
)   
;   
}!! 
	protected%% 

IQueryable%% 
<%% 
T%% 
>%% 
FindByAsQueryable%% +
(%%+ ,

Expression%%, 6
<%%6 7
Func%%7 ;
<%%; <
T%%< =
,%%= >
bool%%? C
>%%C D
>%%D E
	predicate%%F O
)%%O P
{&& 
return'' 	
_dbset''
 
.'' 
Where'' 
('' 
	predicate''  
)''  !
;''! "
}(( 
	protected** 

IQueryable** 
<** 
T** 
>** 
AsQueryable** %
(**% &
)**& '
{++ 
return,, 	
_dbset,,
 
.,, 
AsQueryable,, 
(,, 
),, 
;,, 
}-- 
public.. 
IEnumerable..	 
<.. 
T.. 
>.. 
FindBy.. 
(.. 

Expression.. )
<..) *
Func..* .
<... /
T../ 0
,..0 1
bool..2 6
>..6 7
>..7 8
	predicate..9 B
)..B C
{// 
IEnumerable00 
<00 
T00 
>00 
query00 
=00 
_dbset00  
.00  !
Where00! &
(00& '
	predicate00' 0
)000 1
.001 2
AsEnumerable002 >
(00> ?
)00? @
;00@ A
return11 	
query11
 
;11 
}22 
public33 
virtual33	 

IQueryable33 
<33 
T33 
>33 
FindBy33 %
(33% &

Expression44 
<44 
Func44 
<44 
T44 
,44 
bool44 
>44 
>44 
filter44 "
=44# $
null44% )
,44) *
Func55 
<55 

IQueryable55 
<55 
T55 
>55 
,55 
IOrderedQueryable55 '
<55' (
T55( )
>55) *
>55* +
orderBy55, 3
=554 5
null556 :
,55: ;
string66 
includeProperties66	 
=66 
$str66 
)66  
{77 

IQueryable88 
<88 
T88 
>88 
query88 
=88 
_dbset88 
;88  
if:: 
(:: 
filter:: 
!=:: 
null:: 
):: 
{;; 
query<< 	
=<<
 
query<< 
.<< 
Where<< 
(<< 
filter<< 
)<< 
;<<  
}== 
foreach?? 

(?? 
var?? 
includeProperty?? 
in??  "
includeProperties??# 4
.??4 5
Split??5 :
(@@ 
new@@ 
char@@	 
[@@ 
]@@ 
{@@ 
$char@@ 
}@@ 
,@@ 
StringSplitOptions@@ +
.@@+ ,
RemoveEmptyEntries@@, >
)@@> ?
)@@? @
{AA 
queryBB 	
=BB
 
queryBB 
.BB 
IncludeBB 
(BB 
includePropertyBB )
)BB) *
;BB* +
}CC 
ifEE 
(EE 
orderByEE 
!=EE 
nullEE 
)EE 
{FF 
returnGG 

orderByGG 
(GG 
queryGG 
)GG 
;GG 
}HH 
elseII 
{JJ 
returnKK 

queryKK 
;KK 
}LL 
}MM 
publicOO 
TOO	 

FindFirstOrDefaultOO 
(OO 

ExpressionOO (
<OO( )
FuncOO) -
<OO- .
TOO. /
,OO/ 0
boolOO1 5
>OO5 6
>OO6 7
	predicateOO8 A
)OOA B
{PP 
TQQ 
queryQQ 

=QQ 
_dbsetQQ 
.QQ 
FirstOrDefaultQQ "
(QQ" #
	predicateQQ# ,
)QQ, -
;QQ- .
returnRR 	
queryRR
 
;RR 
}SS 
publicTT 
virtualTT	 
voidTT 
AddTT 
(TT 
TTT 
entityTT "
)TT" #
{UU 
_dbsetVV 	
.VV	 

AddVV
 
(VV 
entityVV 
)VV 
;VV 
}WW 
publicYY 
virtualYY	 
voidYY 
DeleteYY 
(YY 
TYY 
entityYY %
)YY% &
{ZZ 
_dbset[[ 	
.[[	 

Remove[[
 
([[ 
entity[[ 
)[[ 
;[[ 
}\\ 
public]] 
virtual]]	 
void]] 
Edit]] 
(]] 
T]] 
entity]] #
)]]# $
{^^ 
_db__ 
.__ 
SetModified__ 
(__ 
entity__ 
)__ 
;__ 
}`` 
publicaa 
virtualaa	 
voidaa 
DeleteRangeaa !
(aa! "
Listaa" &
<aa& '
Taa' (
>aa( )
entitiesaa* 2
)aa2 3
{bb 
_dbsetcc 	
.cc	 

RemoveRangecc
 
(cc 
entitiescc 
)cc 
;cc  
}dd 
publicee 
virtualee	 
voidee 
AddRangeee 
(ee 
Listee #
<ee# $
Tee$ %
>ee% &
entitiesee' /
)ee/ 0
{ff 
_dbsetgg 	
.gg	 

AddRangegg
 
(gg 
entitiesgg 
)gg 
;gg 
}hh 
}ii 
}jj †
SC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Base\IDbContext.cs
	namespace 	
Infrastructure
 
. 
Base 
{ 
public 

	interface 

IDbContext 
{ 
DbSet 
< 
T 
> 
Set 
< 
T 
> 
( 
) 
where 
T  !
:" #
class$ )
;) *
EntityEntry		 
Entry		 
(		 
object		  
entity		! '
)		' (
;		( )
EntityEntry

 
<

 
TEntity

 
>

 
Entry

 "
<

" #
TEntity

# *
>

* +
(

+ ,
TEntity

, 3
entity

4 :
)

: ;
where

< A
TEntity

B I
:

J K
class

L Q
;

Q R
void 
SetModified 
( 
object 
entity  &
)& '
;' (
int 
SaveChanges 
( 
) 
; 
} 
public 

class 
DbContextBase 
:  
	DbContext! *
,* +

IDbContext, 6
{ 
public 
DbContextBase 
( 
DbContextOptions -
options. 5
)5 6
:7 8
base9 =
(= >
options> E
)E F
{ 	
} 	
public 
void 
SetModified 
(  
object  &
entity' -
)- .
{ 	
Entry 
( 
entity 
) 
. 
State 
=  !
EntityState" -
.- .
Modified. 6
;6 7
} 	
} 
} ˙7
SC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Base\UnitOfWork.cs
	namespace 	
Infrastructure
 
. 
Base 
{ 
public 

sealed 
class 

UnitOfWork "
:# $
IUnitOfWork% 0
{		 
private

 

IDbContext

 

_dbContext

 %
;

% &
private 
IProductoRepository #
_productoRepository$ 7
;7 8
private  
ICategoriaRepository $ 
_categoriaRepository% 9
;9 :
private 
IRoleRepository 
_roleRepository  /
;/ 0
private %
ITerceroUsuarioRepository )%
_terceroUsuarioRepository* C
;C D
private 
ITerceroRepository "
_terceroRepository# 5
;5 6
private &
ITerceroProvedorRepository *&
_terceroProvedorRepository+ E
;E F
private &
ITerceroEmpleadoRepository *&
_terceroEmpleadoRepository+ E
;E F
private %
ITerceroClienteRepository )%
_terceroClienteRepository* C
;C D
private 
ICompraRepository !
_compraRepository" 3
;3 4
private #
ISubCategoriaRepository '#
_subCategoriaRepository( ?
;? @
public 
ITerceroRepository !
TerceroRepository" 3
{ 	
get 
{ 
return 
_terceroRepository )
??* ,
( 
_terceroRepository '
=( )
new* -
TerceroRepository. ?
(? @

_dbContext@ J
)J K
)K L
;L M
} 
} 	
public &
ITerceroProvedorRepository )%
TerceroProvedorRepository* C
{   	
get!! 
{"" 
return## &
_terceroProvedorRepository## 1
??##2 4
($$ &
_terceroProvedorRepository$$ /
=$$0 1
new$$2 5&
TerceroProveedorRepository$$6 P
($$P Q

_dbContext$$Q [
)$$[ \
)$$\ ]
;$$] ^
}%% 
}&& 	
public(( %
ITerceroUsuarioRepository(( ($
TerceroUsuarioRepository(() A
{)) 	
get** 
{++ 
return,, %
_terceroUsuarioRepository,, 0
??,,1 3
(-- %
_terceroUsuarioRepository-- .
=--/ 0
new--1 4$
TerceroUsuarioRepository--5 M
(--M N

_dbContext--N X
)--X Y
)--Y Z
;--Z [
}.. 
}00 	
public22 
IRoleRepository22 
RoleRepository22 -
{33 	
get44 
{55 
return66 
_roleRepository66 &
??66' )
(66* +
_roleRepository66+ :
=66; <
new66= @
RoleRepository66A O
(66O P

_dbContext66P Z
)66Z [
)66[ \
;66\ ]
}77 
}88 	
public:: &
ITerceroEmpleadoRepository:: )%
TerceroEmpleadoRepository::* C
{;; 	
get<< 
{<< 
return<< &
_terceroEmpleadoRepository<< 3
??<<4 6
(== &
_terceroEmpleadoRepository== .
===/ 0
new==1 4%
TerceroEmpleadoRepository==5 N
(==N O

_dbContext==O Y
)==Y Z
)==Z [
;==[ \
}==] ^
}>> 	
public@@ %
ITerceroClienteRepository@@ ($
TerceroClienteRepository@@) A
{AA 	
getBB 
{BB 
returnBB %
_terceroClienteRepositoryBB 2
??BB3 5
(CC %
_terceroClienteRepositoryCC .
=CC/ 0
newCC1 4$
TerceroClienteRepositoryCC5 M
(CCM N

_dbContextCCN X
)CCX Y
)CCY Z
;CCZ [
}CC\ ]
}DD 	
publicFF 
IProductoRepositoryFF "
ProductoRepositoryFF# 5
{GG 	
getHH 
{II 
returnJJ 
_productoRepositoryJJ *
??JJ+ -
(KK 
_productoRepositoryKK (
=KK) *
newKK+ .
ProductoRepositoryKK/ A
(KKA B

_dbContextKKB L
)KKL M
)KKM N
;KKN O
}LL 
}MM 	
publicPP #
ISubCategoriaRepositoryPP &"
SubCategoriaRepositoryPP' =
{QQ 	
getRR 
{RR 
returnSS #
_subCategoriaRepositorySS .
??SS/ 1
(TT #
_subCategoriaRepositoryTT *
=TT+ ,
newTT- 0"
SubCategoriaRepositoryTT1 G
(TTG H

_dbContextTTH R
)TTR S
)TTS T
;TTT U
}UU 
}VV 	
publicXX  
ICategoriaRepositoryXX #
CategoriaRepositoryXX$ 7
{YY 	
getZZ 
{ZZ 
returnZZ  
_categoriaRepositoryZZ -
??ZZ. 0
(ZZ1 2 
_categoriaRepositoryZZ2 F
=ZZG H
newZZI L
CategoriaRepositoryZZM `
(ZZ` a

_dbContextZZa k
)ZZk l
)ZZl m
;ZZm n
}ZZo p
}[[ 	
public^^ 
ICompraRepository^^  
CompraRepository^^! 1
{__ 	
get`` 
{aa 
returnbb 
_compraRepositorybb (
??bb) +
(cc 
_compraRepositorycc &
=cc' (
newcc) ,
CompraRepositorycc- =
(cc= >

_dbContextcc> H
)ccH I
)ccI J
;ccJ K
}dd 
}ee 	
publicgg 

UnitOfWorkgg 
(gg 

IDbContextgg $
contextgg% ,
)gg, -
{hh 	

_dbContextii 
=ii 
contextii  
;ii  !
}jj 	
publicmm 
intmm 
Commitmm 
(mm 
)mm 
{nn 	
returnoo 

_dbContextoo 
.oo 
SaveChangesoo )
(oo) *
)oo* +
;oo+ ,
}pp 	
publicqq 
voidqq 
Disposeqq 
(qq 
)qq 
{rr 	
Disposess 
(ss 
truess 
)ss 
;ss 
}tt 	
privateyy 
voidyy 
Disposeyy 
(yy 
boolyy !
	disposingyy" +
)yy+ ,
{zz 	
if{{ 
({{ 
	disposing{{ 
&&{{ 

_dbContext{{ '
!={{( *
null{{+ /
){{/ 0
{|| 
(}} 
(}} 
	DbContext}} 
)}} 

_dbContext}} &
)}}& '
.}}' (
Dispose}}( /
(}}/ 0
)}}0 1
;}}1 2

_dbContext~~ 
=~~ 
null~~ !
;~~! "
} 
}
ÄÄ 	
}
ÅÅ 
}ÇÇ µF
UC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\DulcesYmasContext.cs
	namespace 	
Infrastructure
 
{ 
public		 

class		 
DulcesYmasContext		 "
:		# $
DbContextBase		% 2
{

 
public 
DulcesYmasContext  
(  !
DbContextOptions! 1
options2 9
)9 :
:; <
base= A
(A B
optionsB I
)I J
{ 	
} 	
public 
DbSet 
< 
Role 
> 
Roles  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
Tercero 
> 
Terceros &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
DbSet 
< 
TerceroCliente #
># $
TercerosCliente% 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
DbSet 
< (
TerceroClientePrecioProducto 1
>1 2!
TerceroClientePrecios3 H
{I J
getK N
;N O
setP S
;S T
}U V
public 
DbSet 
< 
TerceroUsuario #
># $
TerceroUsuarios% 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
DbSet 
< 
TerceroProveedor %
>% &
TercerosProvedor' 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
DbSet 
< 
TerceroEmpleado $
>$ %
TercerosEmpleados& 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
DbSet 
< 
TerceroPropietario '
>' (
TercerosPropietario) <
{= >
get? B
;B C
setD G
;G H
}I J
public 
DbSet 
<  
ProductoMateriaPrima )
>) *!
ProductosMateriaPrima+ @
{A B
getC F
;F G
setH K
;K L
}M N
public 
DbSet 
< $
ProductoParaFabricarDuro -
>- .%
ProductosParaFabricarDuro/ H
{I J
getK N
;N O
setP S
;S T
}U V
public 
DbSet 
< %
ProductoParaFabricarSuave .
>. /&
ProductosParaFabricarSuave0 J
{K L
getM P
;P Q
setR U
;U V
}W X
public 
DbSet 
< +
ProductoParaVenderConEnvoltorio 4
>4 5,
 ProductosParaVenderConEnvoltorio6 V
{W X
getY \
;\ ]
set^ a
;a b
}c d
public 
DbSet 
< +
ProductoParaVenderSinEnvoltorio 4
>4 5,
 ProductosParaVenderSinEnvoltorio6 V
{W X
getY \
;\ ]
set^ a
;a b
}c d
public 
DbSet 
< %
ProductoParaVenderDetalle .
>. /'
ProductosParaVenderDetalles0 K
{L M
getN Q
;Q R
setS V
;V W
}X Y
public 
DbSet 
< 
ProductoCategoria &
>& '

Categorias( 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
DbSet 
<  
ProductoSubCategoria )
>) *
SubCategorias+ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
public 
DbSet 
< 
Fabricacion  
>  !
Fabricaciones" /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
DbSet 
< 
FabricacionDetalle '
>' (
FabricacionDetalles) <
{= >
get? B
;B C
setD G
;G H
}I J
public   
DbSet   
<   
Compra   
>   
Compras   $
{  % &
get  ' *
;  * +
set  , /
;  / 0
}  1 2
public!! 
DbSet!! 
<!! 
CompraDetalle!! "
>!!" #
CompraDetalles!!$ 2
{!!3 4
get!!5 8
;!!8 9
set!!: =
;!!= >
}!!? @
public"" 
DbSet"" 
<"" 
Venta"" 
>"" 
Ventas"" "
{""# $
get""% (
;""( )
set""* -
;""- .
}""/ 0
public## 
DbSet## 
<## 
VentaDetalle## !
>##! "
VentaDetalles### 0
{##1 2
get##3 6
;##6 7
set##8 ;
;##; <
}##= >
public$$ 
DbSet$$ 
<$$ 

VentaAbono$$ 
>$$  
VentaAbonos$$! ,
{$$- .
get$$/ 2
;$$2 3
set$$4 7
;$$7 8
}$$9 :
public%% 
DbSet%% 
<%% 

Devolucion%% 
>%%  
Devoluciones%%! -
{%%. /
get%%0 3
;%%3 4
set%%5 8
;%%8 9
}%%: ;
public&& 
DbSet&& 
<&& 
DevolucionDetalle&& &
>&&& '
DevolucionDetalles&&( :
{&&; <
get&&= @
;&&@ A
set&&B E
;&&E F
}&&G H
	protected)) 
override)) 
void)) 
OnModelCreating))  /
())/ 0
ModelBuilder))0 <
modelBuilder))= I
)))I J
{** 	
modelBuilder++ 
.++ 
Entity++ 
<++  
FabricacionDetalle++  2
>++2 3
(++3 4
)++4 5
.++5 6
HasKey,, 
(,, 
fb,, 
=>,, 
new,,  
{,,! "
fb,,# %
.,,% &
FabricacionId,,& 3
,,,3 4
fb,,5 7
.,,7 8
MateriaPrimaId,,8 F
},,F G
),,G H
;,,H I
modelBuilder.. 
... 
Entity.. 
<..  %
ProductoParaVenderDetalle..  9
>..9 :
(..: ;
)..; <
...< =
HasKey// 
(// 
ppvd// 
=>// 
new// "
{//# $
ppvd//% )
.//) * 
ProductoParaVenderId//* >
,//> ?
ppvd//@ D
.//D E"
ProductoParaFabricarId//E [
}//\ ]
)//] ^
;//^ _
modelBuilder11 
.11 
Entity11 
<11  
CompraDetalle11  -
>11- .
(11. /
)11/ 0
.110 1
HasKey22 
(22 
cd22 
=>22 
new22  
{22! "
cd22# %
.22% &

ProductoId22& 0
,220 1
cd222 4
.224 5
CompraId225 =
}22= >
)22> ?
;22? @
modelBuilder44 
.44 
Entity44 
<44  (
TerceroClientePrecioProducto44  <
>44< =
(44= >
)44> ?
.44? @
HasKey55 
(55 
cd55 
=>55 
new55  
{55! "
cd55# %
.55% &

ProductoId55& 0
,550 1
cd552 4
.554 5
	ClienteId555 >
}55> ?
)55? @
;55@ A
modelBuilder77 
.77 
Entity77 
<77  
VentaDetalle77  ,
>77, -
(77- .
)77. /
.77/ 0
HasKey88 
(88 
cd88 
=>88 
new88  
{88! "
cd88# %
.88% &

ProductoId88& 0
,880 1
cd882 4
.884 5
VentaId885 <
}88< =
)88= >
;88> ?
modelBuilder:: 
.:: 
Entity:: 
<::  
DevolucionDetalle::  1
>::1 2
(::2 3
)::3 4
.::4 5
HasKey;; 
(;; 
cd;; 
=>;; 
new;;  
{;;! "
cd;;# %
.;;% &

ProductoId;;& 0
,;;0 1
cd;;2 4
.;;4 5
DevolucionId;;5 A
};;A B
);;B C
;;;C D
}== 	
}>> 
}?? Œ
dC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\CategoriaRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class 
CategoriaRepository $
:% &
GenericRepository' 8
<8 9
ProductoCategoria9 J
>J K
,K L 
ICategoriaRepositoryM a
{ 
public		 
CategoriaRepository		 "
(		" #

IDbContext		# -
context		. 5
)		5 6
:		7 8
base		9 =
(		= >
context		> E
)		E F
{

 	
} 	
} 
} ∑
aC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\CompraRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class 
CompraRepository !
:" #
GenericRepository$ 5
<5 6
Compra6 <
>< =
,= >
ICompraRepository? P
{ 
public 
CompraRepository 
(  

IDbContext  *
context+ 2
)2 3
:4 5
base6 :
(: ;
context; B
)B C
{		 	
}

 	
} 
} ¡
cC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\ProductoRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class 
ProductoRepository #
:$ %
GenericRepository& 7
<7 8
Producto8 @
>@ A
,A B
IProductoRepositoryC V
{ 
public		 
ProductoRepository		 !
(		! "

IDbContext		" ,
context		- 4
)		4 5
:		6 7
base		8 <
(		< =
context		= D
)		D E
{

 	
} 	
} 
} ≠
_C:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\RoleRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class 
RoleRepository 
:  !
GenericRepository" 3
<3 4
Role4 8
>8 9
,9 :
IRoleRepository; J
{ 
public		 
RoleRepository		 
(		 

IDbContext		 (
context		) 0
)		0 1
:		2 3
base		4 8
(		8 9
context		9 @
)		@ A
{

 	
} 	
} 
} ›
gC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\SubCategoriaRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class "
SubCategoriaRepository '
:( )
GenericRepository* ;
<; < 
ProductoSubCategoria< P
>P Q
,Q R#
ISubCategoriaRepositoryS j
{		 
public

 "
SubCategoriaRepository

 %
(

% &

IDbContext

& 0
context

1 8
)

8 9
:

: ;
base

< @
(

@ A
context

A H
)

H I
{ 	
} 	
} 
} ﬂ
iC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\TerceroClienteRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class $
TerceroClienteRepository )
:* +
GenericRepository, =
<= >
TerceroCliente> L
>L M
,M N%
ITerceroClienteRepositoryO h
{		 
public

 $
TerceroClienteRepository

 '
(

' (

IDbContext

( 2
context

3 :
)

: ;
:

< =
base

> B
(

B C
context

C J
)

J K
{ 	
} 	
} 
} ‰
jC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\TerceroEmpleadoRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class %
TerceroEmpleadoRepository *
:+ ,
GenericRepository- >
<> ?
TerceroEmpleado? N
>N O
,O P&
ITerceroEmpleadoRepository		 "
{

 
public %
TerceroEmpleadoRepository (
(( )

IDbContext) 3
context4 ;
); <
:= >
base? C
(C D
contextD K
)K L
{ 	
} 	
} 
} Ë
kC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\TerceroProveedorRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class &
TerceroProveedorRepository +
:, -
GenericRepository. ?
<? @
TerceroProveedor@ P
>P Q
,Q R&
ITerceroProvedorRepositoryS m
{ 
public		 &
TerceroProveedorRepository		 )
(		) *

IDbContext		* 4
context		5 <
)		< =
:		> ?
base		@ D
(		D E
context		E L
)		L M
{

 	
} 	
} 
} º
bC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\TerceroRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class 
TerceroRepository "
:# $
GenericRepository% 6
<6 7
Tercero7 >
>> ?
,? @
ITerceroRepositoryA S
{ 
public		 
TerceroRepository		  
(		  !

IDbContext		! +
context		, 3
)		3 4
:		5 6
base		7 ;
(		; <
context		< C
)		C D
{

 	
} 	
} 
} ﬂ
iC:\Users\duvan\source\repos\CompositePruebaDulces\Infrastructure\Repositories\TerceroUsuarioRepository.cs
	namespace 	
Infrastructure
 
. 
Repositories %
{ 
public 

class $
TerceroUsuarioRepository )
:* +
GenericRepository, =
<= >
TerceroUsuario> L
>L M
,M N%
ITerceroUsuarioRepositoryO h
{ 
public		 $
TerceroUsuarioRepository		 '
(		' (

IDbContext		( 2
context		3 :
)		: ;
:		< =
base		> B
(		B C
context		C J
)		J K
{

 	
} 	
} 
} 