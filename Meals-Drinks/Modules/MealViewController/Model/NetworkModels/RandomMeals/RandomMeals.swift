

import Foundation

struct RandomMeals : Codable {
    
	let meals : [MealInformation]?

	enum CodingKeys: String, CodingKey {

		case meals = "meals"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		meals = try values.decodeIfPresent([MealInformation].self, forKey: .meals)
	}

}
