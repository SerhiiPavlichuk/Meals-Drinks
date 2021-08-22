//
//  DrinksCategoryDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 19.08.2021.
//

import Foundation
import UIKit

class DrinksCategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var drinksInCategory: [DrinksInCategory] = []
    var drinksCategory: DrinksCategory? = nil
    var drinkArray: [DetailDrinkInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.title = self.drinksCategory?.strCategory
        
        DrinksNetworkManager.shared.requestDrinksInCategory(drinkCategory: drinksCategory, completion: {
            drinksInCategory in
            self.drinksInCategory = drinksInCategory ?? []
            self.tableView.reloadData()
        })
    }
}

extension DrinksCategoryDetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drinksInCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.drinksInCategory[indexPath.row].strDrink
        return cell
    }
}

extension DrinksCategoryDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: DrinkDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? DrinkDetailViewController {
            
            detailViewController.drinkInCategory = self.drinksInCategory[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}



