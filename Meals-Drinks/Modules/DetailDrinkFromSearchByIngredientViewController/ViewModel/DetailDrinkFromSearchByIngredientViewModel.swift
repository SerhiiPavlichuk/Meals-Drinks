//
//  DetailDrinkFromSearchByIngredientViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 01.09.2021.
//

import Foundation

class DetailDrinkFromSearchByIngredientViewModel {
    
    
    var drinks: DrinksByIngredients? = nil
    var detailDrink: DetailDrinkInformation? = nil
    
    func loadDetailDrink(completion: @escaping(() -> ())) {
        DrinksNetworkManager.shared.detailDrinkByIngredientRequest(drinkId: drinks, completion: { detailDrink in
           
            let dataArray = detailDrink ?? []
            let detailDrinkResponce = dataArray.first
            
            self.detailDrink = detailDrinkResponce
            completion()
        })
    }
    
    func saveDetailDrinkRealm(_ drink: DetailDrinkInformation?, completion: @escaping(() -> ())) {
        
        guard let drink = drink else {
            
            return
        }
        
        DrinksDataManager.shared.saveDetailDrink(drink, completion: completion)
    }
}
