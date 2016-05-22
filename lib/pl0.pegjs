{
  var tree = function(f, r) {
    if (r.length > 0) {
      var last = r.pop();
      var result = {
        type:  last[0],
        left: tree(f, r),
        right: last[1]
      };
    }
    else {
      var result = f;
    }
    return result;
  }
}

st = comentario* function? comentario*

function = FUN id:ID LP params:params RP DEV returns:type block:block FFUN
          { return { fType: 'function',
         			fId : id,
                    fParams: params,
                    fBlock: block,
                    fReturns: returns
                 }; }

params 	= p1:param? r:(COMMA param)*
		{
    	let rest = r.map( ([_, param])=> param)
        return {p1, rest};};	/////////////////////////////////////////////////////////COMPROBAR AQUI
        //return p1 + p2;};	/////////////////////////////////////////////////////////COMPROBAR AQUI

param = type:type id:ID { return { type: type, value: id};}

type = INT / DOUBLE / FLOAT / BOOL / STRING

comentario = COMENTARIO
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
block = CL s1:block? r:(SC block)* CR {
          console.log(s1);
          console.log(r);
          console.log(location()) /* atributos start y end */
          let t = [];
          if (s1) t.push(s1);
          return {
          type: 'COMPOUND', // Chrome supports destructuring
          children: t.concat(r.map( ([_, st]) => st ))
          };
          }
      / SI e:cond HACER st:block SINO sf:block FSI
           {
             return {
               type: 'IFELSE',
               c:  e,
               st: st,
               sf: sf,
             };
           }
      / SI e:cond HACER st:block FSI
           {
             return {
               type: 'IF',
               c:  e,
               st: st
             };
           }
      / assign

assign = i:ID ASSIGN e:cond
            { return {type: '=', left: i, right: e}; }
       / cond

cond = l:exp op:COMP r:exp { return { type: op, left: l, right: r} }
     / exp
     / comentario

exp    = t:term   r:(ADD term)*   { return tree(t,r); }
term   = f:factor r:(MUL factor)* { return tree(f,r); }

factor = NUMBER
       / ID
       / LP t:cond RP   { return t; }
       / comentario
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
reservedwords = INT / DOUBLE / FLOAT / BOOL / STRING / FUN / DEV / FFUN
	 / SI / SINO / MIENTRAS / HACER / PARA / HASTA / FPARA / FSI

_ = $[ \n\t\r]*
ID 		= !reservedwords id:([a-zA-Z0-9_]*)
		{
        String.prototype.replaceAll = function(search, replacement) {
    		var target = this;
    		return target.split(search).join(replacement);
		};
		return { type: 'ID', value: id.join().replaceAll(",","")} }
//		{ return { type: 'ID', value: id.join().replace(",","") }; }
LP 		= _ "(" _
RP 		= _ ")" _
COMMA 	= _ "," _
CL		= _ "{" _
SC		= _ ";" _
CR		= _ "}" _
ASSIGN 	= _ "=" _		{ return "=" }
ADD		= _ op:[+-] _ { return op; }
MUL		= _ op:[*/] _ { return op; }
NUMBER	= _ digits:$[0-9]+ _
		{ return { type: 'NUM', value: parseInt(digits, 10) }; }
COMP	= _ op:("=="/"!="/"<="/">="/"<"/">") _ { return op; }
COMENTARIO = _ "#" $[ a-zA-Z0-9]* _ { return "COMENTARIO"; }

// reserved words
FUN 	= _ "fun " _ 	{ return "fun" }
FFUN 	= _ "ffun" _	{ return "ffun" }
DEV 	= _ "dev " _		{ return "dev" }
INT 	= _ "int " _		{ return "int" }
DOUBLE 	= _ "double " _	{ return "double" }
FLOAT 	= _ "float " _	{ return "float" }
BOOL	= _ "bool " _	{ return "bool" }
STRING	= _ "string " _	{ return "string" }
SI		= _ "si " _		{ return "si" }
SINO	= _ "si_no" _	{ return "si no" }
FSI		= _ "fsi" _		{ return "fsi" }
MIENTRAS= _ "mientras " _{ return "mientras" }
HACER	= _ "hacer" _	{ return "hacer" }
PARA	= _ "para " _	{ return "para" }
HASTA	= _ "hasta " _	{ return "hasta" }
FPARA	= _ "fpara" _	{ return "fpara" }
