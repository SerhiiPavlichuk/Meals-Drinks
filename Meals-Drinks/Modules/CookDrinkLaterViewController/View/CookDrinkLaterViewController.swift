//
//  CookDrinkLaterViewController.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import Foundation
import UIKit

class CookDrinkLaterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CookDrinkLaterViewModel = CookDrinkLaterViewModel()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.drink = self.viewModel.getDrinks()
        self.tableView.reloadData()
        self.navigationController?.isNavigationBarHidden = false
        
        
    }
    
}

    //MARK: - Extensions

extension CookDrinkLaterViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.drink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier)
        cell?.textLabel?.text = self.viewModel.drink[indexPath.row].strDrink
        
        return cell ?? UITableViewCell()
    }
}

extension CookDrinkLaterViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let item = viewModel.drink[indexPath.row]
            tableView.beginUpdates()
            viewModel.drink.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            try! viewModel.realm?.write {
                viewModel.realm?.delete(item)
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: CookLaterDetailDrinkViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? CookLaterDetailDrinkViewController {
            
            detailViewController.viewModel.drink = self.viewModel.drink[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

