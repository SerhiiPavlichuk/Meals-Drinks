

import Foundation

struct MealCategory : Codable {
    
	let categories : [MealsCategory]?

	enum CodingKeys: String, CodingKey {

		case categories = "categories"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		categories = try values.decodeIfPresent([MealsCategory].self, forKey: .categories)
	}

}
