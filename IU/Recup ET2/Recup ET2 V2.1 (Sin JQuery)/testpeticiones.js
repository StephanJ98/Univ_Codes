/* Si queremos que las pruebas aparezcan en orden descomentar el async await */
/*async*/ function realizarTestPeticiones() {
	if (Object.keys(test).length) {
		let data = ''

		for (let index = 0; index < Object.keys(test).length; index++) {
			const { valores, condicion } = test[index]

			/*await*/ dataCallPromise(valores)
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

	return  `
	<tr>
		<th class="${clase}">${index}</th>
		<th class="${clase}">${valores.controlador}</th>
		<th class="${clase}">${valores.action}</th>
		<th class="${clase}">${param}</th>
		<th class="${clase}">${code}</th>
		<th class="${clase}">${valor}</th>
		<th class="${clase}">${(valor == code ? 'Si' : 'No')}</th>
	</tr>`
}

const dataCallPromise = async (valores) => {
	let dataCall = {}
	for (let i = 0; i < Object.keys(valores).length; i++) {
		dataCall[Object.keys(valores)[i]] = Object.values(valores)[i]
	}

	const res = await fetch('http://193.147.87.202/Back/index.php', {
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: new URLSearchParams(dataCall).toString()
	})
	return await res.json()
}