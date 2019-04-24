
function toggleEdit(feild) {
  console.log(feild)
}

function editFruit(feild, fruit) {
  const originalValue = fruit[feild]
  let newValue = prompt(`Editing ${feild}`, `${originalValue}`)
  console.log(newValue)
  
  const data = {
    feild: feild,
    new_value: newValue
  }

  fetch( `/fruits/${fruit.id}`, {
    method: "PUT",
    body: data
  })
  .then( res => {
    console.log(res)
  })
  
}
