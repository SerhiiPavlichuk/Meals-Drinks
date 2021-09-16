

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
    var strIngredient16 : String?
    var strIngredient17 : String?
    var strIngredient18 : String?
    var strIngredient19 : String?
    var strIngredient20 : String?
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
        self.strIngredient1 = mealRealm.strIngredient1
        self.strIngredient2 = mealRealm.strIngredient2
        self.strIngredient3 = mealRealm.strIngredient3
        self.strIngredient4 = mealRealm.strIngredient4
        self.strIngredient5 = mealRealm.strIngredient5
        self.strIngredient6 = mealRealm.strIngredient6
        self.strIngredient7 = mealRealm.strIngredient7
        self.strIngredient8 = mealRealm.strIngredient8
        self.strIngredient9 = mealRealm.strIngredient9
        self.strIngredient10 = mealRealm.strIngredient10
        self.strIngredient11 = mealRealm.strIngredient11
        self.strIngredient12 = mealRealm.strIngredient12
        self.strIngredient13 = mealRealm.strIngredient13
        self.strIngredient14 = mealRealm.strIngredient14
        self.strIngredient15 = mealRealm.strIngredient15
        self.strMeasure1 = mealRealm.strMeasure1
        self.strMeasure2 = mealRealm.strMeasure2
        self.strMeasure3 = mealRealm.strMeasure3
        self.strMeasure4 = mealRealm.strMeasure4
        self.strMeasure5 = mealRealm.strMeasure5
        self.strMeasure6 = mealRealm.strMeasure6
        self.strMeasure7 = mealRealm.strMeasure7
        self.strMeasure8 = mealRealm.strMeasure8
        self.strMeasure9 = mealRealm.strMeasure9
        self.strMeasure10 = mealRealm.strMeasure10
        self.strMeasure11 = mealRealm.strMeasure11
        self.strMeasure12 = mealRealm.strMeasure12
        self.strMeasure13 = mealRealm.strMeasure13
        self.strMeasure14 = mealRealm.strMeasure14
        self.strMeasure15 = mealRealm.strMeasure15
    }
}
