//
//  SearchMealByIngredientTableViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 31.08.2021.
//
//
import Foundation

class SearchMealByIngredientTableViewModel{

    var meal: MealsByIngridients? = nil
    var items: [MealsByIngridients] = []

    func loadSearchResult(ingredient: String, completion: @escaping(() -> ())) {
        MealsNetworkManager.shared.searchIngredients(for: ingredient, completion: { meal in
            self.items = meal ?? []
            completion()
        })
    }
}
