import Foundation

struct MealsInCategory : Codable {
	let strMeal : String?
	let strMealThumb : String?
	let idMeal : String?

	enum CodingKeys: String, CodingKey {

		case strMeal = "strMeal"
		case strMealThumb = "strMealThumb"
		case idMeal = "idMeal"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		strMeal = try values.decodeIfPresent(String.self, forKey: .strMeal)
		strMealThumb = try values.decodeIfPresent(String.self, forKey: .strMealThumb)
		idMeal = try values.decodeIfPresent(String.self, forKey: .idMeal)
	}

}
