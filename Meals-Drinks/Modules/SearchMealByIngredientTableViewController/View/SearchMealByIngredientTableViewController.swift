//
//  SearchMealByIngredientTableViewController.swift
//  Meals-Drinks
//
//  Created by admin on 30.08.2021.
//

import Foundation
import UIKit

class SearchMealByIngredientTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel: SearchMealByIngredientTableViewModel = SearchMealByIngredientTableViewModel()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
}

    //MARK: - Extensions

extension SearchMealByIngredientTableViewController: UISearchBarDelegate {
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
extension SearchMealByIngredientTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier, for: indexPath)
        _ = viewModel.items[indexPath.row]
        cell.textLabel?.text = self.viewModel.items[indexPath.row].strMeal
        
        return cell
    }
}

extension SearchMealByIngredientTableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: DetailMealFromSearchByIngredient.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? DetailMealFromSearchByIngredient {
            
            detailViewController.viewModel.mealsByIngredients = self.viewModel.items[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
