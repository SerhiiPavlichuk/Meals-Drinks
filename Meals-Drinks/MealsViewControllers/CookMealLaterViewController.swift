//
//  CookMealLaterViewController.swift
//  Meals-Drinks
//
//  Created by admin on 16.08.2021.
//

import Foundation
import UIKit
import RealmSwift

class CookMealLaterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
        
        let realm = try? Realm()
        var meal: [MealsRealm] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            
            
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            self.meal = self.getMeals()
            self.tableView.reloadData()
        }
        
        func getMeals() -> [MealsRealm] {
            
            var meals = [MealsRealm]()
            guard let mealsResult = realm?.objects(MealsRealm.self) else { return [] }
            for meal in mealsResult {
                meals.append(meal)
            }
            return meals
        }
        
    }

    extension CookMealLaterViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return meal.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            cell?.textLabel?.text = self.meal[indexPath.row].mealName
            
            return cell ?? UITableViewCell()
        }
    }


