//
//  MealsRealm.swift
//  Meals-Drinks
//
//  Created by admin on 16.08.2021.
//
import Foundation
import RealmSwift

class MealsRealm: Object {
    
    @objc dynamic var idMeal = ""
    @objc dynamic var mealName = ""
    @objc dynamic var mealCategory = ""
    @objc dynamic var strInstructions = ""
    @objc dynamic var strMealThumb = ""
    @objc dynamic var strYoutube = ""
    @objc dynamic var strSource = ""

}
