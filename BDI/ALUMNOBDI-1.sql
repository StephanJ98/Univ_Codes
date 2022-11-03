SELECT *
FROM TEMPLE;

SELECT SALAR*12 AS SALARIO_ANUAL
FROM TEMPLE
WHERE SALAR*12>25000
ORDER BY 1; /*DESC lo hace de modo descendente*/

/*EJERCICIOS SQL 1 */

/* EJ 1*/
SELECT NOMEM
FROM TEMPLE
WHERE NUMDE=121;

/* EJ 2 */
SELECT *
FROM TDEPTO
WHERE NUMDE=121;

/* EJ 3 */
SELECT NOMEM, SALAR
FROM TEMPLE
WHERE NUMHI>3
ORDER BY NOMEM;

/* Ej 4 */
SELECT COMIS, NUMDE, NOMEM
FROM TEMPLE
WHERE SALAR<1900
ORDER BY NUMDE, COMIS DESC;

/* EJ 5 */
SELECT COMIS AS COMISION, NUMDE AS DEPTO, NOMEM AS EMPLEADO
FROM TEMPLE
WHERE SALAR<1900
ORDER BY NUMDE, COMIS DESC;

/* EJ 6 */
SELECT NOMDE
FROM TDEPTO
WHERE PRESU>20
ORDER BY 1;

/* EJ 7 */
SELECT NUMDE
FROM TEMPLE
WHERE SALAR<2500;

/* EJ 8 */
SELECT DISTINCT COMIS
FROM TEMPLE
WHERE NUMDE=110;

/* EJ 9 */
SELECT DISTINCT SALAR, COMIS
FROM TEMPLE
WHERE NUMDE=111
ORDER BY SALAR, COMIS;

/* EJ 10 */
SELECT NOMEM
FROM TEMPLE
WHERE COMIS>=SALAR/2
ORDER BY NOMEM;

/* EJ 11 */
SELECT NOMEM, SALAR+(30*(NUMHI-3))
FROM TEMPLE
WHERE NUMHI>3
ORDER BY NOMEM;

/* EJ 12 */
SELECT 'departamento de ' || NOMDE
/* SELECT 'departamento de ' NOMDE*   Tambi�n sirve */
FROM TDEPTO
WHERE PRESU<30
ORDER BY NOMDE;

/* EJ 13 */
SELECT NOMDE, PRESU*1.1
FROM TDEPTO
WHERE PRESU/12>3
ORDER BY NOMDE;

/* EJ 14 */
SELECT NOMEM, SALAR*12 AS SUELDO_ACTUAL, SALAR*12*1.06 AS SUELDO_DENTRO_1A�O, SALAR*12*1.06*1.06 AS SUELDO_DENTRO_2A�O, SALAR*12*1.06*1.06*1.06 AS SUELDO_DENTRO_3A�O
FROM TEMPLE
WHERE NUMHI>4
ORDER BY NOMEM;

/* EJ 15 */
SELECT NOMEM
FROM TEMPLE
WHERE NUMHI*60<SALAR*0.1
ORDER BY NOMEM;

/* EJ 16 */
SELECT NOMEM, SALAR+COMIS AS SALAR_TOTAL
FROM TEMPLE
WHERE NUMDE=112
ORDER BY (SALAR+COMIS) DESC, NOMEM;

/* Ej 17 */
SELECT NOMEM, SALAR+COMIS AS SALAR_TOTAL
FROM TEMPLE
WHERE SALAR+COMIS>1800
ORDER BY NUMEM;

/* EJ 18 */
SELECT DISTINCT NUMDE
FROM TEMPLE
WHERE COMIS>SALAR*0.2;
