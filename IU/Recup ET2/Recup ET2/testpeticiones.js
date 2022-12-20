/* Si queremos que las pruebas aparezcan en orden descomentar el async await */
/*async*/ function realizarTestPeticiones() {
	const titulotabla = `
	<tr>
		<th>Num. Prueba</th>
		<th>Controlador</th>
		<th>Accion</th>
		<th>Atributos</th>
		<th>Obtenido</th>
		<th>Esperado</th>
		<th>Correcta</th>
	</tr>`
	document.querySelector('#tituloresultados').innerHTML = titulotabla

	if (Object.keys(test).length) {
		let data = ''

		for (let index = 0; index < Object.keys(test).length; index++) {
			const { valores, condicion } = test[index]

			/*await*/ callAjaxPromise(valores)
				.then((res) => {
					data = stringConstructor(valores, condicion, res.code, index)
					document.querySelector('#datosresultados').innerHTML = document.querySelector('#datosresultados').innerHTML.concat(data)
				})
		}
	}
}

const stringConstructor = (valores, { valor }, code, index) => {
	let clase = '', param = ''
	valor == code ? clase = 'equal' : clase = 'notEqual'

	for (let i = 0; i < Object.keys(valores).length; i++) {
		if ((Object.keys(valores)[i] !== 'controlador') && (Object.keys(valores)[i] !== 'action')) param = param + `${Object.keys(valores)[i]}=${Object.values(valores)[i]} <br>`
	}

	data = `
	<tr>
		<th class="${clase}">${index}</th>
		<th class="${clase}">${valores.controlador}</th>
		<th class="${clase}">${valores.action}</th>
		<th class="${clase}">${param}</th>
		<th class="${clase}">${code}</th>
		<th class="${clase}">${valor}</th>
		<th class="${clase}">${(valor == code ? 'Si' : 'No')}</th>
	</tr>`
	return data
}

const callAjaxPromise = (valores) => {
	let dataCall = {}
	for (let i = 0; i < Object.keys(valores).length; i++) {
		dataCall[Object.keys(valores)[i]] = Object.values(valores)[i]
	}

	return new Promise(function (resolve) {
		$.ajax('http://193.147.87.202/Back/index.php', {
			type: 'POST',
			data: dataCall
		}).done(res => {
			resolve(res)
		})
	})
}