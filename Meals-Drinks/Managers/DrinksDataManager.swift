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
        drinkRealm.strIngredient1 = drink.strIngredient1 ?? ""
        drinkRealm.strIngredient2 = drink.strIngredient2 ?? ""
        drinkRealm.strIngredient3 = drink.strIngredient3 ?? ""
        drinkRealm.strIngredient4 = drink.strIngredient4 ?? ""
        drinkRealm.strIngredient5 = drink.strIngredient5 ?? ""
        drinkRealm.strIngredient6 = drink.strIngredient6 ?? ""
        drinkRealm.strIngredient7 = drink.strIngredient7 ?? ""
        drinkRealm.strIngredient8 = drink.strIngredient8 ?? ""
        drinkRealm.strIngredient9 = drink.strIngredient9 ?? ""
        drinkRealm.strIngredient10 = drink.strIngredient10 ?? ""
        drinkRealm.strIngredient11 = drink.strIngredient11 ?? ""
        drinkRealm.strIngredient12 = drink.strIngredient12 ?? ""
        drinkRealm.strIngredient13 = drink.strIngredient13 ?? ""
        drinkRealm.strIngredient14 = drink.strIngredient14 ?? ""
        drinkRealm.strIngredient15 = drink.strIngredient15 ?? ""
        drinkRealm.strMeasure1 = drink.strMeasure1 ?? ""
        drinkRealm.strMeasure2 = drink.strMeasure2 ?? ""
        drinkRealm.strMeasure3 = drink.strMeasure3 ?? ""
        drinkRealm.strMeasure4 = drink.strMeasure4 ?? ""
        drinkRealm.strMeasure5 = drink.strMeasure5 ?? ""
        drinkRealm.strMeasure6 = drink.strMeasure6 ?? ""
        drinkRealm.strMeasure7 = drink.strMeasure7 ?? ""
        drinkRealm.strMeasure8 = drink.strMeasure8 ?? ""
        drinkRealm.strMeasure9 = drink.strMeasure9 ?? ""
        drinkRealm.strMeasure10 = drink.strMeasure10 ?? ""
        drinkRealm.strMeasure11 = drink.strMeasure11 ?? ""
        drinkRealm.strMeasure12 = drink.strMeasure12 ?? ""
        drinkRealm.strMeasure13 = drink.strMeasure13 ?? ""
        drinkRealm.strMeasure14 = drink.strMeasure14 ?? ""
        drinkRealm.strMeasure15 = drink.strMeasure15 ?? ""
        
        
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
        drinkRealm.strIngredient1 = drink.strIngredient1 ?? ""
        drinkRealm.strIngredient2 = drink.strIngredient2 ?? ""
        drinkRealm.strIngredient3 = drink.strIngredient3 ?? ""
        drinkRealm.strIngredient4 = drink.strIngredient4 ?? ""
        drinkRealm.strIngredient5 = drink.strIngredient5 ?? ""
        drinkRealm.strIngredient6 = drink.strIngredient6 ?? ""
        drinkRealm.strIngredient7 = drink.strIngredient7 ?? ""
        drinkRealm.strIngredient8 = drink.strIngredient8 ?? ""
        drinkRealm.strIngredient9 = drink.strIngredient9 ?? ""
        drinkRealm.strIngredient10 = drink.strIngredient10 ?? ""
        drinkRealm.strIngredient11 = drink.strIngredient11 ?? ""
        drinkRealm.strIngredient12 = drink.strIngredient12 ?? ""
        drinkRealm.strIngredient13 = drink.strIngredient13 ?? ""
        drinkRealm.strIngredient14 = drink.strIngredient14 ?? ""
        drinkRealm.strIngredient15 = drink.strIngredient15 ?? ""
        drinkRealm.strMeasure1 = drink.strMeasure1 ?? ""
        drinkRealm.strMeasure2 = drink.strMeasure2 ?? ""
        drinkRealm.strMeasure3 = drink.strMeasure3 ?? ""
        drinkRealm.strMeasure4 = drink.strMeasure4 ?? ""
        drinkRealm.strMeasure5 = drink.strMeasure5 ?? ""
        drinkRealm.strMeasure6 = drink.strMeasure6 ?? ""
        drinkRealm.strMeasure7 = drink.strMeasure7 ?? ""
        drinkRealm.strMeasure8 = drink.strMeasure8 ?? ""
        drinkRealm.strMeasure9 = drink.strMeasure9 ?? ""
        drinkRealm.strMeasure10 = drink.strMeasure10 ?? ""
        drinkRealm.strMeasure11 = drink.strMeasure11 ?? ""
        drinkRealm.strMeasure12 = drink.strMeasure12 ?? ""
        drinkRealm.strMeasure13 = drink.strMeasure13 ?? ""
        drinkRealm.strMeasure14 = drink.strMeasure14 ?? ""
        drinkRealm.strMeasure15 = drink.strMeasure15 ?? ""
        
        
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
