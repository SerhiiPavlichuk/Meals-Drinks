
import Foundation
struct IngredientsResult : Codable {
	let meals : [MealsByIngridients]?

	enum CodingKeys: String, CodingKey {

		case meals = "meals"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		meals = try values.decodeIfPresent([MealsByIngridients].self, forKey: .meals)
	}

}

