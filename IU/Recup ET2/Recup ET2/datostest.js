// Por cada prueba
// valores : conjunto de campos de formulario y valores de campos
// condicion : valor de respuesta esperado en el campo ['code']
//
const test = {
	0: {
		valores: { 'controlador': 'AUTH', 'action': 'LOGIN', 'usuario': 'ejemplo', 'contrasena': 'ejemplo' },
		condicion: { 'valor': 'LOGIN_OK' }
	},
	1: {
		valores: { 'controlador': 'AUTH', 'action': 'LOGIN', 'usuario': 'ejemplo', 'contrasena': 'ejemplo1' },
		condicion: { 'valor': 'USUARIO_PASS_KO' }
	},
	2: {
		valores: { 'controlador': 'AUTH', 'action': 'LOGIN', 'usuario': 'ejemplo1', 'contrasena': 'ejemplo' },
		condicion: { 'valor': 'USUARIO_PASS_KO' }
	},
	3: {
		valores: { 'controlador': 'AUTH', 'action': 'REGISTRAR', 'usuario': 'ejemplo1', 'contrasena': 'ejemplo1', 'dni': '99999999R', 'nombre_persona': 'ejemplo1', 'apellidos_persona': 'ejemplo1', 'fechaNacimiento_persona': '2012-12-14', 'direccion_persona': 'Avenida de Lugo', 'telefono_persona': '127000001', 'email_persona': 'test@test.com', 'foto_persona': 'foto.png' },
		condicion: { 'valor': 'dni_EXISTE_en_persona_KO' }
	},
	4: {
		valores: { 'controlador': 'usuario', 'action': 'ADD', 'usuario': 'ejemplo1', 'contrasena': 'ejemplo' },
		condicion: { 'valor': 'dni_es_nulo_KO' }
	},
	5: {
		valores: { 'controlador': 'usuario', 'action': 'EDIT', 'usuario': 'ejemplo1', 'contrasena': 'ejemplo' },
		condicion: { 'valor': 'edit_usuario_OK' }
	},
	6: {
		valores: { 'controlador': 'usuario', 'action': 'DELETE', 'usuario': 'ejemplo1', 'contrasena': 'ejemplo' },
		condicion: { 'valor': 'delete_usuario_OK' }
	},
	7: {
		valores: { 'controlador': 'usuario', 'action': 'SEARCH', 'usuario': 'ejemplo1', 'contrasena': 'ejemplo' },
		condicion: { 'valor': 'RECORDSET_VACIO' }
	},
}