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
        const index: number = pageURL.search('/cab') - 1
        const userId: string = pageURL[index]
        
        return(`/user/${userId}/cabinet`);
    }

    async addBottle(ingredientID) {
    // Handle adding a bottle to a user's cabinet
        const data: cabinetJSON = {
            ingredientID: ingredientID
        }

        await axios.post(this.URL, data)
    }
    
    async removeBottle(ingredientID: string) {
        const data: cabinetJSON = {
            ingredientID: ingredientID
        }

        const deleteURL = `${this.URL}/delete`
        await axios.post(deleteURL, data)
    }
}

// Class to handle adding or removing favorite drinks
class blah {
    url: string;

    addFavorite() {

    }

    removeFavorite() {

    }
}