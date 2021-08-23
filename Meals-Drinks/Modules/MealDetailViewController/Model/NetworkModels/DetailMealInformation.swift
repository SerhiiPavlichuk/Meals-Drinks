

import Foundation

struct DetailMealInformation : Codable {
    let idMeal : String?
    let mealName : String?
    var strDrinkAlternate : String?
    let mealCategory : String?
    var strArea : String?
    let strInstructions : String?
    let strMealThumb : String?
    var strTags : String?
    let strYoutube : String?
    var strIngredient1 : String?
    var strIngredient2 : String?
    var strIngredient3 : String?
    var strIngredient4 : String?
    var strIngredient5 : String?
    var strIngredient6 : String?
    var strIngredient7 : String?
    var strIngredient8 : String?
    var strIngredient9 : String?
    var strIngredient10 : String?
    var strIngredient11 : String?
    var strIngredient12 : String?
    var strIngredient13 : String?
    var strIngredient14 : String?
    var strIngredient15 : String?
    var strIngredient16 : String?
    var strIngredient17 : String?
    var strIngredient18 : String?
    var strIngredient19 : String?
    var strIngredient20 : String?
    var strMeasure1 : String?
    var strMeasure2 : String?
    var strMeasure3 : String?
    var strMeasure4 : String?
    var strMeasure5 : String?
    var strMeasure6 : String?
    var strMeasure7 : String?
    var strMeasure8 : String?
    var strMeasure9 : String?
    var strMeasure10 : String?
    var strMeasure11 : String?
    var strMeasure12 : String?
    var strMeasure13 : String?
    var strMeasure14 : String?
    var strMeasure15 : String?
    var strMeasure16 : String?
    var strMeasure17 : String?
    var strMeasure18 : String?
    var strMeasure19 : String?
    var strMeasure20 : String?
    let strSource : String?
    var strImageSource : String?
    var strCreativeCommonsConfirmed : String?
    var dateModified : String?
    
    enum CodingKeys: String, CodingKey {
        
        case idMeal = "idMeal"
        case mealName = "strMeal"
        case strDrinkAlternate = "strDrinkAlternate"
        case mealCategory = "strCategory"
        case strArea = "strArea"
        case strInstructions = "strInstructions"
        case strMealThumb = "strMealThumb"
        case strTags = "strTags"
        case strYoutube = "strYoutube"
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
        case strIngredient16 = "strIngredient16"
        case strIngredient17 = "strIngredient17"
        case strIngredient18 = "strIngredient18"
        case strIngredient19 = "strIngredient19"
        case strIngredient20 = "strIngredient20"
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
        case strMeasure16 = "strMeasure16"
        case strMeasure17 = "strMeasure17"
        case strMeasure18 = "strMeasure18"
        case strMeasure19 = "strMeasure19"
        case strMeasure20 = "strMeasure20"
        case strSource = "strSource"
        case strImageSource = "strImageSource"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try values.decodeIfPresent(String.self, forKey: .idMeal)
        mealName = try values.decodeIfPresent(String.self, forKey: .mealName)
        strDrinkAlternate = try values.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        mealCategory = try values.decodeIfPresent(String.self, forKey: .mealCategory)
        strArea = try values.decodeIfPresent(String.self, forKey: .strArea)
        strInstructions = try values.decodeIfPresent(String.self, forKey: .strInstructions)
        strMealThumb = try values.decodeIfPresent(String.self, forKey: .strMealThumb)
        strTags = try values.decodeIfPresent(String.self, forKey: .strTags)
        strYoutube = try values.decodeIfPresent(String.self, forKey: .strYoutube)
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
        strIngredient16 = try values.decodeIfPresent(String.self, forKey: .strIngredient16)
        strIngredient17 = try values.decodeIfPresent(String.self, forKey: .strIngredient17)
        strIngredient18 = try values.decodeIfPresent(String.self, forKey: .strIngredient18)
        strIngredient19 = try values.decodeIfPresent(String.self, forKey: .strIngredient19)
        strIngredient20 = try values.decodeIfPresent(String.self, forKey: .strIngredient20)
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
        strMeasure16 = try values.decodeIfPresent(String.self, forKey: .strMeasure16)
        strMeasure17 = try values.decodeIfPresent(String.self, forKey: .strMeasure17)
        strMeasure18 = try values.decodeIfPresent(String.self, forKey: .strMeasure18)
        strMeasure19 = try values.decodeIfPresent(String.self, forKey: .strMeasure19)
        strMeasure20 = try values.decodeIfPresent(String.self, forKey: .strMeasure20)
        strSource = try values.decodeIfPresent(String.self, forKey: .strSource)
        strImageSource = try values.decodeIfPresent(String.self, forKey: .strImageSource)
        strCreativeCommonsConfirmed = try values.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try values.decodeIfPresent(String.self, forKey: .dateModified)
    }
    init(from mealRealm: MealsRealm) {
        self.idMeal = mealRealm.idMeal
        self.mealName = mealRealm.mealName
        self.mealCategory = mealRealm.mealCategory
        self.strInstructions = mealRealm.strInstructions
        self.strMealThumb = mealRealm.strMealThumb
        self.strYoutube = mealRealm.strYoutube
        self.strSource = mealRealm.strSource
    }
}

