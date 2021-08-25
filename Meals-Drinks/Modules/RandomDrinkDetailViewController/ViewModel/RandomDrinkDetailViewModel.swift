//
//  RandomDrinkDetailViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 25.08.2021.
//

import Foundation

class RandomDrinkDetailViewModel {

    var randomDrink: RandomDrinks?
    
    func saveDrinkRealm(_ drink: RandomDrinks?, completion: @escaping(() -> ())) {
        
        guard let drink = drink else {
           
            return
        }
        
        DrinksDataManager.shared.saveRandomDrink(drink, completion: completion)
    }
}
