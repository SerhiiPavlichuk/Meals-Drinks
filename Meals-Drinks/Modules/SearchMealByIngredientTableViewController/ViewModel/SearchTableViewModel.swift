//
//  SearchMealByIngredientTableViewModel.swift
//  Meals-Drinks
//
//  Created by admin on 31.08.2021.
//
//
//import Foundation
//
//class SearchMealByIngredientTableViewModel{
//
//    var meal: MealsByIngridients? = nil
//    var items: [MealsByIngridients] = []
//
//    func loadSearchReult(completion: @escaping(() -> ())) {
//        MealsNetworkManager.shared.searchIngredients(for: meal, completion: { meal in
//            self.items = meal ?? []
//            completion()
//        })
//    }
//
//}
