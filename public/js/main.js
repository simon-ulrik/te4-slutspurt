
function editFruit(feild, fruit) {
  const originalValue = fruit[feild]
  const newValue = prompt(`Editing ${feild}`, `${originalValue}`)
  
  if (newValue === null || newValue === originalValue) { return null }

  let formData = new FormData()
  formData.append("feild", feild)
  formData.append("new_value", newValue)

  fetch( `/fruits/${fruit.id}`, {
    method: "PUT",
    body: formData
  })
  .then(res => {
    location.reload(true)
    console.log(res)
  })
}

function createFruit() {
  let params = prompt("Enter params for new fruit", '{"name": "", "description": "", "rating": ""}')
  params = JSON.parse(params)

  console.log(params)

  if (params.name === undefined || params.description === undefined || params.rating === undefined) { return null }

  console.log(params)

  let formData = new FormData()
  formData.append("name", params.name)
  formData.append("description", params.description)
  formData.append("rating", params.rating)

  fetch( '/fruits', {
    method: "POST",
    body: formData
  })
  .then(res => {
    location.reload(true)
    console.log(res)
  })
}
