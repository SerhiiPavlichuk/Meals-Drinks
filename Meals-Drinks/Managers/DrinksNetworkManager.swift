//
//  DrinksNetworkManager.swift
//  Meals-Drinks
//
//  Created by admin on 17.08.2021.
//

import Foundation
import Alamofire


struct DrinksNetworkManager {
    
    static let shared = DrinksNetworkManager()
    
    func requestRandomDrinks(completion: @escaping(([RandomDrinks]) -> ())){
        
        let url = "https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php"
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(RandomDrinksResult.self, from: responce.data!) {
                let randomDrinks = data.drinks ?? []
                completion(randomDrinks)
            }
        }
    }
    
    func requestDrinkCategory(completion: @escaping(([DrinksCategory]) -> ())) {
        
        let url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(DrinksCategoryResult.self, from: responce.data!) {
                let drinkCategories = data.categories ?? []
                completion(drinkCategories)
            }
        }
    }
    func requestDrinksInCategory(drinkCategory: DrinksCategory?, completion: @escaping(([DrinksInCategory]?) -> ())) {
        
        if let categoryNameForURL = drinkCategory?.strCategory{
            let stringID = String(describing : categoryNameForURL)
            let urlString = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=\(stringID)"
            let url = urlString.replacingOccurrences(of: " ", with: "%20")
            
            AF.request(url).responseJSON { responce in
                let decoder = JSONDecoder()
                if let data = try? decoder.decode(DrinksInCategoryResult.self, from: responce.data!) {
                    let drinksInCategory = data.drinksInCategory ?? []
                    completion(drinksInCategory)
                }
            }
        }
    }
    func detailDrinkRequest(drinkId: DrinksInCategory?, completion: @escaping(([DetailDrinkInformation]?) -> ())) {
        
        if let drinkIdforUrl = drinkId?.idDrink{
            let stringID = String(describing : drinkIdforUrl)
            let url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(stringID)"
            
            AF.request(url).responseJSON { responce in
                let decoder = JSONDecoder()
                if let data = try? decoder.decode(Drink.self, from: responce.data!) {
                    let detailDrink = data.drink ?? []
                    completion(detailDrink)
                }
            }
        }
    }
}
