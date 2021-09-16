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
        mealRealm.strIngredient1 = meal.strIngredient1 ?? ""
        mealRealm.strIngredient2 = meal.strIngredient2 ?? ""
        mealRealm.strIngredient3 = meal.strIngredient3 ?? ""
        mealRealm.strIngredient4 = meal.strIngredient4 ?? ""
        mealRealm.strIngredient5 = meal.strIngredient5 ?? ""
        mealRealm.strIngredient6 = meal.strIngredient6 ?? ""
        mealRealm.strIngredient7 = meal.strIngredient7 ?? ""
        mealRealm.strIngredient8 = meal.strIngredient8 ?? ""
        mealRealm.strIngredient9 = meal.strIngredient9 ?? ""
        mealRealm.strIngredient10 = meal.strIngredient10 ?? ""
        mealRealm.strIngredient11 = meal.strIngredient11 ?? ""
        mealRealm.strIngredient12 = meal.strIngredient12 ?? ""
        mealRealm.strIngredient13 = meal.strIngredient13 ?? ""
        mealRealm.strIngredient14 = meal.strIngredient14 ?? ""
        mealRealm.strIngredient15 = meal.strIngredient15 ?? ""
        mealRealm.strMeasure1 = meal.strMeasure1 ?? ""
        mealRealm.strMeasure2 = meal.strMeasure2 ?? ""
        mealRealm.strMeasure3 = meal.strMeasure3 ?? ""
        mealRealm.strMeasure4 = meal.strMeasure4 ?? ""
        mealRealm.strMeasure5 = meal.strMeasure5 ?? ""
        mealRealm.strMeasure6 = meal.strMeasure6 ?? ""
        mealRealm.strMeasure7 = meal.strMeasure7 ?? ""
        mealRealm.strMeasure8 = meal.strMeasure8 ?? ""
        mealRealm.strMeasure9 = meal.strMeasure9 ?? ""
        mealRealm.strMeasure10 = meal.strMeasure10 ?? ""
        mealRealm.strMeasure11 = meal.strMeasure11 ?? ""
        mealRealm.strMeasure12 = meal.strMeasure12 ?? ""
        mealRealm.strMeasure13 = meal.strMeasure13 ?? ""
        mealRealm.strMeasure14 = meal.strMeasure14 ?? ""
        mealRealm.strMeasure15 = meal.strMeasure15 ?? ""

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
         mealRealm.strIngredient1 = meal.strIngredient1 ?? ""
         mealRealm.strIngredient2 = meal.strIngredient2 ?? ""
         mealRealm.strIngredient3 = meal.strIngredient3 ?? ""
         mealRealm.strIngredient4 = meal.strIngredient4 ?? ""
         mealRealm.strIngredient5 = meal.strIngredient5 ?? ""
         mealRealm.strIngredient6 = meal.strIngredient6 ?? ""
         mealRealm.strIngredient7 = meal.strIngredient7 ?? ""
         mealRealm.strIngredient8 = meal.strIngredient8 ?? ""
         mealRealm.strIngredient9 = meal.strIngredient9 ?? ""
         mealRealm.strIngredient10 = meal.strIngredient10 ?? ""
         mealRealm.strIngredient11 = meal.strIngredient11 ?? ""
         mealRealm.strIngredient12 = meal.strIngredient12 ?? ""
         mealRealm.strIngredient13 = meal.strIngredient13 ?? ""
         mealRealm.strIngredient14 = meal.strIngredient14 ?? ""
         mealRealm.strIngredient15 = meal.strIngredient15 ?? ""
         mealRealm.strMeasure1 = meal.strMeasure1 ?? ""
         mealRealm.strMeasure2 = meal.strMeasure2 ?? ""
         mealRealm.strMeasure3 = meal.strMeasure3 ?? ""
         mealRealm.strMeasure4 = meal.strMeasure4 ?? ""
         mealRealm.strMeasure5 = meal.strMeasure5 ?? ""
         mealRealm.strMeasure6 = meal.strMeasure6 ?? ""
         mealRealm.strMeasure7 = meal.strMeasure7 ?? ""
         mealRealm.strMeasure8 = meal.strMeasure8 ?? ""
         mealRealm.strMeasure9 = meal.strMeasure9 ?? ""
         mealRealm.strMeasure10 = meal.strMeasure10 ?? ""
         mealRealm.strMeasure11 = meal.strMeasure11 ?? ""
         mealRealm.strMeasure12 = meal.strMeasure12 ?? ""
         mealRealm.strMeasure13 = meal.strMeasure13 ?? ""
         mealRealm.strMeasure14 = meal.strMeasure14 ?? ""
         mealRealm.strMeasure15 = meal.strMeasure15 ?? ""

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

