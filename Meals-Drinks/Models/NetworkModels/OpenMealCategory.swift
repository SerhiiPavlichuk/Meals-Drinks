import Foundation

struct OpenMealCategory : Codable {
	let mealsInCategory : [MealsInCategory]?

	enum CodingKeys: String, CodingKey {

		case mealsInCategory = "meals"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        mealsInCategory = try values.decodeIfPresent([MealsInCategory].self, forKey: .mealsInCategory)
	}

}
