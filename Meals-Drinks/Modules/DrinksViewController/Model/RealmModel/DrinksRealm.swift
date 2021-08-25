//
//  DrinksRealm.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import Foundation
import RealmSwift

class DrinksRealm: Object {
    
    @objc dynamic var idDrink = ""
    @objc dynamic var strDrink = ""
    @objc dynamic var strCategory = ""
    @objc dynamic var strInstructions = ""
    @objc dynamic var strDrinkThumb = ""
    @objc dynamic var strGlass = ""
}
