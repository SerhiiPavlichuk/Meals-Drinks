//
//  MealDetailViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 23.08.2021.
//

import Foundation

class MealDetailViewModel {
    
    var detailMeal: DetailMealInformation?
    var mealForCategory: MealsInCategory? = nil
    var detailMealArray: [DetailMealInformation] = []
    
    func loadDetailMeal(completion: @escaping(() -> ())) {
        MealsNetworkManager.shared.detailMealRequest(mealId: mealForCategory, completion: { detailMeal in
            self.detailMealArray = detailMeal ?? []
            let dataArray = detailMeal ?? []
            let detailMealResponce = dataArray.first
            
            self.detailMeal = detailMealResponce
            completion()
        })
    }
    
    func saveDetailMealRealm(_ meal: DetailMealInformation?, completion: @escaping(() -> ())) {
        
        guard let meal = meal else {
            
            return
        }
        
        MealsDataManager.shared.saveDetailMeal(meal, completion: completion)
    }
}
