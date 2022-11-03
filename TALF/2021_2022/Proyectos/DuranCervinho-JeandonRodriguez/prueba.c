using MATH = math;
using STDIO = stdio;

unsigned short int prueba;

double PI = 3.141592;  // variable global

float areaRectangulo(float Base=1,altura=1) {
  return Base*altura;
  }

void altaUsuario(char *nombre,direccion; int edad; float peso,altura) {
  // algo de codigo aqui
  }

struct miStruct {
  int campoArray[];
  union {
    char *subcampoUno = "hola";
    <predefinido> subcampoDos = -134;
    } campoUnion;
  }

public interface arbolBinario : arbol {
    boolean vacio();
    <arbolBinario> hijoDcho();
    <arbolBinario> hijoIzdo();
    boolean esta(<elem> elemento);
    void setRaiz(<elem> elemento);
    void setHijoDcho(<arbolBinario> arbol);
    void setHijoIzdo(<arbolBinario> tree);
    void vaciar();
    }

public interface forma {
   float volumen();
   }

public class esfera : forma {
   private float radio;
   esfera (float radio) : base () {
     esfera.radio = radio;
     }    
   public float volumen() {
     return (4/3*PI*pow(radio,3));
     }
   ~ destructor () {}
   }

public enum color : int {
   rojo = 1,
   verde = 2,
   azul = 3
   }

int circunferencia () {
   /* Variables */
   float area, radio;

   <esfera> prueba = new esfera();

   printf("\nRadio de la /*circunferencia*/\
            : ");
   scanf("%f", &radio); /* Entrada de dato */

   /* Calculo del area */
   area = PI * pow(radio, 2);

   /* El resultado del área se saca por la "consola":
      se trata de un número real */
   printf("\nArea de la \"circunferencia\": %f", area); printf("\n");

   return 0;
   }

unsigned short int valores[] = { 88, 56, 100, 2, 25 };
int lista[2][] = {{1,2,3}, {4,5}};

typedef unsigned short int entero;

struct nombre_tag {
   <entero> *campo1;
   float campo2;
   struct {
     char subcampo31;
     <entero> subcampo32;
     } campo3;
   }

typedef <nombre_tag> struct_alias;

struct cuenta {
   int numero_cuenta;
   char *nombre;
   char *apellido;
   float saldo;
   }

namespace ordenar {

   int cmpfunc (int * a,b){
      return ( *(int*)a - *(int*)b );
      }

   int sort_list (int n) {

      printf("Before sorting the list is: \n");
      for( n = 0 ; n < 5; n++ ) {
         printf("%d ", values[n]);
         }

      qsort(values, 5, sizeof(int), cmpfunc);

      printf("\nAfter sorting the list is: \n");
      for( n = 0 ; n < 5; n++ ) {
         if (n > 1)
           printf("%d ", values[n]);
         else
           printf("*********%d ", values[n]);
         }
  
      throw new excepcion();
      return(0);
      }
   }
