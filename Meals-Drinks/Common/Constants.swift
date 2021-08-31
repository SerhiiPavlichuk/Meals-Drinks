//
//  Constants.swift
//  Meals-Drinks
//
//  Created by admin on 17.08.2021.
//

import Foundation
struct Constants {
    
    struct mealNetwork {
        
        static let apiKey = "v2/9973533"
        static let randomMealPath = "https://www.themealdb.com/api/json/"
        static let randomMealSecondPath = "/randomselection.php"
        static let mealCategoryUrl = "https://www.themealdb.com/api/json/v1/1/categories.php"
        static let mealsInCategoryPath = "https://www.themealdb.com/api/json/v1/1/filter.php?"
        static let detailMealPath = "https://www.themealdb.com/api/json/v1/1/lookup.php?"
        static let searchIngredientPath = "https://www.themealdb.com/api/json/v2/9973533/filter.php?"
    }
    struct drinkNetwork {
        
        static let apiKey = "v2/9973533"
        static let randomDrinkPath = "https://www.thecocktaildb.com/api/json/"
        static let randomDrinkSecondPath = "/randomselection.php"
        static let drinkCategoryUrl = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
        static let drinksInCategoryPath = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?"
        static let detailDrinkPath = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?"
        static let iBAUrl = "https://iba-world.com/"

    }
    
    struct ui {
        static let defaultCellIdentifier = "Cell"
        static let RandomDetailViewControllerBarButtonItem = "Cook Later"
        static let RandomDrinkDetailViewControllerBarButtonItem = "Cook Later"
        static let mealSavedMessage = "Meal saved!"
        static let drinkSavedMessage = "Drink saved!"
        static let okMealMessage = "Ok 🍲" 
        static let okDrinkMessage = "Ok 🍹"
    }
    
}
