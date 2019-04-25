
function toggleEdit(feild) {
  console.log(feild)
}

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
