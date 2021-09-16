
import Foundation

struct DetailDrinkInformation : Codable {
    let idDrink : String?
    let strDrink : String?
    var strDrinkAlternate : String?
    var strTags : String?
    var strVideo : String?
    let strCategory : String?
    var strIBA : String?
    var strAlcoholic : String?
    var strGlass : String?
    let strInstructions : String?
    var strInstructionsES : String?
    var strInstructionsDE : String?
    var strInstructionsFR : String?
    var strInstructionsIT : String?
    var strInstructionsZH : String?
    var strInstructionsZH2 : String?
    let strDrinkThumb : String?
    let strIngredient1 : String?
    let strIngredient2 : String?
    let strIngredient3 : String?
    let strIngredient4 : String?
    let strIngredient5 : String?
    let strIngredient6 : String?
    let strIngredient7 : String?
    let strIngredient8 : String?
    let strIngredient9 : String?
    let strIngredient10 : String?
    let strIngredient11 : String?
    let strIngredient12 : String?
    let strIngredient13 : String?
    let strIngredient14 : String?
    let strIngredient15 : String?
    let strMeasure1 : String?
    let strMeasure2 : String?
    let strMeasure3 : String?
    let strMeasure4 : String?
    let strMeasure5 : String?
    let strMeasure6 : String?
    let strMeasure7 : String?
    let strMeasure8 : String?
    let strMeasure9 : String?
    let strMeasure10 : String?
    let strMeasure11 : String?
    let strMeasure12 : String?
    let strMeasure13 : String?
    let strMeasure14 : String?
    let strMeasure15 : String?
    var strImageSource : String?
    var strImageAttribution : String?
    var strCreativeCommonsConfirmed : String?
    var dateModified : String?
    
    enum CodingKeys: String, CodingKey {
        
        case idDrink = "idDrink"
        case strDrink = "strDrink"
        case strDrinkAlternate = "strDrinkAlternate"
        case strTags = "strTags"
        case strVideo = "strVideo"
        case strCategory = "strCategory"
        case strIBA = "strIBA"
        case strAlcoholic = "strAlcoholic"
        case strGlass = "strGlass"
        case strInstructions = "strInstructions"
        case strInstructionsES = "strInstructionsES"
        case strInstructionsDE = "strInstructionsDE"
        case strInstructionsFR = "strInstructionsFR"
        case strInstructionsIT = "strInstructionsIT"
        case strInstructionsZH = "strInstructionsZH-HANS"
        case strInstructionsZH2 = "strInstructionsZH-HANT"
        case strDrinkThumb = "strDrinkThumb"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strImageSource = "strImageSource"
        case strImageAttribution = "strImageAttribution"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idDrink = try values.decodeIfPresent(String.self, forKey: .idDrink)
        strDrink = try values.decodeIfPresent(String.self, forKey: .strDrink)
        strDrinkAlternate = try values.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strTags = try values.decodeIfPresent(String.self, forKey: .strTags)
        strVideo = try values.decodeIfPresent(String.self, forKey: .strVideo)
        strCategory = try values.decodeIfPresent(String.self, forKey: .strCategory)
        strIBA = try values.decodeIfPresent(String.self, forKey: .strIBA)
        strAlcoholic = try values.decodeIfPresent(String.self, forKey: .strAlcoholic)
        strGlass = try values.decodeIfPresent(String.self, forKey: .strGlass)
        strInstructions = try values.decodeIfPresent(String.self, forKey: .strInstructions)
        strInstructionsES = try values.decodeIfPresent(String.self, forKey: .strInstructionsES)
        strInstructionsDE = try values.decodeIfPresent(String.self, forKey: .strInstructionsDE)
        strInstructionsFR = try values.decodeIfPresent(String.self, forKey: .strInstructionsFR)
        strInstructionsIT = try values.decodeIfPresent(String.self, forKey: .strInstructionsIT)
        strInstructionsZH = try values.decodeIfPresent(String.self, forKey: .strInstructionsZH)
        strInstructionsZH2 = try values.decodeIfPresent(String.self, forKey: .strInstructionsZH2)
        strDrinkThumb = try values.decodeIfPresent(String.self, forKey: .strDrinkThumb)
        strIngredient1 = try values.decodeIfPresent(String.self, forKey: .strIngredient1)
        strIngredient2 = try values.decodeIfPresent(String.self, forKey: .strIngredient2)
        strIngredient3 = try values.decodeIfPresent(String.self, forKey: .strIngredient3)
        strIngredient4 = try values.decodeIfPresent(String.self, forKey: .strIngredient4)
        strIngredient5 = try values.decodeIfPresent(String.self, forKey: .strIngredient5)
        strIngredient6 = try values.decodeIfPresent(String.self, forKey: .strIngredient6)
        strIngredient7 = try values.decodeIfPresent(String.self, forKey: .strIngredient7)
        strIngredient8 = try values.decodeIfPresent(String.self, forKey: .strIngredient8)
        strIngredient9 = try values.decodeIfPresent(String.self, forKey: .strIngredient9)
        strIngredient10 = try values.decodeIfPresent(String.self, forKey: .strIngredient10)
        strIngredient11 = try values.decodeIfPresent(String.self, forKey: .strIngredient11)
        strIngredient12 = try values.decodeIfPresent(String.self, forKey: .strIngredient12)
        strIngredient13 = try values.decodeIfPresent(String.self, forKey: .strIngredient13)
        strIngredient14 = try values.decodeIfPresent(String.self, forKey: .strIngredient14)
        strIngredient15 = try values.decodeIfPresent(String.self, forKey: .strIngredient15)
        strMeasure1 = try values.decodeIfPresent(String.self, forKey: .strMeasure1)
        strMeasure2 = try values.decodeIfPresent(String.self, forKey: .strMeasure2)
        strMeasure3 = try values.decodeIfPresent(String.self, forKey: .strMeasure3)
        strMeasure4 = try values.decodeIfPresent(String.self, forKey: .strMeasure4)
        strMeasure5 = try values.decodeIfPresent(String.self, forKey: .strMeasure5)
        strMeasure6 = try values.decodeIfPresent(String.self, forKey: .strMeasure6)
        strMeasure7 = try values.decodeIfPresent(String.self, forKey: .strMeasure7)
        strMeasure8 = try values.decodeIfPresent(String.self, forKey: .strMeasure8)
        strMeasure9 = try values.decodeIfPresent(String.self, forKey: .strMeasure9)
        strMeasure10 = try values.decodeIfPresent(String.self, forKey: .strMeasure10)
        strMeasure11 = try values.decodeIfPresent(String.self, forKey: .strMeasure11)
        strMeasure12 = try values.decodeIfPresent(String.self, forKey: .strMeasure12)
        strMeasure13 = try values.decodeIfPresent(String.self, forKey: .strMeasure13)
        strMeasure14 = try values.decodeIfPresent(String.self, forKey: .strMeasure14)
        strMeasure15 = try values.decodeIfPresent(String.self, forKey: .strMeasure15)
        strImageSource = try values.decodeIfPresent(String.self, forKey: .strImageSource)
        strImageAttribution = try values.decodeIfPresent(String.self, forKey: .strImageAttribution)
        strCreativeCommonsConfirmed = try values.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try values.decodeIfPresent(String.self, forKey: .dateModified)
    }
    init(from drinkRealm: DrinksRealm) {
        self.idDrink = drinkRealm.idDrink
        self.strDrink = drinkRealm.strDrink
        self.strCategory = drinkRealm.strCategory
        self.strInstructions = drinkRealm.strInstructions
        self.strDrinkThumb = drinkRealm.strDrinkThumb
        self.strIngredient1 = drinkRealm.strIngredient1
        self.strIngredient2 = drinkRealm.strIngredient2
        self.strIngredient3 = drinkRealm.strIngredient3
        self.strIngredient4 = drinkRealm.strIngredient4
        self.strIngredient5 = drinkRealm.strIngredient5
        self.strIngredient6 = drinkRealm.strIngredient6
        self.strIngredient7 = drinkRealm.strIngredient7
        self.strIngredient8 = drinkRealm.strIngredient8
        self.strIngredient9 = drinkRealm.strIngredient9
        self.strIngredient10 = drinkRealm.strIngredient10
        self.strIngredient11 = drinkRealm.strIngredient11
        self.strIngredient12 = drinkRealm.strIngredient12
        self.strIngredient13 = drinkRealm.strIngredient13
        self.strIngredient14 = drinkRealm.strIngredient14
        self.strIngredient15 = drinkRealm.strIngredient15
        self.strMeasure1 = drinkRealm.strMeasure1
        self.strMeasure2 = drinkRealm.strMeasure2
        self.strMeasure3 = drinkRealm.strMeasure3
        self.strMeasure4 = drinkRealm.strMeasure4
        self.strMeasure5 = drinkRealm.strMeasure5
        self.strMeasure6 = drinkRealm.strMeasure6
        self.strMeasure7 = drinkRealm.strMeasure7
        self.strMeasure8 = drinkRealm.strMeasure8
        self.strMeasure9 = drinkRealm.strMeasure9
        self.strMeasure10 = drinkRealm.strMeasure10
        self.strMeasure11 = drinkRealm.strMeasure11
        self.strMeasure12 = drinkRealm.strMeasure12
        self.strMeasure13 = drinkRealm.strMeasure13
        self.strMeasure14 = drinkRealm.strMeasure14
        self.strMeasure15 = drinkRealm.strMeasure15
    }
    
}

