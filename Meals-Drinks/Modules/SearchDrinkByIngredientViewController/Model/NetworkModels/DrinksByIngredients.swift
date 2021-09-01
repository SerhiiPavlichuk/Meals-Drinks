
import Foundation
struct DrinksByIngredients : Codable {
	let strDrink : String?
	let strDrinkThumb : String?
	let idDrink : String?

	enum CodingKeys: String, CodingKey {

		case strDrink = "strDrink"
		case strDrinkThumb = "strDrinkThumb"
		case idDrink = "idDrink"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		strDrink = try values.decodeIfPresent(String.self, forKey: .strDrink)
		strDrinkThumb = try values.decodeIfPresent(String.self, forKey: .strDrinkThumb)
		idDrink = try values.decodeIfPresent(String.self, forKey: .idDrink)
	}

}
