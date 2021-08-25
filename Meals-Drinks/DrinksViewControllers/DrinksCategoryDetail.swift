//
//  DrinksCategoryDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import Foundation
import UIKit



class DrinksCategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
   
    var mealsInCategory: [MealsInCategory] = []
    var mealCategory: MealsCategory? = nil
    var mealsInCategoryForIdReuest: MealsInCategory? = nil
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.title = self.mealCategory?.nameCategory
        
        MealsNetworkManager.shared.requestMealsInCategory(mealCategory: mealCategory, completion: {
            mealsInCategory in
            self.mealsInCategory = mealsInCategory ?? []
                       self.tableView.reloadData()
        })
    }
}

extension MealsCategoryDetailViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mealsInCategory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.mealsInCategory[indexPath.row].strMeal
        return cell
    }

}

extension MealsCategoryDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: MealDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? MealDetailViewController {
            
            detailViewController.mealForCategory = self.mealsInCategory[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

