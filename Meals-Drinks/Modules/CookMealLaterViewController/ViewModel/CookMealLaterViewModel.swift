//
//  CookMealLaterViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 26.08.2021.
//

import Foundation
import RealmSwift

class CookMealLaterViewModel {
    
    let realm = try? Realm()
    var meal: [MealsRealm] = []
    
    func getMeals() -> [MealsRealm] {
        
        var meals = [MealsRealm]()
        guard let mealsResult = realm?.objects(MealsRealm.self) else { return [] }
        for meal in mealsResult {
            meals.append(meal)
        }
        return meals
    }
}
