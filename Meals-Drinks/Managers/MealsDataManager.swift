//
//  MealsDataManager.swift
//  Meals-Drinks
//
//  Created by admin on 22.08.2021.
//

import Foundation
import RealmSwift

struct MealsDataManager {
    
    let realm = try? Realm()

    static let shared = MealsDataManager()

    private init() { }
    
    func saveRandomMeal(_ meal: MealInformation, completion: @escaping(() -> ())) {
        
        let mealRealm = MealsRealm()
        
        mealRealm.idMeal = meal.idMeal ?? ""
        mealRealm.mealName = meal.mealName ?? ""
        mealRealm.mealCategory = meal.mealCategory ?? ""
        mealRealm.strInstructions = meal.strInstructions ?? ""
        mealRealm.strMealThumb = meal.strMealThumb ?? ""
        mealRealm.strYoutube = meal.strYoutube ?? ""
        mealRealm.strSource = meal.strSource ?? ""

        try? realm?.write {
            realm?.add(mealRealm)
        }
        completion()
    }
    
    func saveDetailMeal(_ meal: DetailMealInformation, completion: @escaping(() -> ())) {
         
         let mealRealm = MealsRealm()
         
         mealRealm.idMeal = meal.idMeal ?? ""
         mealRealm.mealName = meal.mealName ?? ""
         mealRealm.mealCategory = meal.mealCategory ?? ""
         mealRealm.strInstructions = meal.strInstructions ?? ""
         mealRealm.strMealThumb = meal.strMealThumb ?? ""
         mealRealm.strYoutube = meal.strYoutube ?? ""
         mealRealm.strSource = meal.strSource ?? ""

         try? realm?.write {
             realm?.add(mealRealm)
         }
         completion()
     }
    
    func getAllMeals(completion: ([MealInformation])->()) {
        
        var mealsRealm = [MealsRealm]()
        guard let mealsResult = realm?.objects(MealsRealm.self) else { return }
        for meal in mealsResult {
            mealsRealm.append(meal)
        }
        
        completion(convertToMealsList(mealsRealm: mealsRealm))
    }
    
    private func convertToMealsList(mealsRealm: [MealsRealm]) -> [MealInformation] {

        var meals = [MealInformation]()
        for mealRealm in mealsRealm {
            let meal = MealInformation(from: mealRealm)
            meals.append(meal)
        }
        return meals
    }
}

