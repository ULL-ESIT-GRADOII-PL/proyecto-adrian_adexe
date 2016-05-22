st = function

function = FUN id:ID LP params:params RP DEV type FFUN
          { return { type: 'function',
         			id : id,
                    params: params
                 }; }


params 	= p1:param? r:(COMMA param)*
		{
        let rest = r.map( ([_, param])=> param)
         return {p1, rest};};	/////////////////////////////////////////////////////////COMPROBAR AQUI
         //return p1 + p2;};	/////////////////////////////////////////////////////////COMPROBAR AQUI

param = type:type id:ID { return { type: type, value: id};}

type = INT / DOUBLE / FLOAT / BOOL / STRING
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
reservedwords = INT / DOUBLE / FLOAT / BOOL / STRING / FUN / DEV / FFUN
	 / SI / SINO / MIENTRAS / HACER / PARA / HASTA / FPARA / FSI

_ = $[ \n\t\r]*
ID 		= !reservedwords id:([a-zA-Z0-9_]*)
		{ return id.join().replace(",","") }
//		{ return { type: 'ID', value: id.join().replace(",","") }; }
LP 		= _ "(" _
RP 		= _ ")" _
COMMA 	= _ "," _

// reserved words
FUN 	= _ "fun" _ 	{ return "fun" }
FFUN 	= _ "ffun" _	{ return "ffun" }
DEV 	= _ "dev" _		{ return "dev" }
INT 	= _ "int" _		{ return "int" }
DOUBLE 	= _ "double" _	{ return "double" }
FLOAT 	= _ "float" _	{ return "float" }
BOOL	= _ "bool" _	{ return "bool" }
STRING	= _ "string" _	{ return "string" }
SI		= _ "si" _		{ return "si" }
SINO	= _ "si no" _	{ return "si no" }
FSI		= _ "fsi" _		{ return "fsi" }
MIENTRAS= _ "mientras" _{ return "mientras" }
HACER	= _ "hacer" _	{ return "hacer" }
PARA	= _ "para" _	{ return "para" }
HASTA	= _ "hasta" _	{ return "hasta" }
FPARA	= _ "fpara" _	{ return "fpara" }
