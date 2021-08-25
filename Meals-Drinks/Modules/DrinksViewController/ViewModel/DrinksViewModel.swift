//
//  DrinksViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 25.08.2021.
//

import Foundation
import RealmSwift

class DrinksViewModel {
    
    let realm = try? Realm()
    var randomDrinks: [RandomDrinks] = []
    var drinkCategories: [DrinksCategory] = []
    
    func loadRandomDrinks(completion: @escaping(() -> ())) {
        DrinksNetworkManager.shared.requestRandomDrinks(completion: { randomDrinks in
            self.randomDrinks = randomDrinks
            completion()
        })
    }
    
    func loadCategories(completion: @escaping(() -> ())) {
        DrinksNetworkManager.shared.requestDrinkCategory(completion: { categories in
            self.drinkCategories = categories
            completion()
        })
    }
}
