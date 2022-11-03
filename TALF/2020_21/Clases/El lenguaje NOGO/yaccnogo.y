%{
#include <stdio.h>
#include <ctype.h>
%}
%token KW_PVIR
%token KW_DPIN
%token KW_DPINEQUL
%token KW_POUV
%token KW_PFER
%token KW_POINPOIN
%token KW_VIRG
%token KW_POIN
%token KW_EQUL
%token KW_SLAHEQUL
%token KW_INFE
%token KW_INFEEQUL
%token KW_SUPE
%token KW_SUPEEQUL
%token KW_PLUS
%token KW_MINU
%token KW_ETOI
%token KW_SLAH
%token IDENT
%token INTEGER
%token CHAR
%token STRING
%token EN_IDENT
%token EN_CORPSSPROG
%token EN_LDECL
%token EN_DECL
%token EN_LIDENT
%token EN_TYPETAB
%token EN_TYPECOMP
%token EN_LCHAMPS
%token EN_CHAMPS
%token EN_INTERVALLE
%token EN_SPECSSPROG
%token EN_LDECLPARAM
%token EN_DECLPARAM
%token EN_MODE
%token EN_LINSTR
%token EN_INSTR
%token EN_PARELSE
%token EN_ITERATION
%token EN_BOUCLEBASE
%token EN_LEXPR
%token EN_NOM
%token EN_COMPOSANT
%token EN_EXPR
%token EN_IDENT_OU_VIDE
%token EN_LITTERAL
%token META
%token KW_and
%token KW_AND
%token KW_ARRAY
%token KW_array
%token KW_BEGIN
%token KW_begin
%token KW_CONSTANT
%token KW_constant
%token KW_DECLARE
%token KW_declare
%token KW_ELSE
%token KW_else
%token KW_END
%token KW_end
%token KW_EXIT
%token KW_exit
%token KW_FOR
%token KW_for
%token KW_FUNCTION
%token KW_function
%token KW_IF
%token KW_if
%token KW_IN
%token KW_in
%token KW_IS
%token KW_is
%token KW_LOOP
%token KW_loop
%token KW_MOD
%token KW_mod
%token KW_NOT
%token KW_not
%token KW_NULL
%token KW_null
%token KW_OF
%token KW_of
%token KW_OR
%token KW_or
%token KW_OUT
%token KW_out
%token KW_PROCEDURE
%token KW_procedure
%token KW_RECORD
%token KW_record
%token KW_return
%token KW_REVERSE
%token KW_reverse
%token KW_RETURN
%token KW_THEN
%token KW_then
%token KW_TYPE
%token KW_type
%token KW_WHEN
%token KW_when
%token KW_WHILE
%token KW_while
%start NT_programme
%%
NT_programme : NT_kw_procedure  NT_ident  NT_corps_ss_prog  NT_ident_ou_vide  
KW_PVIR  
   ;
NT_corps_ss_prog : NT_kw_is  NT_declaration_s  NT_kw_begin  NT_instruction_s  
NT_kw_end  
   ;
NT_declaration_s : 
   ;
NT_declaration_s : NT_declaration_s  NT_declaration  
   ;
NT_declaration : NT_decl_objet  
   ;
NT_declaration : NT_decl_type  
   ;
NT_declaration : NT_decl_ss_prog  
   ;
NT_decl_objet : NT_decl_vars  
   ;
NT_decl_objet : NT_decl_consts  
   ;
NT_decl_objet : NT_decl_tableau  
   ;
NT_decl_vars : NT_ident_s  KW_DPIN  NT_nom_type  NT_expr_init  KW_PVIR  
   ;
NT_expr_init : KW_DPINEQUL  NT_expr  
   ;
NT_expr_init : 
   ;
NT_decl_consts : NT_ident_s  KW_DPIN  NT_kw_constant  NT_nom_type  KW_DPINEQUL
  NT_expr  KW_PVIR  
   ;
NT_decl_tableau : NT_ident_s  KW_DPIN  NT_type_tableau  KW_PVIR  
   ;
NT_decl_type : NT_kw_type  NT_nom_type  NT_kw_is  NT_type_composite  KW_PVIR  
   ;
NT_type_composite : NT_type_enregistrement  
   ;
NT_type_composite : NT_type_tableau  
   ;
NT_type_enregistrement : NT_kw_record  NT_liste_champ_s  NT_kw_end  
NT_kw_record  
   ;
NT_liste_champ_s : NT_liste_champ_s  NT_champ_s  
   ;
NT_liste_champ_s : NT_champ_s  
   ;
NT_champ_s : NT_ident_s  KW_DPIN  NT_nom_type  KW_PVIR  
   ;
NT_champ_s : NT_ident_s  KW_DPIN  NT_type_tableau  KW_PVIR  
   ;
NT_type_tableau : NT_kw_array  KW_POUV  NT_intervalle  KW_PFER  NT_kw_of  
NT_nom_type  
   ;
NT_intervalle : NT_expr  KW_POINPOIN  NT_expr  
   ;
NT_nom_type : NT_ident  
   ;
NT_decl_ss_prog : NT_specif_ss_prog  NT_corps_ss_prog  NT_ident_ou_vide  
KW_PVIR  
   ;
NT_decl_ss_prog : NT_specif_ss_prog  KW_PVIR  
   ;
NT_specif_ss_prog : NT_kw_procedure  NT_ident  NT_partie_formelle  
   ;
NT_specif_ss_prog : NT_kw_function  NT_ident  NT_partie_formelle  NT_kw_return
  NT_nom_type  
   ;
NT_partie_formelle : KW_POUV  NT_decl_parametre_s  KW_PFER  
   ;
NT_partie_formelle : 
   ;
NT_decl_parametre_s : NT_decl_parametre_s  KW_PVIR  NT_decl_parametre  
   ;
NT_decl_parametre_s : NT_decl_parametre  
   ;
NT_decl_parametre : NT_ident_s  KW_DPIN  NT_mode  NT_nom_type  
   ;
NT_mode : NT_kw_in  NT_kw_out  
;
NT_mode : 
   ;
NT_mode : NT_kw_in  
   ;
NT_instruction_s : NT_instruction_s  NT_instruction  
   ;
NT_instruction_s : NT_instruction  
   ;
NT_instruction : NT_instruction_composee  
   ;
NT_instruction : NT_instruction_simple  
   ;
NT_instruction_composee : NT_instruction_if  
   ;
NT_instruction_composee : NT_instruction_loop  
   ;
NT_instruction_composee : NT_instruction_bloc  
   ;
NT_instruction_simple : NT_instruction_vide  
   ;
NT_instruction_simple : NT_instruction_exit  
   ;
NT_instruction_simple : NT_instruction_return  
   ;
NT_instruction_simple : NT_instruction_affectation  
   ;
NT_instruction_simple : NT_appel_procedure  
   ;
NT_instruction_if : NT_kw_if  NT_expr  NT_kw_then  NT_instruction_s  
NT_partie_else  NT_kw_end  NT_kw_if  KW_PVIR  
   ;
NT_partie_else : NT_kw_else  NT_instruction_s  
   ;
NT_partie_else : 
   ;
NT_instruction_loop : NT_ident_loop  NT_clause_iteration  NT_boucle_base  
KW_PVIR  
   ;
NT_ident_loop : NT_ident  KW_DPIN  
   ;
NT_ident_loop : 
   ;
NT_clause_iteration : NT_kw_for  NT_ident  NT_kw_in  NT_reverse_ou_vide  
NT_intervalle  
   ;
NT_reverse_ou_vide : 
;
NT_reverse_ou_vide : NT_kw_reverse  
   ;
NT_clause_iteration : NT_kw_while  NT_expr  
   ;
NT_clause_iteration : 
   ;
NT_boucle_base : NT_kw_loop  NT_instruction_s  NT_kw_end  NT_kw_loop  
NT_ident_ou_vide  
   ;
NT_instruction_bloc : NT_kw_declare  NT_declaration_s  NT_kw_begin  
NT_instruction_s  NT_kw_end  KW_PVIR  
   ;
NT_instruction_vide : NT_kw_null  KW_PVIR  
   ;
NT_instruction_exit : NT_kw_exit  NT_ident_ou_vide  NT_expr_exit  KW_PVIR  
   ;
NT_expr_exit : NT_kw_when  NT_expr  
   ;
NT_expr_exit : 
   ;
NT_instruction_return : NT_kw_return  NT_expr  KW_PVIR  
   ;
NT_instruction_return : NT_kw_return  KW_PVIR  
   ;
NT_instruction_affectation : NT_nom  KW_DPINEQUL  NT_expr  KW_PVIR  
   ;
NT_appel_procedure : NT_ambig_fonction_tableau  KW_PVIR  
   ;
NT_appel_procedure : NT_ident  KW_PVIR  
   ;
NT_appel_procedure : NT_ident  NT_au_moins_deux_params  KW_PVIR  
   ;
NT_au_moins_deux_params : KW_POUV  NT_expr_s  KW_VIRG  NT_expr  KW_PFER  
   ;
NT_expr_s : NT_expr  
   ;
NT_expr_s : NT_expr_s  KW_VIRG  NT_expr  
   ;
NT_nom : NT_ident  
   ;
NT_nom : NT_composant  
   ;
NT_composant : NT_composant_selectionne  
   ;
NT_composant : NT_composant_indexe  
   ;
NT_composant_selectionne : NT_nom  KW_POIN  NT_ident  
   ;
NT_composant_indexe : NT_composant  KW_POUV  NT_expr  KW_PFER  
   ;
NT_composant : NT_ambig_fonction_tableau  
   ;
NT_ambig_fonction_tableau : NT_ident  KW_POUV  NT_expr  KW_PFER  
   ;
NT_appel_fonction : NT_ident  KW_POUV  KW_PFER  
   ;
NT_appel_fonction : NT_ident  NT_au_moins_deux_params  
   ;
NT_expr : NT_expr  NT_kw_and  NT_relation  
   ;
NT_expr : NT_expr  NT_kw_or  NT_relation  
   ;
NT_expr : NT_relation  
   ;
NT_relation : NT_expr_simple  KW_EQUL  NT_expr_simple  
   ;
NT_relation : NT_expr_simple  KW_SLAHEQUL  NT_expr_simple  
   ;
NT_relation : NT_expr_simple  KW_INFE  NT_expr_simple  
   ;
NT_relation : NT_expr_simple  KW_INFEEQUL  NT_expr_simple  
   ;
NT_relation : NT_expr_simple  KW_SUPE  NT_expr_simple  
   ;
NT_relation : NT_expr_simple  KW_SUPEEQUL  NT_expr_simple  
   ;
NT_relation : NT_expr_simple  
   ;
NT_expr_simple : NT_expr_simple  KW_PLUS  NT_terme  
   ;
NT_expr_simple : NT_expr_simple  KW_MINU  NT_terme  
   ;
NT_expr_simple : NT_terme  
   ;
NT_expr_simple : KW_PLUS  NT_terme  
   ;
NT_expr_simple : KW_MINU  NT_terme  
   ;
NT_terme : NT_terme  KW_ETOI  NT_facteur  
   ;
NT_terme : NT_terme  KW_SLAH  NT_facteur  
   ;
NT_terme : NT_terme  NT_kw_mod  NT_facteur  
   ;
NT_terme : NT_facteur  
   ;
NT_facteur : NT_kw_not  NT_primaire  
   ;
NT_facteur : NT_primaire  
   ;
NT_primaire : NT_litteral  
   ;
NT_primaire : NT_nom  
   ;
NT_primaire : NT_appel_fonction  
   ;
NT_primaire : KW_POUV  NT_expr  KW_PFER  
   ;
NT_ident_s : NT_ident_s  KW_VIRG  NT_ident  
   ;
NT_ident_s : NT_ident  
   ;
NT_ident_ou_vide : NT_ident  
   ;
NT_ident_ou_vide : 
   ;
NT_ident : IDENT  
   ;
NT_litteral : INTEGER  
   ;
NT_litteral : CHAR  
   ;
NT_litteral : STRING  
   ;
NT_programme : EN_IDENT  NT_ident  
   ;
NT_programme : EN_IDENT  NT_metavar  
   ;
NT_programme : EN_CORPSSPROG  NT_corps_ss_prog  
   ;
NT_programme : EN_CORPSSPROG  NT_metavar  
   ;
NT_programme : EN_LDECL  NT_declaration_s  
   ;
NT_programme : EN_LDECL  NT_metavar  
   ;
NT_programme : EN_DECL  NT_declaration  
   ;
NT_programme : EN_DECL  NT_metavar  
   ;
NT_programme : EN_LIDENT  NT_ident_s  
   ;
NT_programme : EN_LIDENT  NT_metavar  
   ;
NT_programme : EN_TYPETAB  NT_type_tableau  
   ;
NT_programme : EN_TYPETAB  NT_metavar  
   ;
NT_programme : EN_TYPECOMP  NT_type_composite  
   ;
NT_programme : EN_TYPECOMP  NT_metavar  
   ;
NT_programme : EN_LCHAMPS  NT_liste_champ_s  
   ;
NT_programme : EN_LCHAMPS  NT_metavar  
   ;
NT_programme : EN_CHAMPS  NT_champ_s  
   ;
NT_programme : EN_CHAMPS  NT_metavar  
   ;
NT_programme : EN_INTERVALLE  NT_intervalle  
   ;
NT_programme : EN_INTERVALLE  NT_metavar  
   ;
NT_programme : EN_SPECSSPROG  NT_specif_ss_prog  
   ;
NT_programme : EN_SPECSSPROG  NT_metavar  
   ;
NT_programme : EN_LDECLPARAM  NT_partie_formelle  
   ;
NT_programme : EN_LDECLPARAM  NT_metavar  
   ;
NT_programme : EN_DECLPARAM  NT_decl_parametre  
   ;
NT_programme : EN_DECLPARAM  NT_metavar  
   ;
NT_programme : EN_MODE  NT_mode  
   ;
NT_programme : EN_MODE  NT_metavar  
   ;
NT_programme : EN_LINSTR  NT_instruction_s  
   ;
NT_programme : EN_LINSTR  NT_metavar  
   ;
NT_programme : EN_INSTR  NT_instruction  
   ;
NT_programme : EN_INSTR  NT_metavar  
   ;
NT_programme : EN_PARELSE  NT_partie_else  
   ;
NT_programme : EN_PARELSE  NT_metavar  
   ;
NT_programme : EN_ITERATION  NT_clause_iteration  
   ;
NT_programme : EN_ITERATION  NT_metavar  
   ;
NT_programme : EN_BOUCLEBASE  NT_boucle_base  
   ;
NT_programme : EN_BOUCLEBASE  NT_metavar  
   ;
NT_programme : EN_LEXPR  NT_expr_s  
   ;
NT_programme : EN_LEXPR  NT_metavar  
   ;
NT_programme : EN_NOM  NT_nom  
   ;
NT_programme : EN_NOM  NT_metavar  
   ;
NT_programme : EN_COMPOSANT  NT_composant  
   ;
NT_programme : EN_EXPR  NT_expr  
   ;
NT_programme : EN_EXPR  NT_metavar  
   ;
NT_programme : EN_COMPOSANT  NT_metavar  
   ;
NT_programme : EN_IDENT_OU_VIDE  NT_ident_ou_vide  
   ;
NT_programme : EN_IDENT_OU_VIDE  NT_metavar  
   ;
NT_programme : EN_LITTERAL  NT_litteral  
   ;
NT_programme : EN_LITTERAL  NT_metavar  
   ;
NT_metavar : META  
   ;
NT_kw_and : KW_and  
   ;
NT_kw_and : KW_AND  
   ;
NT_kw_array : KW_ARRAY  
   ;
NT_kw_array : KW_array  
   ;
NT_kw_begin : KW_BEGIN  
   ;
NT_kw_begin : KW_begin  
   ;
NT_kw_constant : KW_CONSTANT  
   ;
NT_kw_constant : KW_constant  
   ;
NT_kw_declare : KW_DECLARE  
   ;
NT_kw_declare : KW_declare  
   ;
NT_kw_else : KW_ELSE  
   ;
NT_kw_else : KW_else  
   ;
NT_kw_end : KW_END  
   ;
NT_kw_end : KW_end  
   ;
NT_kw_exit : KW_EXIT  
   ;
NT_kw_exit : KW_exit  
   ;
NT_kw_for : KW_FOR  
   ;
NT_kw_for : KW_for  
   ;
NT_kw_function : KW_FUNCTION  
   ;
NT_kw_function : KW_function  
   ;
NT_kw_if : KW_IF  
   ;
NT_kw_if : KW_if  
   ;
NT_kw_in : KW_IN  
   ;
NT_kw_in : KW_in  
   ;
NT_kw_is : KW_IS  
   ;
NT_kw_is : KW_is  
   ;
NT_kw_loop : KW_LOOP  
   ;
NT_kw_loop : KW_loop  
   ;
NT_kw_mod : KW_MOD  
   ;
NT_kw_mod : KW_mod  
   ;
NT_kw_not : KW_NOT  
   ;
NT_kw_not : KW_not  
   ;
NT_kw_null : KW_NULL  
   ;
NT_kw_null : KW_null  
   ;
NT_kw_of : KW_OF  
   ;
NT_kw_of : KW_of  
   ;
NT_kw_or : KW_OR  
   ;
NT_kw_or : KW_or  
   ;
NT_kw_out : KW_OUT  
   ;
NT_kw_out : KW_out  
   ;
NT_kw_procedure : KW_PROCEDURE  
   ;
NT_kw_procedure : KW_procedure  
   ;
NT_kw_record : KW_RECORD  
   ;
NT_kw_record : KW_record  
   ;
NT_kw_return : KW_return  
   ;
NT_kw_reverse : KW_REVERSE  
   ;
NT_kw_reverse : KW_reverse  
   ;
NT_kw_return : KW_RETURN  
   ;
NT_kw_then : KW_THEN  
   ;
NT_kw_then : KW_then  
   ;
NT_kw_type : KW_TYPE  
   ;
NT_kw_type : KW_type  
   ;
NT_kw_when : KW_WHEN  
   ;
NT_kw_when : KW_when  
   ;
NT_kw_while : KW_WHILE  
   ;
NT_kw_while : KW_while  
   ;
%%
#include "lex.yy.c"

yyerror (s)
     char *s;
{
    printf ("%s\n",s);
}

main ()
{
    yyparse ();
}
