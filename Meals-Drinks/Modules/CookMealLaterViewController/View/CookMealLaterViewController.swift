//
//  CookMealLaterViewController.swift
//  Meals-Drinks
//
//  Created by admin on 16.08.2021.
//

import Foundation
import UIKit


class CookMealLaterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CookMealLaterViewModel = CookMealLaterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.meal = self.viewModel.getMeals()
        self.tableView.reloadData()
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension CookMealLaterViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.meal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier)
        cell?.textLabel?.text = self.viewModel.meal[indexPath.row].mealName
        
        return cell ?? UITableViewCell()
    }
}

extension CookMealLaterViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let item = viewModel.meal[indexPath.row]
            tableView.beginUpdates()
            viewModel.meal.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            let realm = try! viewModel.realm
            try! viewModel.realm?.write {
                viewModel.realm?.delete(item)
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: CoockLaterDetailMealViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? CoockLaterDetailMealViewController {
            
            detailViewController.viewModel.meal = self.viewModel.meal[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
