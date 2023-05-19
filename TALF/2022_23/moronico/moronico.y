 %{
        #include <stdio.h>
        extern FILE *yyin;
        extern int yylex();
        #define YYDEBUG 1

%}

%token ABSTRACTO AND ASOCIATIVA BOOLEANO CABECERA CADENA CASO CARACTER CARGA CLASE CONJUNTO CONSTANTE CUERPO CTC_BOOLEANA CTC_CADENA CTC_CARACTER CTC_ENTERA CTC_REAL CONSTRUCTOR CUANDO CUATRO_PTOS DESCENDENTE DESPD DESPI DESTRUCTOR DE DEVOLVER DOS_PTOS EJECUTA ELEMENTO EN ENTERO ENTONCES EQ ESPECIFICO EXCEPTO FICHERO FINAL FINALMENTE FLECHA_DOBLE FUNCION GEQ GENERICO HASTA IDENTIFICADOR INTERFAZ LANZAR LEQ LISTA MIENTRAS MODIFICABLE NEQ OTRO OR PAQUETE PARA PATH POTENCIA PRIVADO PROBAR PROCEDIMIENTO PROGRAMA PUBLICO REAL REGISTRO REPITE SEA SALIR SEMIPUBLICO SI SINO TIPO VARIABLE

%right OR
%right AND
%nonassoc '!'   
%left  NEQ EQ LEQ GEQ '>' '<'
%left '@'
%left '^'
%left '&'
%left DESPD DESPI
%left '+' '-'
%left '%' '/' '*'
%right POTENCIA
%nonassoc NEGACION

%%

/********************************/
/* programas, paquetes y cargas */
/********************************/

programa : definicion_programa { printf("\tEXITO: programa -> definicion_programa \n");}
        | definicion_paquete { printf("\tEXITO: programa -> definicion_paquete \n");}
        | error ';'  {yyerrok;}
	;

definicion_programa : PROGRAMA nombre ';' bloque_programa { printf("\tdefinicion_programa -> PROGRAMA nombre ';' bloque_programa \n");}
	;

nombre : IDENTIFICADOR   { printf("\tnombre -> IDENTIFICADOR \n");}
        | identificador_cuatro_puntos_zero_mas IDENTIFICADOR { printf("\tnombre -> identificadores_cuatro_ptos IDENTIFICADOR \n");}
	;

identificador_cuatro_puntos_zero_mas : IDENTIFICADOR CUATRO_PTOS  { printf("\tidentificador_cuatro_puntos_zero_mas -> IDENTIFICADOR CUATRO_PTOS \n");}
        | identificador_cuatro_puntos_zero_mas IDENTIFICADOR CUATRO_PTOS { printf("\tidentificador_cuatro_puntos_zero_mas -> identificador_cuatro_puntos_zero_mas IDENTIFICADOR CUATRO_PTOS \n");}
	;

bloque_programa : declaracion_cargas_null declaracion_tipos_null declaracion_constantes_null declaracion_variables_null bloque_instrucciones { printf("\tbloque_programa -> declaracion_cargas_null declaracion_tipos_null declaracion_constantes_null declaracion_variables_null bloque_instrucciones \n");}
	;

declaracion_cargas_null :  
        | declaracion_cargas { printf("\tdeclaracion_cargas_null -> declaracion_cargas \n");}
	;

declaracion_tipos_null :  
        | declaracion_tipos { printf("\tdeclaracion_tipos_null -> declaracion_tipos \n");}
	;

declaracion_constantes_null :  
        | declaracion_constantes  { printf("\tdeclaracion_constantes_null -> declaracion_constantes \n");}
	;

declaracion_variables_null :  
        | declaracion_variables { printf("\tdeclaracion_variables_null -> declaracion_variables \n");}
	;

bloque_instrucciones : '{' instrucciones '}' { printf("\tbloque_instrucciones -> '{' instrucciones '}' \n");}
	;

instrucciones : instruccion   { printf("\tinstrucciones -> instruccion \n");}
        | instrucciones instruccion  { printf("\tinstrucciones -> instruccion ',' instruccion \n");}
	;

definicion_paquete : PAQUETE nombre ';' seccion_cabecera seccion_cuerpo { printf("\tdefinicion_paquete -> PAQUETE nombre ';' seccion_cabecera seccion_cuerpo \n");}
	;

seccion_cabecera : CABECERA declaracion_cargas_null declaracion_tipos_null declaracion_constantes_null declaracion_variables_null declaracion_interfaces_null { printf("\tseccion_cabecera -> CABECERA declaracion_cargas_null declaracion_tipos_null declaracion_constantes_null declaracion_variables_null declaracion_interfaces_null \n");}
	;

declaracion_interfaces_null :  
        | declaracion_interfaces { printf("\tdeclaracion_interfaces_null -> declaracion_interfaces \n");}
	;

seccion_cuerpo : CUERPO declaracion_tipos_null declaracion_constantes_null declaracion_variables_null declaracion_subprograma_uno_mas  { printf("\tseccion_cuerpo -> CUERPO declaracion_tipos_null declaracion_constantes_null declaracion_variables_null declaracion_subprograma_uno_mas \n");}
	;

declaracion_subprograma_uno_mas : declaracion_subprograma  { printf("\tdeclaracion_subprograma_uno_mas -> declaracion_subprograma \n");}
        | declaracion_subprograma_uno_mas declaracion_subprograma { printf("\tdeclaracion_subprograma_uno_mas -> declaracion_subprograma_uno_mas declaracion_subprograma \n");}
	;

declaracion_cargas : CARGA declaracion_cargas_uno_mas ';' { printf("\tdeclaracion_cargas -> CARGA declaracion_cargas_uno_mas ';' \n");}
	;

declaracion_cargas_uno_mas : declaracion_carga  { printf("\tdeclaracion_cargas_uno_mas -> declaracion_carga \n");}
        | declaracion_cargas_uno_mas ',' declaracion_carga { printf("\tdeclaracion_cargas_uno_mas -> declaracion_cargas_uno_mas declaracion_carga \n");}
        ;       

declaracion_carga : nombre en_path_null nombres_null { printf("\tdeclaracion_carga -> nombre en_path_null nombres_null \n");}
	;

en_path_null : 
        | EN PATH { printf("\ten_path_null -> EN PATH \n");}
	;

nombres : nombre { printf("\tnombres -> nombre \n");}
        | nombres ',' nombre { printf("\tnombres -> nombres ',' nombre \n");}
	;

nombres_null : 
        | '(' nombres ')' { printf("\tnombres_null -> '(' nombres ')' \n");}
	;

/************************/
/* tipos (incl. clases) */
/************************/

declaracion_tipos : TIPO declaracion_tipos_uno_mas { printf("\tdeclaracion_tipos -> TIPO declaracion_tipos_uno_mas \n");}
	;

declaracion_tipos_uno_mas : declaracion_tipo { printf("\tdeclaracion_tipos_uno_mas -> declaracion_tipo \n");}
        | declaracion_tipos_uno_mas declaracion_tipo { printf("\tdeclaracion_tipos_uno_mas -> declaracion_tipos_uno_mas declaracion_tipo \n");}
	;

declaracion_tipo : nombre '=' tipo_no_estructurado_o_nombre_tipo ';' { printf("\tdeclaracion_tipo -> nombre '=' tipo_no_estructurado_o_nombre_tipo ';' \n");}
        | nombre '=' tipo_estructurado { printf("\tdeclaracion_tipo -> nombre '=' tipo_estructurado \n");}
	;

tipo_no_estructurado_o_nombre_tipo : nombre { printf("\ttipo_no_estructurado_o_nombre_tipo -> nombre \n");}
        | tipo_escalar { printf("\ttipo_no_estructurado_o_nombre_tipo -> tipo_escalar \n");}
        | tipo_fichero { printf("\ttipo_no_estructurado_o_nombre_tipo -> tipo_fichero \n");}
        | tipo_enumerado { printf("\ttipo_no_estructurado_o_nombre_tipo -> tipo_enumerado \n");}
        | tipo_lista { printf("\ttipo_no_estructurado_o_nombre_tipo -> tipo_lista \n");}
        | tipo_lista_asociativa { printf("\ttipo_no_estructurado_o_nombre_tipo -> tipo_lista_asociativa \n");}
        | tipo_conjunto { printf("\ttipo_no_estructurado_o_nombre_tipo -> tipo_conjunto \n");}
	;

tipo_estructurado : tipo_registro { printf("\ttipo_estructurado -> tipo_registro \n");}
        | declaracion_clase { printf("\ttipo_estructurado -> declaracion_clase \n");}
	;

tipo_escalar : ENTERO { printf("\ttipo_escalar -> ENTERO \n");} 
        | REAL { printf("\ttipo_escalar -> REAL \n");}
        | BOOLEANO { printf("\ttipo_escalar -> BOOLEANO \n");}
        | CARACTER { printf("\ttipo_escalar -> CARACTER \n");}
        | CADENA { printf("\ttipo_escalar -> CADENA \n");}
	;

tipo_fichero : FICHERO { printf("\ttipo_fichero -> FICHERO \n");}
	;

tipo_enumerado : '(' lista_expresiones_constantes ')' { printf("\ttipo_enumerado -> '(' lista_expresiones_constantes ')' \n");}
	;

lista_expresiones_constantes : expresion_constante  { printf("\tlista_expresiones_constantes -> expresion_constante \n");}
        | lista_expresiones_constantes ',' expresion_constante { printf("\tlista_expresiones_constantes -> lista_expresiones_constantes ',' expresion_constante \n");}
	;

tipo_lista : LISTA rangos_null DE tipo_no_estructurado_o_nombre_tipo { printf("\ttipo_lista -> LISTA rangos_null DE tipo_no_estructurado_o_nombre_tipo \n");}
	;

rangos : rango { printf("\trangos -> rango \n");}
        | rangos ',' rango { printf("\trangos -> rangos ',' rango \n");}
	;

rangos_null : 
        | '[' rangos ']' { printf("\trangos_null -> '[' rangos ']' \n");}
	;

rango : expresion DOS_PTOS expresion  { printf("\trango -> expresion DOS_PTOS expresion \n");}
        | expresion DOS_PTOS expresion DOS_PTOS expresion { printf("\trango -> expresion DOS_PTOS expresion DOS_PTOS expresion \n");}
	;

tipo_lista_asociativa : LISTA ASOCIATIVA DE tipo_no_estructurado_o_nombre_tipo  { printf("\ttipo_lista_asociativa -> LISTA ASOCIATIVA DE tipo_no_estructurado_o_nombre_tipo \n");}
	;

tipo_conjunto : CONJUNTO DE tipo_no_estructurado_o_nombre_tipo { printf("\ttipo_conjunto -> CONJUNTO DE tipo_no_estructurado_o_nombre_tipo \n");}
	;

tipo_registro : REGISTRO '{' declaraciones_campos_uno_mas '}' { printf("\ttipo_registro -> REGISTRO '{' declaraciones_campo '}' \n");}
	;

declaraciones_campos_uno_mas : declaracion_campo { printf("\tdeclaraciones_campos_uno_mas -> declaracion_campo \n");}
        | declaraciones_campos_uno_mas declaracion_campo { printf("\tdeclaraciones_campos_uno_mas -> declaraciones_campos_uno_mas declaracion_campo \n");}
	;

declaracion_campo : nombres ':' tipo_no_estructurado_o_nombre_tipo ';' { printf("\tdeclaracion_campo -> nombres ':' tipo_no_estructurado_o_nombre_tipo ';' \n");}
	;

/*************************************/
/* constantes, variables, interfaces */
/*************************************/

declaracion_constantes : CONSTANTE declaraciones_constantes_uno_mas { printf("\tdeclaracion_constantes -> CONSTANTE declaraciones_constantes_uno_mas \n");}
	;

declaraciones_constantes_uno_mas : declaracion_constante { printf("\tdeclaraciones_constantes_uno_mas -> declaracion_constante \n");}
        | declaraciones_constantes_uno_mas declaracion_constante { printf("\tdeclaraciones_constantes_uno_mas -> declaraciones_constantes_uno_mas declaracion_constante \n");}
	;

declaracion_constante : nombre ':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';' { printf("\tdeclaracion_constante -> nombre ':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';' \n");}
	;

valor_constante : expresion { printf("\tvalor_constante -> expresion \n");}
        | '[' lista_valores_constante ']' { printf("\tvalor_constante -> '[' lista_valores_constante ']' \n");}
        | '[' lista_claves_valor ']' { printf("\tvalor_constante -> '[' lista_claves_valor ']' \n");}
        | '[' lista_campos_valor ']' { printf("\tvalor_constante -> '[' lista_campos_valor ']' \n");}
	;

lista_valores_constante : valor_constante { printf("\tlista_valores_constante -> valor_constante \n");}
        | lista_valores_constante ',' valor_constante { printf("\tlista_valores_constante -> lista_valores_constante ',' valor_constante' \n");}
	;

lista_claves_valor : clave_valor { printf("\tlista_claves_valor -> clave_valor \n");}
        | lista_claves_valor ',' clave_valor { printf("\tlista_claves_valor -> lista_claves_valor ',' clave_valor \n");}
	;

lista_campos_valor : campo_valor { printf("\tlista_campos_valor -> clave_valor \n");}
        | lista_campos_valor ',' campo_valor { printf("\tlista_campos_valor -> lista_campos_valor ',' campo_valor \n");}
	;

clave_valor : CTC_CADENA FLECHA_DOBLE valor_constante { printf("\tclave_valor -> CTC_CADENA FLECHA_DOBLE valor_constante \n");}
	;

campo_valor : nombre FLECHA_DOBLE valor_constante { printf("\tcampo_valor -> nombre FLECHA_DOBLE valor_constante \n");}
	;

declaracion_variables : VARIABLE declaraciones_variables_uno_mas { printf("\tdeclaracion_variables -> VARIABLE declaraciones_variables_uno_mas \n");}
	;

declaraciones_variables_uno_mas : declaracion_variable { printf("\tdeclaraciones_variables_uno_mas -> declaracion_variable \n");}
        | declaraciones_variables_uno_mas declaracion_variable { printf("\tdeclaraciones_variables_uno_mas -> declaraciones_variables_uno_mas declaracion_variable \n");}
	;

declaracion_variable : nombres ':' tipo_no_estructurado_o_nombre_tipo ';' { printf("\tdeclaracion_variable -> nombres ':' tipo_no_estructurado_o_nombre_tipo ';' \n");}
        | nombres ':' tipo_no_estructurado_o_nombre_tipo '=' lista_valores_constante ';' { printf("\tdeclaracion_variable -> nombres ':' tipo_no_estructurado_o_nombre_tipo '=' lista_valores_constante ';' \n");}
	;

declaracion_interfaces : INTERFAZ cabeceras_subprograma { printf("\tdeclaracion_interfaces -> INTERFAZ cabeceras_subprograma \n");} 
	;

cabeceras_subprograma : cabecera_subprograma ';' { printf("\tcabeceras_subprograma -> cabecera_subprograma ';' \n");}
        | cabeceras_subprograma cabecera_subprograma ';' { printf("\tcabeceras_subprograma -> cabeceras_subprograma cabecera_subprograma ';' \n");}
	;

/**********/
/* clases */
/**********/

declaracion_clase : CLASE final_null nombres_null '{' declaraciones_publicas declaraciones_semi_null declaraciones_privada_null '}'                     { printf("\tdeclaracion_clase -> CLASE final_null nombres_null '{' declaraciones_publicas declaraciones_semi_null declaraciones_privada_null '}' \n");}         
	;

final_null : 
        | FINAL { printf("\tfinal_null -> FINAL \n");}
	;

declaraciones_semi_null : 
        | declaracion_semi { printf("\tdeclaraciones_semi_null -> declaracion_semi \n");}
	;

declaraciones_privada_null : 
        | declaracion_privada { printf("\tdeclaraciones_privada_null -> declaracion_privada \n");}
	;

declaraciones_publicas : publico_null declaraciones_componentes { printf("\tdeclaraciones_publicas -> publico_null declaraciones_componentes \n");}
	;

publico_null : 
        | PUBLICO { printf("\tpublico_null -> PUBLICO \n");}
	;

declaracion_semi :  SEMIPUBLICO declaraciones_componentes { printf("\tdeclaracion_semi -> SEMIPUBLICO declaraciones_componentes \n");}
	;

declaracion_privada :  PRIVADO declaraciones_componentes { printf("\tdeclaracion_privada -> PRIVADO declaraciones_componentes \n");}
	;

declaraciones_componentes : declaracion_componente { printf("\tdeclaraciones_componentes -> declaracion_componente \n");}
        | declaraciones_componentes declaracion_componente { printf("\tdeclaraciones_componentes -> declaraciones_componentes declaracion_componente \n");}
; 

declaracion_componente :  declaracion_tipo_anidado { printf("\tdeclaracion_componente -> declaracion_tipo_anidado \n");}
        | declaracion_constante_anidada { printf("\tdeclaracion_componente -> declaracion_constante_anidada \n");}
        | declaracion_atributos { printf("\tdeclaracion_componente -> declaracion_atributos \n");}
        | cabecera_subprograma ';' { printf("\tdeclaracion_componente -> cabecera_subprograma ';' \n");}
	| cabecera_subprograma ';' modificadores ';' { printf("\tdeclaracion_componente -> cabecera_subprograma ';' modificadores ';' \n");}
        ;

declaracion_tipo_anidado :  TIPO declaracion_tipo { printf("\tdeclaracion_tipo_anidado -> TIPO declaracion_tipo \n");}
	;

declaracion_constante_anidada : CONSTANTE declaracion_constante { printf("\tdeclaracion_constante_anidada -> CONSTANTE declaracion_constante \n");}
	;

declaracion_atributos :  nombres ':' tipo_no_estructurado_o_nombre_tipo ';' { printf("\tdeclaracion_atributos -> nombres ':' tipo_no_estructurado_o_nombre_tipo ';' \n");}
	;

modificadores :  modificador { printf("\tmodificadores -> modificador \n");}
        | modificadores ',' modificador { printf("\tmodificadores -> modificadores ',' modificador \n");}
	;

modificador :  GENERICO { printf("\tmodificador -> GENERICO \n");}
        | ABSTRACTO { printf("\tmodificador -> ABSTRACTO \n");}
        | ESPECIFICO { printf("\tmodificador -> ESPECIFICO \n");} 
        | FINAL { printf("\tmodificador -> FINAL \n");}
	;

/****************/
/* subprogramas */
/****************/

declaracion_subprograma : cabecera_subprograma bloque_subprograma {printf("\tdeclaracion_subprograma -> cabecera_subprograma bloque_subprograma \n");}
	;

cabecera_subprograma : cabecera_funcion { printf("\tcabecera_subprograma -> cabecera_funcion \n");}
        | cabecera_procedimiento { printf("\tcabecera_subprograma -> cabecera_procedimiento \n");}
        | cabecera_constructor { printf("\tcabecera_subprograma -> cabecera_constructor \n");}
        | cabecera_destructor { printf("\tcabecera_subprograma -> cabecera_destructor \n");}
	;

cabecera_funcion : FUNCION nombre declaracion_parametros_null FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo { printf("\tcabecera_funcion -> FUNCION nombre declaracion_parametros_null FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo \n");}
	;

declaracion_parametros_null : 
        | declaracion_parametros { printf("\tdeclaracion_parametros_null -> declaracion_parametros \n");}
	;

cabecera_procedimiento : PROCEDIMIENTO nombre declaracion_parametros_null { printf("\tcabecera_procedimiento -> PROCEDIMIENTO nombre declaracion_parametros_null \n");}
	;

cabecera_constructor : CONSTRUCTOR nombre declaracion_parametros_null { printf("\tcabecera_constructor -> CONSTRUCTOR nombre declaracion_parametros_null \n");}
	;

cabecera_destructor : DESTRUCTOR nombre { printf("\tcabecera_destructor -> DESTRUCTOR nombre \n");}
	;

declaracion_parametros : '(' lista_parametros_formales ')' { printf("\tdeclaracion_parametros -> '(' lista_parametros_formales ')' \n");}
	;

lista_parametros_formales : parametros_formales { printf("\tlista_parametros_formales -> parametros_formales \n");}
        | lista_parametros_formales ';' parametros_formales { printf("\tlista_parametros_formales -> lista_parametros_formales ';' parametros_formales \n");}
	;

parametros_formales :  nombres ':' tipo_no_estructurado_o_nombre_tipo { printf("\tparametros_formales -> nombres ':' tipo_no_estructurado_o_nombre_tipo \n");}
        | nombres ':' tipo_no_estructurado_o_nombre_tipo MODIFICABLE { printf("\tparametros_formales -> nombres ':' tipo_no_estructurado_o_nombre_tipo MODIFICABLE \n");}
	;

bloque_subprograma : declaracion_tipos_null declaracion_constantes_null declaracion_variables_null bloque_instrucciones { printf("\tbloque_subprograma -> declaraciones_tipos declaracion_constantes_null declaracion_variables_null bloque_instrucciones \n");}
	;

/*****************/
/* instrucciones */
/*****************/

instruccion : instruccion_asignacion {  printf("\tinstruccion -> instruccion_asignacion \n");}
        | instruccion_salir {  printf("\tinstruccion -> instruccion_salir \n");}
        | instruccion_devolver {  printf("\tinstruccion -> instruccion_devolver \n");}
        | instruccion_llamada {  printf("\tinstruccion -> instruccion_llamada \n");}
        | instruccion_si {  printf("\tinstruccion -> instruccion_si \n");}
        | instruccion_casos {  printf("\tinstruccion -> instruccion_casos \n");}
        | instruccion_bucle {  printf("\tinstruccion -> instruccion_bucle \n");}
        | instruccion_probar_excepto {  printf("\tinstruccion -> instruccion_probar_excepto \n");}
        | instruccion_lanzar {  printf("\tinstruccion -> instruccion_lanzar \n");}
        | ';' {  printf("\tinstruccion -> ';' \n");}
	;

instruccion_asignacion : objeto '=' expresion ';' { printf("\tinstruccion_asignacion -> objeto '=' expresion ';' \n");}
	;

instruccion_salir : SALIR si_expresion_null ';' { printf("\tinstruccion_salir -> SALIR si_expresion_null ';' \n");}
	;

si_expresion_null : 
        | SI expresion { printf("\tsi_expresion_null -> SI expresion \n");}
	;

instruccion_devolver : DEVOLVER ';' { printf("\tinstruccion_devolver -> DEVOLVER ';' \n");}
        | DEVOLVER expresion ';' { printf("\tinstruccion_devolver -> DEVOLVER expresion ';' \n");}
	;

instruccion_llamada : llamada_subprograma ';' { printf("\tinstruccion_llamada -> llamada_subprograma ';' \n");}
	;

llamada_subprograma : nombre '(' ')' { printf("\tllamada_subprograma -> nombre '(' ')' \n");}
        | nombre '(' expresion_zero_mas ')' { printf("\tllamada_subprograma -> nombre '(' expresion_zero_mas ')' \n");}
	;

expresion_zero_mas : expresion { printf("\texpresion_zero_mas -> expresion \n");}
        | expresion_zero_mas ',' expresion { printf("\texpresion_zero_mas -> expresion_zero_mas ',' expresion \n");}
	;

instruccion_si : SI expresion ENTONCES bloque_instrucciones { printf("\tinstruccion_si -> SI expresion ENTONCES bloque_instrucciones \n");}
        | SI expresion ENTONCES bloque_instrucciones SINO bloque_instrucciones { printf("\tinstruccion_si -> SI expresion ENTONCES bloque_instrucciones SINO bloque_instrucciones \n");}
	;

instruccion_casos : EN CASO expresion SEA casos ';' { printf("\tinstruccion_casos -> EN CASO expresion SEA casos ';' \n");} 
	;

casos : caso { printf("\tcasos -> caso \n");}
        | casos caso { printf("\tcasos -> casos caso \n");}
	;

caso : CUANDO entradas FLECHA_DOBLE bloque_instrucciones { printf("\tcaso -> CUANDO entradas FLECHA_DOBLE bloque_instrucciones \n");}
	;

entradas : entrada { printf("\tentradas -> entrada \n");}
        | entrada_or_zero_mas entrada { printf("\tentradas -> entrada_or_zero_mas entrada \n");}
	;

entrada_or_zero_mas : entrada '|' { printf("\tentrada_or_zero_mas -> entrada '|' \n");}
        | entrada_or_zero_mas entrada '|' { printf("\tentrada_or_zero_mas -> entrada_or_zero_mas entrada '|' \n");}
	;

entrada : expresion { printf("\tentradas -> expresion \n");}
        | rango { printf("\tentradas -> rango \n");}
        | OTRO { printf("\tentradas -> OTRO \n");}
	;

instruccion_bucle : clausula_iteracion bloque_instrucciones { printf("\tinstruccion_bucle -> clausula_iteracion bloque_instrucciones \n");}
	;

clausula_iteracion : PARA nombre EN objeto { printf("\tclausula_iteracion -> PARA nombre EN objeto \n");}
        | REPITE ELEMENTO nombre EN rango { printf("\tclausula_iteracion -> REPITE ELEMENTO nombre EN rango \n");}
        | REPITE ELEMENTO nombre EN rango DESCENDENTE { printf("\tclausula_iteracion -> REPITE ELEMENTO nombre EN rango DESCENDENTE \n");}
        | MIENTRAS expresion { printf("\tclausula_iteracion -> MIENTRAS expresion \n");}
        | REPITE HASTA expresion { printf("\tclausula_iteracion -> REPITE HASTA expresion \n");}
	;

instruccion_probar_excepto : PROBAR bloque_instrucciones EXCEPTO clausulas_excepcion { printf("\tinstruccion_probar_excepto -> PROBAR bloque_instrucciones EXCEPTO clausulas_excepcion \n");}
        | PROBAR bloque_instrucciones EXCEPTO clausulas_excepcion FINALMENTE bloque_instrucciones { printf("\tinstruccion_probar_excepto -> PROBAR bloque_instrucciones EXCEPTO clausulas_excepcion FINALMENTE bloque_instrucciones \n");}
	;

clausulas_excepcion : clausula_excepcion { printf("\tclausulas_excepcion -> clausula_excepcion \n");}
        | clausulas_excepcion clausula_excepcion { printf("\tclausulas_excepcion -> clausulas_excepcion clausula_excepcion \n");}
	;

clausula_excepcion : CUANDO nombre EJECUTA bloque_instrucciones { printf("\tclausula_excepcion -> CUANDO nombre EJECUTA bloque_instrucciones \n");}
	;

instruccion_lanzar : LANZAR nombre ';' { printf("\tinstruccion_lanzar -> LANZAR nombre ';' \n");}        
	;

/***************/
/* expresiones */
/***************/

expresion_primaria : expresion_constante { printf("\texpresion_primaria -> expresion_constante \n");}
        | objeto { printf("\texpresion_primaria -> objeto \n");}
        | llamada_subprograma { printf("\texpresion_primaria -> llamada_subprograma \n");}
        | '(' expresion ')' { printf("\texpresion_primaria -> '(' expresion ')' \n");}
	;

objeto : nombre { printf("\tobjeto -> nombre \n");}
        | objeto '[' lista_expresiones ']' { printf("\tobjeto -> objeto '[' lista_expresiones ']' \n");}
        | objeto '.' IDENTIFICADOR { printf("\tobjeto -> objeto '.' IDENTIFICADOR \n");}
	;

lista_expresiones: expresion { printf ("\tlista_expresiones -> expresion \n"); }
        | lista_expresiones ',' expresion { printf("\tlista_expresiones -> lista_expresiones ',' expresion \n");}
	;

expresion_constante : CTC_ENTERA { printf("\texpresion_constante -> CTC_ENTERA \n");}
        | CTC_REAL { printf("\texpresion_constante -> CTC_REAL \n");}
        | CTC_CADENA { printf("\texpresion_constante -> CTC_CADENA \n");}
        | CTC_CARACTER { printf("\texpresion_constante -> CTC_CARACTER \n");}
        | CTC_BOOLEANA { printf("\texpresion_constante -> CTC_BOOLEANA \n");}
	;

expresion : expresion_primaria { printf("\texpresion -> expresion_primaria \n");}
        | '-' expresion %prec NEGACION { printf("\texpresion -> '-' expresion \n");}
        | expresion POTENCIA expresion { printf("\texpresion -> expresion POTENCIA expresion \n");}
        | expresion '*' expresion { printf("\texpresion -> expresion '*' expresion \n");}        
        | expresion '/' expresion { printf("\texpresion -> expresion '/' expresion \n");}
        | expresion '%' expresion { printf("\texpresion -> expresion 'modulo' expresion \n");}
        | expresion '+' expresion { printf("\texpresion -> expresion '+' expresion \n");}
        | expresion '-' expresion { printf("\texpresion -> expresion '-' expresion \n");}
        | expresion DESPD expresion { printf("\texpresion -> expresion DESPD expresion \n");}
        | expresion DESPI expresion { printf("\texpresion -> expresion DESPI expresion \n");}       
        | expresion '&' expresion { printf("\texpresion -> expresion '&' expresion \n");}
        | expresion '^' expresion { printf("\texpresion -> expresion '^' expresion \n");}
        | expresion '@' expresion { printf("\texpresion -> expresion '@' expresion \n");}
        | expresion '<' expresion { printf("\texpresion -> expresion '<' expresion \n");}
        | expresion '>' expresion { printf("\texpresion -> expresion '>' expresion \n");}
        | expresion LEQ expresion { printf("\texpresion -> expresion LEQ expresion \n");}
        | expresion GEQ expresion { printf("\texpresion -> expresion GEQ expresion \n");}
        | expresion NEQ expresion { printf("\texpresion -> expresion NEQ expresion \n");}
        | expresion EQ expresion { printf("\texpresion -> expresion EQ expresion \n");}
        | '!'  expresion { printf("\texpresion -> '!'  expresion \n");}
        | expresion AND expresion { printf("\texpresion -> expresion AND expresion \n");}
        | expresion OR expresion { printf("\texpresion -> expresion OR expresion \n");}
	;

%%

int yyerror(char *s) {
        fflush(stdout);
        printf("***************** %s\n",s);
}

int yywrap() {
        return(1);
}

int main(int argc, char *argv[]) {
        yydebug = 0;
        if (argc < 2) {
                printf("Uso: ./moronico NombreArchivo \n");
        } else {
                yyin = fopen(argv[1],"r \n");
                yyparse();
        }
}
