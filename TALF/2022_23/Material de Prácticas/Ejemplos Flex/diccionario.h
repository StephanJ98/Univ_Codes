#include <stdlib.h>
#include <stdio.h>

typedef struct entrada ENTRADA;

struct entrada {
  ENTRADA *siguiente;
  char *nombre;
  char *valor;
  };
  
typedef struct diccionario DICCIONARIO;

struct diccionario {
  ENTRADA *primera;
  int num_entradas;
  };
  
void* smalloc (size_t);

void inicializar_diccionario (DICCIONARIO*);

void liberar_diccionario (DICCIONARIO *);

ENTRADA* buscar_diccionario (DICCIONARIO*, char*);

void insertar_diccionario (DICCIONARIO*, char*, char*);

