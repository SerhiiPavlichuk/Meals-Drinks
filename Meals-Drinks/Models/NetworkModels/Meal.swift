
import Foundation

struct Meal : Codable {
	let meal : [DetailMealInformation]?

	enum CodingKeys: String, CodingKey {

		case meal = "meals"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		meal = try values.decodeIfPresent([DetailMealInformation].self, forKey: .meal)
	}

}
