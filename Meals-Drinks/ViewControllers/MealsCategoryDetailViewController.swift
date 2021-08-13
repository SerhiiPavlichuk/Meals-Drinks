//
//  MealsCategoryDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 13.08.2021.
//

import Foundation
import UIKit



class MealsCategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allMeals: Meals? = nil
    var mealCategory: MealsCategory? = nil
    var detailMealCategory: [MealsCategory] = []
    var allDetailMeals: [Meals] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.title = self.mealCategory?.nameCategory
        
        
    }
    
}
