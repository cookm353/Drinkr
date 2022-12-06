const cabinet = new Cabinet();
const favorite = new Favorite();

/** Cabinet-related event handlers */

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
$('.add-to-cabinet').click(evt => {
    // evt.preventDefault()
    const bttnID: string = $('.add-to-cabinet').attr('id')
    const index = bttnID.search('-') + 1
    const ingredientID: string = bttnID.slice(index)
    cabinet.addBottle(ingredientID)
})

/** Favorite-related event handlers */

// Handle adding and removing drink from favorites
$('.fa-star').click(evt => {
    const isFavorite: boolean = $('.fa-star').hasClass('fa-solid')
    $('.fa-star').toggleClass('fa-regular')
    $('.fa-star').toggleClass('fa-solid')

    if (isFavorite) {
        favorite.add()
    } else {
        favorite.remove()
    }
})
