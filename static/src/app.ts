const $addIngredientBttn = $("#addIngredient")
const $ingredientToAdd = $('#ingredientList')

async function addBottle() {
    // Handle adding a bottle to a user's cabinet
    const pageURL: string = window.location.href
    const index: number = pageURL.search('/cab') - 1
    const userId: string = pageURL[index]
    const URL: string = `/user/${userId}/cabinet`
    const data: object = {
        ingredientList: $ingredientToAdd.val()
    }

    console.log(data)
    // console.log(data)
    const resp = await axios.post(URL, {ingredientList: $ingredientToAdd.val()})
    console.log(resp)
}

$addIngredientBttn.click(evt => {
    evt.preventDefault();
    addBottle();
})

// ingredientList: 98