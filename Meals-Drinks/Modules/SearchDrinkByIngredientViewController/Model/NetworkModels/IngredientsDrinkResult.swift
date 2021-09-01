

import Foundation
struct IngredientsDrinkResult : Codable {
	let drinks : [DrinksByIngredients]?

	enum CodingKeys: String, CodingKey {

		case drinks = "drinks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		drinks = try values.decodeIfPresent([DrinksByIngredients].self, forKey: .drinks)
	}

}
