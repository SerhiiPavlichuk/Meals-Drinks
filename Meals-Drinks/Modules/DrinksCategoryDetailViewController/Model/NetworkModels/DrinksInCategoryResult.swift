
import Foundation

struct DrinksInCategoryResult : Codable {
	let drinksInCategory : [DrinksInCategory]?

	enum CodingKeys: String, CodingKey {

		case drinksInCategory = "drinks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        drinksInCategory = try values.decodeIfPresent([DrinksInCategory].self, forKey: .drinksInCategory)
	}

}
