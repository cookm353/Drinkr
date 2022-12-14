const $ingredientToAdd = $('#ingredientList')
const $ingredientToRemove = $('#remove-bottle')

interface cabinetJSON {
    ingredientID: string
}

// Class to handle adding and removing bottles from cabinet
class Cabinet {
    URL: string = this.getURL();

    // Create base URL for requests
    getURL(): string {
        const pageURL: string = window.location.href
        const userId: string

        if (pageURL.includes('cabinet')) {
            const index: number = pageURL.search('/cab') - 1
            userId = pageURL[index]
        } else if (pageURL.includes('ingredients')) {
            const bttnID: string = $('.add-to-cabinet').attr('id')
            const index = bttnID.search('-')
            userId = bttnID.slice(0, index)
        }
        // if on ingredient page
        
        return(`/user/${userId}/cabinet`);
    }

    async addBottle(ingredientID) {
    // Handle adding a bottle to a user's cabinet
        const data: cabinetJSON = {
            // Add ingredient to cabinet
            ingredientID: ingredientID
        }

        await axios.post(this.URL, data)
    }
    
    async removeBottle(ingredientID: string) {
        // Remove ingredient from cabinet
        const data: cabinetJSON = {
            ingredientID: ingredientID
        }

        const deleteURL = `${this.URL}/delete`
        await axios.post(deleteURL, data)
    }
}

// Class to handle adding or removing favorite drinks
class Favorite {
    userID: string = $('.userId').attr('id')
    URL: string = `/user/${this.userID}/favorites`
    data: object = {
        drinkId: $('.drinkId').attr('id')
    }

    async add() {
        // Add a drink to favorites
        await axios.post(this.URL, this.data)
    }

    async remove() {
        // Remove a drink from favorites
        await axios.post(this.URL, this.data)
    }
}