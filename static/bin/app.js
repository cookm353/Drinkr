// const $addIngredientBttn = $("#addIngredient")
// const $ingredientToAdd = $('#ingredientList')
var cabinet = new Cabinet();
/** Ingredient-related event handlers */
// Handle adding a bottle to the cabinet on cabinet page
$("#addIngredient").click(function (evt) {
    evt.preventDefault();
    var ingredientID = $('#ingredientList').val();
    cabinet.addBottle(ingredientID);
});
// Handle removing a bottle from the cabinet on cabinet page
$('.ingredient-card').on('click', '.remove-bottle', function (evt) {
    evt.preventDefault();
    var id = evt.target.getAttribute('id').slice(6);
    cabinet.removeBottle(id);
});
// Handle adding bottle to cabinet on ingredient page
// Handle removing bottle from cabinet on ingredient page
