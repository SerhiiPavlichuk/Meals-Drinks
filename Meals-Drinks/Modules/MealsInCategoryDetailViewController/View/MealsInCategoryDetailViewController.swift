//
//  MealsCategoryDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 13.08.2021.
//

import Foundation
import UIKit

class MealsInCategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MealsInCategoryDetailViewModel = MealsInCategoryDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
        self.title = self.viewModel.mealCategory?.nameCategory
        self.viewModel.loadMealsInCategory(completion: {
            self.tableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           self.navigationController?.isNavigationBarHidden = false

       }
}

extension MealsInCategoryDetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.mealsInCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.viewModel.mealsInCategory[indexPath.row].strMeal
        return cell
    }
}

extension MealsInCategoryDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: MealDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? MealDetailViewController {
            
            detailViewController.viewModel.mealForCategory = self.viewModel.mealsInCategory[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
