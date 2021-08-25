//
//  DrinksDataManager.swift
//  Meals-Drinks
//
//  Created by admin on 25.08.2021.
//

import Foundation
import RealmSwift

struct DrinksDataManager {
    
    let realm = try? Realm()
    
    static let shared = DrinksDataManager()
    
    private init() { }
    
    func saveRandomDrink(_ drink: RandomDrinks, completion: @escaping(() -> ())) {
        
        let drinkRealm = DrinksRealm()
        
        drinkRealm.idDrink = drink.idDrink ?? ""
        drinkRealm.strDrink = drink.strDrink ?? ""
        drinkRealm.strCategory = drink.strCategory ?? ""
        drinkRealm.strInstructions = drink.strInstructions ?? ""
        drinkRealm.strDrinkThumb = drink.strDrinkThumb ?? ""
        
        
        try? realm?.write {
            realm?.add(drinkRealm)
        }
        completion()
    }
    
    func saveDetailDrink(_ drink: DetailDrinkInformation, completion: @escaping(() -> ())) {
        
        let drinkRealm = DrinksRealm()
        
        drinkRealm.idDrink = drink.idDrink ?? ""
        drinkRealm.strDrink = drink.strDrink ?? ""
        drinkRealm.strCategory = drink.strCategory ?? ""
        drinkRealm.strInstructions = drink.strInstructions ?? ""
        drinkRealm.strDrinkThumb = drink.strDrinkThumb ?? ""
        
        
        try? realm?.write {
            realm?.add(drinkRealm)
        }
        completion()
    }
    
    func getAllDrinks(completion: ([RandomDrinks])->()) {
        
        var drinksRealm = [DrinksRealm]()
        guard let drinksResult = realm?.objects(DrinksRealm.self) else { return }
        for drink in drinksResult {
            drinksRealm.append(drink)
        }
        
        completion(convertToDrinksList(drinksRealm: drinksRealm))
    }
    
    private func convertToDrinksList(drinksRealm: [DrinksRealm]) -> [RandomDrinks] {
        
        var drinks = [RandomDrinks]()
        for drinksRealm in drinksRealm {
            let drink = RandomDrinks(from: drinksRealm)
            drinks.append(drink)
        }
        return drinks
    }
    private func convertToDrinksList(drinksRealm: [DrinksRealm]) -> [DetailDrinkInformation] {
          
          var drinks = [DetailDrinkInformation]()
          for drinksRealm in drinksRealm {
              let drink = DetailDrinkInformation(from: drinksRealm)
              drinks.append(drink)
          }
          return drinks
      }
}
