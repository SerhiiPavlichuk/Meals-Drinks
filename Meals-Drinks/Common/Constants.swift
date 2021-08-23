//
//  Constants.swift
//  Meals-Drinks
//
//  Created by admin on 17.08.2021.
//

import Foundation
struct Constants {
    
    struct network {
        
        static let apiKey = "v2/9973533"
        static let randomMealPath = "https://www.themealdb.com/api/json/"
        static let randomMealSecondPath = "/randomselection.php"
        static let mealcategoryUrl = "https://www.themealdb.com/api/json/v1/1/categories.php"
        static let mealsInCategoryPath = "https://www.themealdb.com/api/json/v1/1/filter.php?"
        static let detailMealPath = "https://www.themealdb.com/api/json/v1/1/lookup.php?"
        
        static let defaultImagePath = "https://image.tmdb.org/t/p/original/"
        static let defaultPath = "https://api.themoviedb.org/3/"
    }
    
    struct ui {
        static let defaultCellIdentifier = "Cell"
        static let RandomDetailViewControllerBarButtonItem = "Cook Later"
        static let RandomDrinkDetailViewControllerBarButtonItem = "Cook Later"
    }
    
}
