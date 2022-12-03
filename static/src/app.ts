// const $addIngredientBttn = $("#addIngredient")
// const $ingredientToAdd = $('#ingredientList')

const cabinet = new Cabinet();

/** Ingredient-related event handlers */

// Handle adding a bottle to the cabinet on cabinet page
$("#addIngredient").click(evt => {
    evt.preventDefault()
    const ingredientID: number | string = $('#ingredientList').val()
    cabinet.addBottle(ingredientID)
})

// Handle removing a bottle from the cabinet on cabinet page
$('.ingredient-card').on('click', '.remove-bottle', evt => {
    evt.preventDefault()
    const id: string = evt.target.getAttribute('id').slice(6)
    cabinet.removeBottle(id)
})

// Handle adding bottle to cabinet on ingredient page


// Handle removing bottle from cabinet on ingredient page
