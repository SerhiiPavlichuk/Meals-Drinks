//
//  DrinkDetailViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 25.08.2021.
//

import Foundation

class DrinkDetailViewModel {
    
    var detailDrink: DetailDrinkInformation? = nil
    var drinkInCategory: DrinksInCategory? = nil
    
    func loadDetailDrink(completion: @escaping(() -> ())) {
        DrinksNetworkManager.shared.detailDrinkRequest(drinkId: drinkInCategory, completion: { detailDrink in
           
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

