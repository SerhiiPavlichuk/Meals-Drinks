
import Foundation

struct RandomDrinksResult : Codable {
	let drinks : [RandomDrinks]?

	enum CodingKeys: String, CodingKey {

		case drinks = "drinks"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		drinks = try values.decodeIfPresent([RandomDrinks].self, forKey: .drinks)
	}

}
