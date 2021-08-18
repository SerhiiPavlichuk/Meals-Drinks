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
//    func requestMealsInCategory(mealCategory: MealsCategory?, completion: @escaping(([MealsInCategory]?) -> ())) {
//
//        if let categoryNameForURL = mealCategory?.nameCategory{
//            let stringID = String(describing : categoryNameForURL)
//            let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(stringID)"
//
//            AF.request(url).responseJSON { responce in
//
//                let decoder = JSONDecoder()
//
//                if let data = try? decoder.decode(OpenMealCategory.self, from: responce.data!) {
//                    let mealsInCategory = data.mealsInCategory ?? []
//                    completion(mealsInCategory)
//
//                }
//            }
//        }
//    }
//    func detailMealRequest(mealId: MealsInCategory?, completion: @escaping(([DetailMealInformation]?) -> ())) {
//
//        if let mealIdForUrl = mealId?.idMeal{
//            let stringID = String(describing : mealIdForUrl)
//            let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(stringID)"
//
//            AF.request(url).responseJSON { responce in
//
//                let decoder = JSONDecoder()
//
//                if let data = try? decoder.decode(Meal.self, from: responce.data!) {
//                    let detailMeal = data.meal ?? []
//                    completion(detailMeal)
//
//                }
//            }
//        }
//    }
}
