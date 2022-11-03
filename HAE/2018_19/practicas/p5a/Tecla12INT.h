// Funcion utilizada con un teclado de 12 teclas (hay que guardar este archivo en 
// la carpeta del proyecto)
// Esta funcion utiliza una interrupcion para detectar cuándo se pulsa una tecla
// de un teclado. No se necesita poner resistencias de pull-down en los terminales
// A, B, C y D.

// 1-RB0, 2-RB1, 3-RB2, A-RB4, B-RB5, C-RB6, D-RB7
// Columnas: 1, 2, 3,   filas: A, B, C, D

// Los terminales del puerto B conectados a las filas (RB4-RB7) se configuran
// como entradas y se les activan las resistencias de pull-up. Los terminales del
// puerto B conectados a las columnas se configuran como salidas y se ponen a 0.
// Cuando se pulsa una tecla, la fila correspondiente a la tecla pulsada se pone
// a 0. Para determinar la columna correspondiente a la tecla pulsada se van
// poniendo a 1 una a una las columnas hasta que la fila correspondiente a la
// tecla pulsada se pone a 1.

// La funcion tecla() devuelve el caracter correspondiente a la tecla pulsada

#define MASK 0xF0
#define Rows 4 //numero de filas del teclado
#define Debounce 10 //mseg que se espera antes de determinar la tecla pulsada

//Función tecla
unsigned char tecla() // Esta funcion devuelve el valor asociado a la tecla
{                      // pulsada, una vez que se ha dejado de pulsar.

unsigned char columna=0, fila, aux1=0x10, aux2;

unsigned char teclado[4][3]={{49, 50, 51},{52, 53, 54},{55, 56, 57}, {42, 48, 35}};

delay_ms(Debounce);// antes de empezar a escanear las filas y las columnas se
                  // esperan 10ms para evitar problemas de rebotes.
 for(fila=0; fila<Rows; fila++) // escaneamos las filas para averiguar la fila
 {                           // correspondiente a la tecla pulsada.
  if((PORTB&aux1)==0x00) break; //en la fila de la tecla pulsada hay un 0 y en
  aux1=(aux1<<1);                //las demás hay un 1.
 }

 PORTB=0x01; // valor del puerto B para escanear la primera columna (columna=0).

 while((PORTB&MASK)!=MASK)// se escanean las columnas hasta que se encuentra la
 {                       // columna correspondiente a la tecla pulsada. En dicho
  PORTB=(PORTB<<1);       //caso, las filas estarán todas a 1. Al escanear las
  columna++;            //columnas se produce un flanco de subida en el terminal
 }                      //correspondiente a la fila de la tecla pulsada, lo que
                    //da lugar a que el bit RBIF se ponga a 1 (si no lo está ya)

 PORTB=0x00; //condiciones del PORTB de espera a que se pulse una nueva tecla

 do // esperamos a que se deje de pulsar la tecla para enviar su valor.
 {delay_ms(2);
 }while((PORTB&0xF0)!=0xF0); //Al soltar la tecla, se produce un cambio de nivel
                          //en el terminal correspondiente a la fila de la tecla
                            //pulsada. Lo que provoca que el bit RBIF se ponga a
                            //1 si no lo está ya!.
 aux2=teclado[fila][columna];//devuelve el valor ASCII de la tecla pulsada
 return aux2;
}



/* ************************************************************************************ */

// "ALGUNOS" DATOS PARA EL PROGRAMA: 

// fuera de cualquier función hay que poner:

// # INCLUDE "Tecla12INT.h"  (pon este archivo en la carpeta del proyecto)


/* ************************************************************************************ */

// EN main() HAY QUE PONER (entre otras cosas) LO SIGUIENTE:

// TRISB=0xF0;  // el nibble alto son entradas y el nibble bajo son salidas
// PORTB=0;

// Configuracion interrupcion RB4-RB7

// INTCON2.RBPU=0; //se habilitan las resistencias de pullup de las entradas del PORTB 
// x=PORTB;//para poder borrar el RBIF
// INTCON.RBIF=0;
// INTCON.RBIE=1;
// INTCON.GIE=1;

/* ************************************************************************************ */


// EN LA RUTINA DE SERVICIO DE LA INTERRUPCIÓN (entre otras cosas) HAY QUE PONER LO SIGUIENTE:

// void interrupt() //se ha pulsado una tecla
// {
//  key=tecla();
//  ...
//  x=PORTB; //hay que leer el puerto B para poder borrar el bit RBIF (define x global)
//  INTCON.RBIF=0;//Al borrar el bit RBIF despues de llamar a la funcion tecla, nos
// }           //aseguramos que después de soltar la tecla éste bit se pone a 0.

/* ************************************************************************************ */