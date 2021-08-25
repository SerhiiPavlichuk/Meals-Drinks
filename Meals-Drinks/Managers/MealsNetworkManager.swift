//
//  NetworkManager.swift
//  Meals-Drinks
//
//  Created by admin on 17.08.2021.
//

import Foundation
import Alamofire

struct MealsNetworkManager {
    
    static let shared = MealsNetworkManager()
    
    func requestRandomMeals(completion: @escaping(([MealInformation]) -> ())){
        
        let url = Constants.mealNetwork.randomMealPath + Constants.mealNetwork.apiKey + Constants.mealNetwork.randomMealSecondPath
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(RandomMeals.self, from: responce.data!) {
                let randomMeals = data.meals ?? []
                completion(randomMeals)
            }
        }
    }
    
    func requestMealCategory(completion: @escaping(([MealsCategory]) -> ())) {
        
        let url = Constants.mealNetwork.mealCategoryUrl
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(MealCategory.self, from: responce.data!) {
                let mealCategory = data.categories ?? []
                completion(mealCategory)
            }
        }
    }
    func requestMealsInCategory(mealCategory: MealsCategory?, completion: @escaping(([MealsInCategory]?) -> ())) {
        
        if let categoryNameForURL = mealCategory?.nameCategory{
            let stringID = String(describing : categoryNameForURL)
            let url = Constants.mealNetwork.mealsInCategoryPath + "c=\(stringID)"
            
            AF.request(url).responseJSON { responce in
                let decoder = JSONDecoder()
                if let data = try? decoder.decode(OpenMealCategory.self, from: responce.data!) {
                    let mealsInCategory = data.mealsInCategory ?? []
                    completion(mealsInCategory)
                }
            }
        }
    }
    func detailMealRequest(mealId: MealsInCategory?, completion: @escaping(([DetailMealInformation]?) -> ())) {
        
        if let mealIdForUrl = mealId?.idMeal{
            let stringID = String(describing : mealIdForUrl)
            let url = Constants.mealNetwork.detailMealPath + "i=\(stringID)"
            
            AF.request(url).responseJSON { responce in
                let decoder = JSONDecoder()
                if let data = try? decoder.decode(Meal.self, from: responce.data!) {
                    let detailMeal = data.meal ?? []
                    completion(detailMeal)
                }
            }
        }
    }
}



