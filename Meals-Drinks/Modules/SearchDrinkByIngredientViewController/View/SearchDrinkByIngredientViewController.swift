//
//  SearchDrinkByIngredientViewController.swift
//  Meals-Drinks
//
//  Created by admin on 01.09.2021.
//

import Foundation
import UIKit

class SearchDrinkByIngredientViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel: SearchDrinkByIngredientViewModel = SearchDrinkByIngredientViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
        searchBar.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
}


extension SearchDrinkByIngredientViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier, for: indexPath)
        _ = viewModel.items[indexPath.row]
        cell.textLabel?.text = self.viewModel.items[indexPath.row].strDrink
        
        return cell
    }
}

extension SearchDrinkByIngredientViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: DetailDrinkFromSearchByIngredientViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? DetailDrinkFromSearchByIngredientViewController {
            
            detailViewController.viewModel.drinks = self.viewModel.items[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension SearchDrinkByIngredientViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let ingredient = searchBar.text else { return }
        self.viewModel.loadSearchResult(ingredient: ingredient, completion: {
            self.view.endEditing(true)
            self.tableView.reloadData()
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}



