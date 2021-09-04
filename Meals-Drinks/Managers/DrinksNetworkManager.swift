//
//  DrinksNetworkManager.swift
//  Meals-Drinks
//
//  Created by admin on 17.08.2021.
//

import Foundation
import Alamofire


struct DrinksNetworkManager {
    
    static let shared = DrinksNetworkManager()
    
    func requestRandomDrinks(completion: @escaping(([RandomDrinks]) -> ())){
        
        let url = Constants.drinkNetwork.randomDrinkPath + Constants.drinkNetwork.apiKey + Constants.drinkNetwork.randomDrinkSecondPath
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(RandomDrinksResult.self, from: responce.data!) {
                let randomDrinks = data.drinks ?? []
                completion(randomDrinks)
            }
        }
    }
    
    func requestDrinkCategory(completion: @escaping(([DrinksCategory]) -> ())) {
        
        let url = Constants.drinkNetwork.drinkCategoryUrl
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(DrinksCategoryResult.self, from: responce.data!) {
                let drinkCategories = data.categories ?? []
                completion(drinkCategories)
            }
        }
    }
    func requestDrinksInCategory(drinkCategory: DrinksCategory?, completion: @escaping(([DrinksInCategory]?) -> ())) {
        
        if let categoryNameForURL = drinkCategory?.strCategory{
            let stringID = String(describing : categoryNameForURL)
            let urlString = Constants.drinkNetwork.drinksInCategoryPath + "c=\(stringID)"
            
            let url = urlString.replacingOccurrences(of: " ", with: "%20")
            
            AF.request(url).responseJSON { responce in
                let decoder = JSONDecoder()
                if let data = try? decoder.decode(DrinksInCategoryResult.self, from: responce.data!) {
                    let drinksInCategory = data.drinksInCategory ?? []
                    completion(drinksInCategory)
                }
            }
        }
    }
    func detailDrinkRequest(drinkId: DrinksInCategory?, completion: @escaping(([DetailDrinkInformation]?) -> ())) {
        
        if let drinkIdforUrl = drinkId?.idDrink{
            let stringID = String(describing : drinkIdforUrl)
            let url = Constants.drinkNetwork.detailDrinkPath + "i=\(stringID)"
            
            AF.request(url).responseJSON { responce in
                let decoder = JSONDecoder()
                if let data = try? decoder.decode(Drink.self, from: responce.data!) {
                    let detailDrink = data.drink ?? []
                    completion(detailDrink)
                }
            }
        }
    }
    
    func detailDrinkByIngredientRequest(drinkId: DrinksByIngredients?, completion: @escaping(([DetailDrinkInformation]?) -> ())) {
        
        if let drinkIdforUrl = drinkId?.idDrink{
            let stringID = String(describing : drinkIdforUrl)
            let url = Constants.drinkNetwork.detailDrinkPath + "i=\(stringID)"
            
            AF.request(url).responseJSON { responce in
                let decoder = JSONDecoder()
                if let data = try? decoder.decode(Drink.self, from: responce.data!) {
                    let detailDrink = data.drink ?? []
                    completion(detailDrink)
                }
            }
        }
    }
    func searchIngredients(for ingredient: String, completion: @escaping(([DrinksByIngredients]?) -> ())) {
         
         let url = Constants.drinkNetwork.searchIngredientPath + Constants.drinkNetwork.apiKey + Constants.drinkNetwork.searchIngredientSecondPath + "i=\(ingredient)"
         
         AF.request(url).responseJSON { responce in
             let decoder = JSONDecoder()
             if let data = try? decoder.decode(IngredientsDrinkResult.self, from: responce.data!) {
                 let drink = data.drinks ?? []
                 completion(drink)
             }
         }
     }
}
