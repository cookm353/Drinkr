var cabinet = new Cabinet();
var favorite = new Favorite();
/** Cabinet-related event handlers */
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
$('.add-to-cabinet').click(function (evt) {
    // evt.preventDefault()
    var bttnID = $('.add-to-cabinet').attr('id');
    var index = bttnID.search('-') + 1;
    var ingredientID = bttnID.slice(index);
    cabinet.addBottle(ingredientID);
});
/** Favorite-related event handlers */
// Handle adding and removing drink from favorites
$('.fa-star').click(function (evt) {
    var isFavorite = $('.fa-star').hasClass('fa-solid');
    $('.fa-star').toggleClass('fa-regular');
    $('.fa-star').toggleClass('fa-solid');
    if (isFavorite) {
        favorite.add();
    }
    else {
        favorite.remove();
    }
});
