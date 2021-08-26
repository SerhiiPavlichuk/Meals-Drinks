//
//  CookDrinkLaterViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 26.08.2021.
//

import Foundation
import RealmSwift

class CookDrinkLaterViewModel {
    
    let realm = try? Realm()
    var drink: [DrinksRealm] = []

    func getDrinks() -> [DrinksRealm] {
        
        var drinks = [DrinksRealm]()
        guard let drinksResult = realm?.objects(DrinksRealm.self) else { return [] }
        for drink in drinksResult {
            drinks.append(drink)
        }
        return drinks
    }
    
}


