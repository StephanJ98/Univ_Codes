#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "diccionario.h"

/**********************************************************************************/
/**********************************************************************************/

void* smalloc (size_t bytes) {
  void* ptr = malloc(bytes);
  
  if(ptr == NULL) {
    fprintf(stderr,"Problema al reservar memoria\n");
    exit(0);
    }
  else {
    return ptr;
    }
  }

/**********************************************************************************/
/**********************************************************************************/

void inicializar_diccionario (DICCIONARIO *diccionario) {
  diccionario = smalloc(sizeof(DICCIONARIO));
  
  diccionario->primera = NULL;
  diccionario->num_entradas = 0;
  }

/**********************************************************************************/
/**********************************************************************************/

void liberar_diccionario (DICCIONARIO *diccionario) {
  ENTRADA *proxima = diccionario->primera;
  ENTRADA *borrada;
  diccionario->num_entradas = 0;
  
  while (proxima != NULL) {
    borrada = proxima;
    proxima = proxima->siguiente;
    free(borrada);
    }
  }

/**********************************************************************************/
/**********************************************************************************/

ENTRADA* buscar_diccionario (DICCIONARIO *diccionario, char *nombre) {
  ENTRADA *entrada = diccionario->primera;
  int i;
  
  for (i=0; i<diccionario->num_entradas; i++) {
    if (!strcmp(entrada->nombre,nombre)) { return entrada; }
    entrada = entrada->siguiente;
    }
  
  return NULL;
  }

/**********************************************************************************/
/**********************************************************************************/

void insertar_diccionario (DICCIONARIO *diccionario, char *nombre, char *valor) {
  ENTRADA *nueva;
  ENTRADA *primera = diccionario->primera;
  int i;

  if (buscar_diccionario(diccionario,nombre) != NULL) {
    printf("Nombre ya declarado: %s\n",nombre);
    exit(0);
    }

  nueva = smalloc(sizeof(ENTRADA));
  nueva->siguiente = diccionario->primera;
  nueva->nombre = smalloc(sizeof(nombre)+1);
  nueva->valor = smalloc(sizeof(valor)+1);
  strcpy(nueva->nombre,nombre);
  strcpy(nueva->valor,valor);
  
  diccionario->primera = nueva;
  diccionario->num_entradas++;
  }
