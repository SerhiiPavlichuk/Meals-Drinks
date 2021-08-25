//
//  MealViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 22.08.2021.
//

import Foundation

class MealViewModel {
    
    var randomMeals: [MealInformation] = []
    var mealCategories: [MealsCategory] = []
    
    func loadRandomMeals(completion: @escaping(() -> ())) {
        MealsNetworkManager.shared.requestRandomMeals(completion: { randomMeals in
            self.randomMeals = randomMeals
            completion()
        })
    }
    
    func loadCategories(completion: @escaping(() -> ())) {
        MealsNetworkManager.shared.requestMealCategory(completion: { categories in
            self.mealCategories = categories
            completion()
        })
    }
}
