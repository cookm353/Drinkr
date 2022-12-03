// const $addIngredientBttn = $("#addIngredient")
// const $ingredientToAdd = $('#ingredientList')

// async function addBottle() {
//     // Handle adding a bottle to a user's cabinet
//     const pageURL: string = window.location.href
//     const index: number = pageURL.search('/cab') - 1
//     const userId: string = pageURL[index]
//     const URL: string = `/user/${userId}/cabinet`
//     const data: object = {
//         ingredientID: $ingredientToAdd.val()
//     }

//     const resp = await axios.post(URL, {ingredientList: $ingredientToAdd.val()})
// }

const cabinet = new Cabinet();

// Handle adding a bottle to the cabinet
$("#addIngredient").click(evt => {
    evt.preventDefault()
    const ingredientID: number | string = $('#ingredientList').val()
    cabinet.addBottle(ingredientID)
})

// Handle removing a bottle from the cabinet
$('.ingredient-card').on('click', '.remove-bottle', evt => {
    evt.preventDefault()
    const id: string = evt.target.getAttribute('id').slice(6)
    cabinet.removeBottle(id)
})