//
//  SearchDrinkByIngredientViewController.swift
//  Meals-Drinks
//
//  Created by admin on 01.09.2021.
//

import Foundation
import UIKit
import Alamofire

class SearchDrinkByIngredientViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var items: [DrinksByIngredients] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
        searchBar.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    func searchIngredients(for ingredient: String) {
        
        let url = Constants.drinkNetwork.searchIngredientPath +  "i=\(ingredient)"
        
        AF.request(url).validate()
            .responseDecodable(of: IngredientsDrinkResult.self) { response in
                guard let drinks = response.value else { return }
                if let drink = drinks.drinks{
                    self.items = drink
                }
                self.tableView.reloadData()
            }
    }
}


extension SearchDrinkByIngredientViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier, for: indexPath)
        _ = items[indexPath.row]
        cell.textLabel?.text = self.items[indexPath.row].strDrink
        
        return cell
    }
}

extension SearchDrinkByIngredientViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: DetailDrinkFromSearchByIngredientViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? DetailDrinkFromSearchByIngredientViewController {
            
            detailViewController.viewModel.drinks = self.items[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension SearchDrinkByIngredientViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let ingredient = searchBar.text else { return }
        searchIngredients(for: ingredient)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}



