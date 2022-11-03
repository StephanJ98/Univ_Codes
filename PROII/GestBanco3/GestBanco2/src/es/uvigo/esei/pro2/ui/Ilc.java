package es.uvigo.esei.pro2.ui;

import es.uvigo.esei.pro2.core.Banco;
import es.uvigo.esei.pro2.core.Cliente;
import es.uvigo.esei.pro2.core.Cuenta;
import es.uvigo.esei.pro2.core.Ahorro;
import es.uvigo.esei.pro2.core.Corriente;
import es.uvigo.esei.pro2.core.Fecha;
import Exceptions.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import nu.xom.ParsingException;

/**
 * Interfaz de lin. de comando
 */
public class Ilc {

    /**
     * Realiza el reparto de la funcionalidad ler = lee, evalua, repite
     */
    public void ler() {
        int op = 0;
        final String nombreFichero = "clientes.xml";
        
        Banco coleccion;
        try{
            coleccion = new Banco(nombreFichero);
        }catch(ParsingException | IOException pe ){
            System.err.println("Se ha producido un error en lectura de fichero: "+ pe.getMessage());
            // Lee el num. max. de clientes
            int maxClientes = leeEntero("Num. max. clientes: ");

            // Prepara
            String nombreBanco = leeCadena("Nombre del banco: ");
            coleccion = new Banco(nombreBanco, maxClientes);
        }



        // Bucle ppal
        do {
            try {
                System.out.println("\n--------------------------------");
                System.out.println("\nGestión de una entidad bancaria.");

                op = menu(coleccion);

                switch (op) {
                    case 0:
                        System.out.println("Fin gestión banco.");
                        
                        coleccion.toXML(nombreFichero);
                        
                        break;
                    case 1:
                        insertaCliente(coleccion);
                        break;
                    case 2:
                        modificaCliente(coleccion);
                        break;
                    case 3:
                        eliminaCliente(coleccion);
                        break;
                    case 4:
                        System.out.println(coleccion.toString());
                        break;
                    case 5:
                        System.out.println(listarPorTipoCuenta(coleccion));
                        break;
                    default:
                        System.out.println("No es correcta esa opción"
                                + " ( " + op + " )");
                }
            } catch (PosicionInvalidaException exc) {
                System.err.println("Error. " + exc.getMessage());
            }
            catch (SobrepasaLimiteException exc) {
                System.err.println("Error. " + exc.getMessage());
            }
            catch (UltimaCuentaException exc) {
                System.err.println("Error. " + exc.getMessage());
            }
            catch (BancoException exc) {
                System.err.println("Error. " + exc.getMessage());
            }catch(IOException ioe){
                System.err.println("Error de escritura de fichero");
            }
            
            catch (Exception exc) {
                System.err.println("Error. ");
                exc.printStackTrace();
            }

        } while (op != 0);

    }

    /**
     * Presenta un menu con las opciones, y permite seleccionar una.
     *
     * @return la opcion seleccionada, como entero
     */
    private int menu(Banco coleccion) {
        int toret;

        do {
            System.out.println("Numero de clientes: "
                    + coleccion.getNumClientes());

            System.out.println(
                    "\n1. Inserta un nuevo cliente\n"
                    + "2. Modifica un cliente\n"
                    + "3. Elimina un cliente\n"
                    + "4. Listar clientes\n"                            
                    + "5. Listar cuentas por tipo\n"
                    + "0. Salir\n");
            toret = leeEntero("Selecciona: ");
        } while (toret < 0 && toret > 5);

        System.out.println();
        return toret;
    }

    /**
     * Crea un nuevo cliente y lo inserta en la coleccion
     *
     * @param coleccion La coleccion en la que se inserta el cliente.
     */
    private void insertaCliente(Banco coleccion) throws UltimaCuentaException, SobrepasaLimiteException {
        System.out.println("\n------------");
        System.out.println("\nAlta cliente");

        Cliente c = leeCliente();
        coleccion.inserta(c);
    }

    /**
     * Borra un cliente por su posicion en la colección.
     *
     * @param coleccion La coleccion en la que se elimina el cliente
     */
    private void eliminaCliente(Banco coleccion) throws UltimaCuentaException, PosicionInvalidaException {
        System.out.println("\n------------");
        System.out.println("\nBaja cliente\n");

        if (coleccion.getNumClientes() < 1) {
            throw new UltimaCuentaException("No puede haber menos de 1 cuenta");
        }
        coleccion.elimina(leePosCliente(coleccion));
        
    }

    /**
     * Modifica un cliente existente.
     *
     * @param coleccion La coleccion de la cual modificar un cliente.
     */
    private void modificaCliente(Banco coleccion) throws BancoException {
        System.out.println("\n--------------------");
        System.out.println("\nModificación cliente");

        if (coleccion.getNumClientes() == 0) {
            throw new BancoException("No hay ningún cliente, introduce uno para poder modificar");
        } 
        this.modificaCliente(coleccion.get(leePosCliente(coleccion)));
            
        }
    

    /**
     * Lee del teclado los datos de un cliente
     *
     * @return El objeto Cliente creado
     */
    private Cliente leeCliente() throws UltimaCuentaException{
        System.out.println("\nIntroduce los datos del nuevo cliente:");

        String nombre = leeCadena("\tNombre: ");
        String dni = leeCadena("\tD.N.I.: ");
        String domicilio = leeCadena("\tDomicilio: ");
        boolean leido = false;
        int numCuentas = 0;
        do{
            try {
                numCuentas = leeEntero("\tNumero de cuentas: ");
                if (numCuentas < 1) {
                    throw new UltimaCuentaException("El número de cuentas no puede ser "
                            + "inferior a 1.");
                }
                leido = true;

            } catch (UltimaCuentaException ex) {
                System.err.println("ERROR: " + ex.getMessage());
            }
        }while(leido = false);
        

        ArrayList<Cuenta> cuentas = leerCuentas(numCuentas);

        return new Cliente(dni, nombre, domicilio, cuentas);
    }

    /**
     * Lee los datos de las cuentas bancarias
     *
     * @param numCuentas numero de cuentas a leer
     * @return Array con las cuentas bancarias creadas
     */
    private ArrayList<Cuenta> leerCuentas(int numCuentas) {
        ArrayList<Cuenta> cuentas = new ArrayList<Cuenta>(numCuentas);

        for (int i = 0; i < numCuentas; i++) {
            System.out.println("\n\tDatos de la cuenta número " + (i + 1));
            cuentas.add(leerCuenta());
        }
        //vale solo con: cuentas.add(leerCuenta());
        return cuentas;
    }

    /**
     * Lee del teclado los datos de una cuenta bancaria
     *
     * @return El objeto Cuenta creado
     */
    private Cuenta leerCuenta() {
        
        String numCuenta = leeCadena("\tNumero de cuenta: ");
        Fecha fechaApertura = leeFecha("\tFecha de apertura: ");
        Cuenta cuenta = null;

        
        switch(leeTipoCuenta("\tTipo de cuenta ")){
            case 'A':
                double interes = leeReal("\tInterés: ");
                cuenta = new Ahorro(interes, numCuenta, fechaApertura);
                break;
            case 'C':
                String numTarjeta = leeCadena("\tNúmero de tarjeta: ");
                Fecha fechaCaducidad = leeFecha("\tFecha de caducidad: ");
                cuenta = new Corriente(numTarjeta, fechaCaducidad, numCuenta, fechaApertura);     
        }

       return cuenta; 
    }

            

    

    

    /**
     * Modifica los datos de un cliente
     *
     * @param c Objeto Cliente a modificar
     */
    private void modificaCliente(Cliente c) throws UltimaCuentaException,PosicionInvalidaException  {
        int op = 0;

        System.out.println("\nModificando los datos del siguiente cliente:");
        System.out.println(c);
        System.out.println();

        String nombre = leeCadena("\tNombre [" + c.getNombre() + "]: ", true);
        if (!nombre.isEmpty()) {
            c.setNombre(nombre);
        }

        String dni = leeCadena("\tDNI [" + c.getDni() + "]: ", true);
        if (!dni.isEmpty()) {
            c.setDni(dni);
        }

        String domicilio = leeCadena("\tDomicilio [" + c.getDomicilio() + "]: ",
                true);
        if (!domicilio.isEmpty()) {
            c.setDomicilio(domicilio);
        }

        do {
            System.out.println("\nMenú de modificación de las cuentas:");

            op = menuEdicionCuentas();

            switch (op) {
                case 0:
                    System.out.println("Fin.");
                    break;
                case 1:
                    c.nuevaCuenta(leerCuenta());
                    break;
                case 2:
                    modificaCuenta(c, leePosCuenta(c.getNumCuentas()));
                    break;
                case 3:
                    c.eliminaCuenta(leePosCuenta(c.getNumCuentas()));
                    break;
                default:
                    System.out.println("No es correcta esa opción ( "
                            + op + " )");
            }
        } while (op != 0);
    }

    /**
     * Lee la posición de la cuenta a tratar
     *
     * @param numCuentas numero de cuentas existentes
     * @return int Posición/indice donde esta la cuenta a tratar
     */
    
    public char leeTipoCuenta(String msg){
        char opc;
        do{
            System.out.println(msg);
            opc = leeCaracter("\t(A: Ahorro, C: Corriente)");
        }while(opc!= 'A' && opc!='C');
        
        return opc;
    }
    
    
    private int leePosCuenta(int numCuentas) {
        int toret;

        do {
            toret = leeEntero("Introduzca posición de la cuenta (1..."
                    + numCuentas + "): ");
        } while (toret < 1 || toret > numCuentas);

        return toret - 1;
    }

    /**
     * Modifica los datos de una cuenta
     *
     * @param cuenta Objeto Cuenta a modificar
     */
    
    
    
    private Fecha leeFecha(String msg){
        int dia = -1; 
        int mes = -1;
        int anho = -1;
        Fecha toret;
        do{
            try{
            System.out.println(msg);
            dia = leeEntero("\t\tDía: ");
            mes = leeEntero("\t\tMes: ");
            anho = leeEntero("\t\tAño: ");
            
            if(dia<1 || dia>31 || mes<1 || mes>12 || anho<1900){
                throw new PosicionInvalidaException("Fecha incorrecta, revisa que el día, mes y año estén bien");
            }
            }catch(PosicionInvalidaException ex){
                System.err.println("ERROR: "+ex.getMessage());
            }

        }while(dia<1 || dia>31 || mes<1 || mes>12 || anho<1900);
        
        return toret = new Fecha(dia, mes, anho);
    }
    
    

    
    private void modificaCuenta(Cliente c, int posCuenta) throws UltimaCuentaException,PosicionInvalidaException {
        
        Cuenta cuenta = c.getCuenta(posCuenta);
        
        Corriente corriente;
        String numCuenta;
        Fecha fechaCaducidad;
        
        
        Ahorro ahorro;
        double interes;
        
        
        
        char tipoCuenta = leeTipoCuenta("Tipo de la cuenta");
        
        switch(tipoCuenta){
            case 'A':
                if(cuenta instanceof Corriente){
                    interes = leeReal("Interés: ");
                    ahorro = new Ahorro(interes, cuenta.getNumCuenta(), cuenta.getFechaApertura());
                    modificaCuentaBasica(ahorro);
                    c.nuevaCuenta(ahorro);
                    c.eliminaCuenta(posCuenta);
                    break;
                }else{
                    ahorro = (Ahorro) cuenta;
                    modificaAhorro(ahorro);
                    modificaCuentaBasica(ahorro);
                    c.nuevaCuenta(ahorro);
                    c.eliminaCuenta(posCuenta);
                }
            case 'C':
                if(cuenta instanceof Ahorro){
                    numCuenta = leeCadena("Número de la cuenta: ");
                    fechaCaducidad = leeFecha("Fecha de Caducidad: ");
                    corriente = new Corriente(numCuenta, fechaCaducidad, 
                            cuenta.getNumCuenta(), cuenta.getFechaApertura());
                    c.nuevaCuenta(corriente);
                    c.eliminaCuenta(posCuenta);
                }else{
                    corriente = (Corriente) cuenta;
                    modificaCorriente(corriente);
                    modificaCuentaBasica(corriente);
                    c.nuevaCuenta(corriente);
                    c.eliminaCuenta(posCuenta);
                }
            

        }
        
        
    }  
    private void modificaCuentaBasica(Cuenta c){
        String numCuenta;
        Fecha fechaApertura;
        
        numCuenta = leeCadena("Número de la cuenta["+c.getNumCuenta()+"]: ");
        fechaApertura = leeFecha("Fecha de apertura["+c.getFechaApertura().toString()+"]: ");
        
        if(!numCuenta.isEmpty()){
            c.setNumCuenta(numCuenta);
        }
        c.setFechaApertura(fechaApertura);
    }    
        
        
    private void modificaAhorro(Ahorro c){
        
        double interes;
        
        do{
            interes = leeReal("Interés["+c.getInteres()+"]:");
        }while(interes<0);
        
        c.setInteres(interes);

    }
      
    private void modificaCorriente(Corriente c){
        
        String numeroTarjeta;
        Fecha fechaCaducidad;
        
        numeroTarjeta = leeCadena("Número de Tarjeta["+c.getNumCuenta()+"]:");
        fechaCaducidad = leeFecha("Fecha Caducidad["+c.getFechaCaducidad()+"]:");
        
        if(!numeroTarjeta.isEmpty()){
            c.setNumeroTarjeta(numeroTarjeta);
        }
        c.setFechaCaducidad(fechaCaducidad);
                
    }
        
        

    /**
     * Visualiza el menu de gestión de cuentas y obtiene la opción deseada
     *
     * @return int Opción del menú elegida
     */
    private int menuEdicionCuentas() {
        int toret;

        do {
            System.out.println(
                    "\n1. Inserta una nueva cuenta\n"
                    + "2. Modifica una cuenta existente\n"
                    + "3. Elimina una cuenta existente\n"
                    + "0. Terminar\n");
            toret = leeEntero("Selecciona: ");
        } while (toret < 0 && toret > 3);

        System.out.println();
        return toret;
    }

    /**
     * Lee del teclado la posición de un cliente en la colección
     *
     * @param coleccion La colección de la que se obtiene el max.
     * @return la posición del cliente, como entero.
     */
    private int leePosCliente(Banco coleccion) {
        final int numClientes = coleccion.getNumClientes();
        int toret = -1;

        do {
            try{
            toret = leeEntero("Introduzca posición del cliente (1..."
                    + numClientes + "): ");
            if(toret < 1 || toret > numClientes) throw new SobrepasaLimiteException("Posición errónea (0-"+numClientes+"): "+toret);
            
            }catch(SobrepasaLimiteException ex){
                System.err.println("ERROR: "+ex.getMessage());
            }
        } while (toret < 1 || toret > numClientes);

        return toret - 1;
    }

    /**
     * Lista las cuentas del banco por tipo
     *
     * @param coleccion El Banco del que se listan las cuentas.
     */
    public String listarPorTipoCuenta(Banco coleccion) throws PosicionInvalidaException, BancoException {
        
        if(coleccion.getNumClientes() == 0){
            throw new BancoException("No hay clientes");
        }
        
        
        char tipo;
        tipo = leeTipoCuenta("Indica el tipo de cuentas a listar: ");
       
        return coleccion.listarPorTipoCuenta(tipo);
    }


    /* -------------------------------------------------------------*/
    //  METODOS PARA LA LECTURA DE DATOS DEL TECLADO
    /* -------------------------------------------------------------*/
    /**
     * Lee una cadena del teclado
     *
     * @param mensaje Literal que especifica lo que el usuario debe introducir
     * @return String cadena leida del teclado
     */
    private static String leeCadena(String mensaje) {
        return leeCadena(mensaje, false);
    }

    /**
     * Lee una cadena del teclado
     *
     * @param mensaje Literal que especifica lo que el usuario debe introducir
     * @param permiteVacia True: campo no obligatorio; False: campo obligatorio
     * @return String cadena leida del teclado
     */
    private static String leeCadena(String mensaje,
            boolean permiteVacia) {
        String leer;
        Scanner scanner = new Scanner(System.in);

        do {
            System.out.print(mensaje);
            leer = scanner.nextLine().trim();
            if (!permiteVacia && leer.length() == 0) {
                System.out.println("La cadena introducida no puede estar vacía. "
                        + "Por favor, introdúcela de nuevo.");
            }
        } while ((permiteVacia == false) && leer.length() == 0);

        return leer;
    }
    
    private static char leeCaracter(String mensaje) {
        char leer;
        Scanner scanner = new Scanner(System.in);

        System.out.print(mensaje);
        leer = scanner.nextLine().trim().charAt(0);

        return leer;
    }

    /**
     * Lee un entero del teclado
     *
     * @param mensaje Literal que especifica lo que el usuario debe introducir
     * @return int Entero leido del teclado
     */
    private static int leeEntero(String mensaje) {
        Scanner scanner = new Scanner(System.in);
        boolean esValido = false; // True: entero leido correctamente
        int leer = 0;

        do {
            try {
                System.out.print(mensaje);
                leer = Integer.parseInt(scanner.nextLine().trim());
                esValido = true;
            } catch (NumberFormatException e) {
                System.err.println("La cadena introducida no se puede "
                        + "convertir a número entero. Por favor, "
                        + "introdúcela de nuevo.");
            }
        } while (!esValido);

        return leer;
    }
    
    private static double leeReal(String mensaje) {
        Scanner scanner = new Scanner(System.in);
        boolean esValido = false; // True: entero leido correctamente
        double leer = 0;

        do {
            try {
                System.out.print(mensaje);
                leer = Double.parseDouble(scanner.nextLine().trim());
                esValido = true;
            } catch (NumberFormatException e) {
                System.err.println("La cadena introducida no se puede "
                        + "convertir a número real. Por favor, "
                        + "introdúcela de nuevo.");
            }
        } while (!esValido);

        return leer;
    }



}
