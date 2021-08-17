//
//  NetworkManager.swift
//  Meals-Drinks
//
//  Created by admin on 17.08.2021.
//

import Foundation
import Alamofire


struct NetworkManager {
    
    static let shared = NetworkManager()
    
    
    func requestRandomMeals(completion: @escaping(([MealInformation]) -> ())){
        
        let url = "https://www.themealdb.com/api/json/v2/9973533/randomselection.php"
        
        AF.request(url).responseJSON { responce in
            
            
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode(RandomMeals.self, from: responce.data!) {
                let randomMeals = data.meals ?? []
                completion(randomMeals)
                
            }
        }
    }
    
    func requestMealCategory(completion: @escaping(([MealsCategory]) -> ())) {
        
        let url = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        AF.request(url).responseJSON { responce in
            
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode(MealCategory.self, from: responce.data!) {
                let mealCategory = data.categories ?? []
                completion(mealCategory)
                
            }
        }
    }
//    func requestMealsInCategory(completion: @escaping(([MealsInCategory]?) -> ())) {
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
//                    self.mealsInCategory = data.mealsInCategory ?? []
//                    self.tableView.reloadData()
//
//                }
//            }
//        }
//    }
//    func detailMealRequest(){
//
//        if let mealID = mealForCategory?.idMeal{
//            let stringID = String(describing : mealID)
//            let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(stringID)"
//
//            AF.request(url).responseJSON { responce in
//
//                let decoder = JSONDecoder()
//
//                if let data = try? decoder.decode(Meal.self, from: responce.data!) {
//                    self.detailMealArray = data.meal ?? []
//                    self.displayMealInformation()
//                }
//            }
//        }
//    }
//}
}

class NetworkManagerForUrlWithTwoPath: MealsCategoryDetailViewController {
    
    static let shared = NetworkManagerForUrlWithTwoPath()
    
    func requestMealsInCategory(completion: @escaping(([MealsInCategory]?) -> ())) {
        
        if let categoryNameForURL = mealCategory?.nameCategory{
            let stringID = String(describing : categoryNameForURL)
            let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(stringID)"
            
            AF.request(url).responseJSON { responce in
                
                let decoder = JSONDecoder()
                
                if let data = try? decoder.decode(OpenMealCategory.self, from: responce.data!) {
                    let mealsInCategory = data.mealsInCategory ?? []
                    completion(mealsInCategory)
                    
                }
            }
        }
    }
 }


