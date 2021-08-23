

import Foundation

struct MealsCategory : Codable {
	let idCategory : String?
	let nameCategory : String?
	let imageCategory : String?
	let strCategoryDescription : String?

	enum CodingKeys: String, CodingKey {

		case idCategory = "idCategory"
		case nameCategory = "strCategory"
		case imageCategory = "strCategoryThumb"
		case strCategoryDescription = "strCategoryDescription"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		idCategory = try values.decodeIfPresent(String.self, forKey: .idCategory)
        nameCategory = try values.decodeIfPresent(String.self, forKey: .nameCategory)
        imageCategory = try values.decodeIfPresent(String.self, forKey: .imageCategory)
		strCategoryDescription = try values.decodeIfPresent(String.self, forKey: .strCategoryDescription)
	}

}
