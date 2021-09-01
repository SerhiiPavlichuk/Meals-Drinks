//
//  DetailMealFromSearchByIngredientViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 01.09.2021.
//

import Foundation

class DetailMealFromSearchByIngredientViewModel {
    
    var detailMeal: DetailMealInformation? = nil
    var mealsByIngredients: MealsByIngridients? = nil
    var detailMealArray: [DetailMealInformation] = []
    
    func loadDetailMeal(completion: @escaping(() -> ())) {
        MealsNetworkManager.shared.detailMealByIngredientRequest(mealId: mealsByIngredients, completion: { detailMeal in
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
