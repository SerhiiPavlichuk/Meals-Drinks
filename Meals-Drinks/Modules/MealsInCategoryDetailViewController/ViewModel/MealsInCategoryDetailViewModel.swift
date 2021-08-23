//
//  MealsInCategoryDetailViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 23.08.2021.
//

import Foundation

class MealsInCategoryDetailViewModel {
    
    
    var mealsInCategory: [MealsInCategory] = []
    var mealCategory: MealsCategory? = nil
    
    func loadMealsInCategory(completion: @escaping(() -> ())) {
        MealsNetworkManager.shared.requestMealsInCategory(mealCategory: mealCategory, completion: { mealsInCategory in
            self.mealsInCategory = mealsInCategory ?? []
            completion()
        })
    }
}

