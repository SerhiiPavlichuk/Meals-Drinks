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
    
    var viewModel: DrinksCategoryDetailViewModel = DrinksCategoryDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
        self.title = self.viewModel.drinksCategory?.strCategory
        
        self.viewModel.loadDrinksInCategory(completion: {
                   self.tableView.reloadData()
               })
    }
}

extension DrinksCategoryDetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.drinksInCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.viewModel.drinksInCategory[indexPath.row].strDrink
        return cell
    }
}

extension DrinksCategoryDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: DrinkDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? DrinkDetailViewController {
            
            detailViewController.viewModel.drinkInCategory = self.viewModel.drinksInCategory[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}



