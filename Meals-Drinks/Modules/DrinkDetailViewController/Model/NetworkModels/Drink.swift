
import Foundation

struct Drink : Codable {
	let drink : [DetailDrinkInformation]?

	enum CodingKeys: String, CodingKey {

		case drink = "drinks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = try values.decodeIfPresent([DetailDrinkInformation].self, forKey: .drink)
	}

}
