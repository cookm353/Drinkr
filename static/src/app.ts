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

// Add description for ingredient on ingredient detail page
async function getDescription(): void {
    const pageURL: string = window.location.href
    const ingredientIndex: number = pageURL.search('ts/') + 3
    const ingredientName: string = pageURL.slice(ingredientIndex)
    const resp = await axios.get(`https://www.thecocktaildb.com/api/json/v1/1/search.php?i=${ingredientName}`)
    const description: string = resp['data']['ingredients'][0]['strDescription']

    $('#ingredient-description').text(description)
    // return description
}

$(window).ready(() => {
    getDescription()
    // console.log(description)
})

// Handle adding bottle to cabinet on ingredient page


// Handle removing bottle from cabinet on ingredient page
