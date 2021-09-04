//
//  SearchDrinkByIngredientViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 04.09.2021.
//

import Foundation

class SearchDrinkByIngredientViewModel {
    
    var drink: DrinksByIngredients? = nil
    var items: [DrinksByIngredients] = []
    
    func loadSearchResult(ingredient: String, completion: @escaping(() -> ())) {
        DrinksNetworkManager.shared.searchIngredients(for: ingredient, completion: { drink in
            self.items = drink ?? []
            completion()
        })
    }
}
