/*
 *  Definición de la clase Banco
 *  En un banco tendremos una serie de clientes
 */
package es.uvigo.esei.pro2.core;
import Exceptions.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import nu.xom.Builder;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Elements;
import nu.xom.ParsingException;
import nu.xom.Serializer;
import nu.xom.ValidityException;

public class Banco {

    private String nombreBanco;
    private final ArrayList<Cliente> clientes; // Array de los clientes del banco
    
    public final static String etiNombreBanco = "nombreBanco";
    public final static String etiClientes = "clientes";
    public final static String etiBanco = "banco";
    
    
    // El atributo numClientes propociona información de:
    //  1.  numero de clientes existentes en el array clientes en cada momento
    //  2.  posición/indice del elemento del array donde se debería añadir un 
    //      nuevo cliente

    /**
     * Nuevo Banco con un num. max. de clientes.
     *
     * @param maxClientes el num. max. de clientes, como entero.
     */
    public Banco(String nombreBanco, int estimacionMaxClientes) {
        this.nombreBanco = nombreBanco;
        clientes = new ArrayList<Cliente>(estimacionMaxClientes);
    }
    
    public Banco(String nombreArchivo) throws ParsingException, ValidityException, IOException{
        
        Builder builder = new Builder();
        Document toXML = builder.build(new File(nombreArchivo));
        
        Element eBanco = toXML.getRootElement();
        Element eNombre = eBanco.getFirstChildElement(etiNombreBanco);
        Element eClientes = eBanco.getFirstChildElement(etiClientes);
        if(eNombre == null){
            throw new ParsingException("No se encontró el nombre del banco");
        }
        if(eClientes == null){
            throw new ParsingException("No se encontró la lista de clientes");
        }
        
        this.nombreBanco = eNombre.getValue();
        Elements eListaClientes = eClientes.getChildElements();
        
        this.clientes = new ArrayList<Cliente>(eListaClientes.size());
        
        for(Element e: eListaClientes){
            Cliente c = new Cliente(e);
            this.clientes.add(c);
        }
        
    }
    
    
    
    
    
    
    
    

    /**
     * Devuelve el cliente situado en pos
     *
     * @param pos el lugar del cliente en el vector de clientes
     * @return el objeto Cliente correspondiente.
     */
    public Cliente get(int pos) throws SobrepasaLimiteException {
        if (pos >= getNumClientes()) {
            throw new SobrepasaLimiteException("get(): sobrepasa la pos: " + (pos + 1)
                    + " / " + getNumClientes());
        }

        return clientes.get(pos);
    }

    public String getNombreBanco() {
        return nombreBanco;
    }

    public void setNombreBanco(String nombreBanco) {
        this.nombreBanco = nombreBanco;
    }

    
    /**
     * Devuelve el num. de clientes creados.
     *
     * @return el num. de clientes existentes, como entero.
     */
    public int getNumClientes() {
        return clientes.size();
    }

    /**
     * Inserta un nuevo cliente
     *
     * @param c el nuevo objeto Cliente
     */
    public void inserta(Cliente c){
        clientes.add(c);
    }

    /**
     * Elimina un cliente
     *
     * @param pos el lugar del cliente en el vector de clientes
     */
    public void elimina(int pos)throws PosicionInvalidaException {
//        clientes[pos] = clientes[--numClientes];
    if(pos>0 && pos<getNumClientes()){
       clientes.remove(pos);
    }else{
        throw new PosicionInvalidaException("Posición inválida");
    }
    }

    public Element toDOM(){
        Element eBanco = new Element(etiBanco);
        Element eNombreBanco = new Element(etiNombreBanco);
        Element eClientes = new Element(etiClientes);
        
        eNombreBanco.appendChild(getNombreBanco());
        for(Cliente c : clientes){
            eClientes.appendChild(c.toDOM());
        }
        
        eBanco.appendChild(eNombreBanco);
        eBanco.appendChild(eClientes);
        
        
        return eBanco;
    }
    
    

    public void toXML(String nombreArchivo) throws FileNotFoundException, IOException{
        
        Document toXML = new Document(toDOM());
        FileOutputStream flujo = new FileOutputStream(nombreArchivo);
        Serializer ser = new Serializer(flujo);
        ser.setIndent(4);
        ser.write(toXML);
        flujo.close();
        
    }
    
    
    
    
    
    
    /**
     * Devuelve los datos del Banco
     *
     * @return los datos del banco, como cadena
     */
    public String toString() {
        StringBuilder toret = new StringBuilder();
        final int numClientes = getNumClientes();
        
        if (numClientes > 0) {
            for (int i = 0; i < numClientes; i++) {
                toret.append((i + 1)).append(". ");
                toret.append(clientes.get(i).toString()).append("\n");
            }
        } else {
            toret.append("No hay clientes.");
        }

        return toret.toString();
    }

    
    
    
    
    public String listarPorTipoCuenta(char tipo) throws PosicionInvalidaException {
        
        StringBuilder toret = new StringBuilder();
        
        
        
        for (int i = 0; i < getNumClientes(); i++) {
            toret.append("Cliente ").append(clientes.get(i).getNombre());
            toret.append(" con DNI ").append(clientes.get(i).getDni());
            toret.append(" y domicilio en ").append(clientes.get(i).getDomicilio());
            toret.append(". \n\n \tDatos de sus cuentas:  ");
            for(int j = 0; j < clientes.get(i).getNumCuentas(); j++){
                if(tipo == 'A'){
                    if(clientes.get(i).getCuenta(j) instanceof Ahorro)toret.append(clientes.get(i).getCuenta(j).toString()).append("\n");
                }
                else if(tipo == 'C'){
                    if(clientes.get(i).getCuenta(j) instanceof Corriente)toret.append(clientes.get(i).getCuenta(j).toString()).append("\n");
                }
                toret.append("\n");
            }
        }
        
        return toret.toString();
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /**
     * Devuelve los datos de las cuentas del tipo especificado
     *
     * @return los datos del banco, como cadena
     */
//    public String listarCuentas(Cuenta.TipoCuenta tipo) throws Exception {
//        StringBuilder toret = new StringBuilder();
//        StringBuilder cliente;
//        final int numClientes = getNumClientes();
//
//        if (numClientes > 0) {
//            for (int i = 0; i < numClientes; i++) {
//                cliente = new StringBuilder();
//                for (int j = 0; j < clientes[i].getNumCuentas(); j++) {
//                    if (clientes[i].getCuenta(j).getTipo().equals(tipo)) {
//                        cliente.append("\t");
//                        cliente.append(clientes[i].getCuenta(j).toString());
//                        cliente.append("\n");
//                    }
//                }
//
//                if (cliente.length() != 0) {
//                    toret.append("El cliente ");
//                    toret.append(clientes[i].getNombre());
//                    toret.append(" tiene las siguientes cuentas del tipo ");
//                    toret.append(tipo.name().toLowerCase());
//                    toret.append("\n");
//                    toret.append(cliente);
//                }
//            }
//        }
//        return toret.toString();
//
//    }

}
