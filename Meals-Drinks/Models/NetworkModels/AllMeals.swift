
import Foundation

struct AllMeals : Codable {
    
	let meals : [Meals]?

	enum CodingKeys: String, CodingKey {

		case meals = "meals"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		meals = try values.decodeIfPresent([Meals].self, forKey: .meals)
	}

}
