//
//  DrinksCategoryDetailViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 25.08.2021.
//

import Foundation

class DrinksCategoryDetailViewModel {
    
    
    var drinksInCategory: [DrinksInCategory] = []
    var drinksCategory: DrinksCategory? = nil
    
    func loadDrinksInCategory(completion: @escaping(() -> ())) {
        DrinksNetworkManager.shared.requestDrinksInCategory(drinkCategory: drinksCategory, completion: { drinksInCategory in
            self.drinksInCategory = drinksInCategory ?? []
            completion()
        })
    }
}
