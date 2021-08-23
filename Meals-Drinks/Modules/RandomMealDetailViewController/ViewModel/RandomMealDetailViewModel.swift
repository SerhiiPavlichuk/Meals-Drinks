//
//  ViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 23.08.2021.
//
import Foundation

class RandomMealDetailViewModel {

    var randomMeal: MealInformation?
    
    func saveMealRealm(_ meal: MealInformation?, completion: @escaping(() -> ())) {
        
        guard let meal = meal else {
           
            return
        }
        
        MealsDataManager.shared.saveMeal(meal, completion: completion)
    }
}

