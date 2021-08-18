//
//  CookDrinkLater.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import Foundation
import UIKit
import RealmSwift

class CookDrinkLater: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
        
        
        let realm = try? Realm()
    
        var drink: [DrinksRealm] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            
            
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            self.drink = self.getDrinks()
            self.tableView.reloadData()
        }
        
        func getDrinks() -> [DrinksRealm] {
            
            var drinks = [DrinksRealm]()
            guard let drinksResult = realm?.objects(DrinksRealm.self) else { return [] }
            for drink in drinksResult {
                drinks.append(drink)
            }
            return drinks
        }
        
    }

    extension CookDrinkLater: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return drink.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            cell?.textLabel?.text = self.drink[indexPath.row].strDrink
            
            return cell ?? UITableViewCell()
        }
    }



