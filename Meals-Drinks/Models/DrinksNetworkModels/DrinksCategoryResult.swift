
import Foundation

struct DrinksCategoryResult : Codable {
	let categories : [DrinksCategory]?

	enum CodingKeys: String, CodingKey {

		case categories = "drinks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        categories = try values.decodeIfPresent([DrinksCategory].self, forKey: .categories)
	}

}
