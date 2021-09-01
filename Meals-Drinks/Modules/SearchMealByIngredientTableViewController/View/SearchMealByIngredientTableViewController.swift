//
//  SearchMealByIngredientTableViewController.swift
//  Meals-Drinks
//
//  Created by admin on 30.08.2021.
//

import Foundation
import UIKit
import Alamofire

class SearchMealByIngredientTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    
    var items: [MealsByIngridients] = []
    
    override func viewDidLoad() {
       super.viewDidLoad()
       searchBar.delegate = self
       
     }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return items.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier, for: indexPath)
        _ = items[indexPath.row]
        cell.textLabel?.text = self.items[indexPath.row].strMeal
       
      return cell
    }
  
}
extension SearchMealByIngredientTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      guard let ingredient = searchBar.text else { return }
        searchIngredients(for: ingredient)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      searchBar.text = nil
      searchBar.resignFirstResponder()
//      items =
      tableView.reloadData()
    }
  }
extension SearchMealByIngredientTableViewController {
  
  func searchIngredients(for ingredient: String) {
    
    let url = "https://www.themealdb.com/api/json/v2/9973533/filter.php?i=\(ingredient)"
    
    AF.request(url).validate()
      .responseDecodable(of: IngredientsResult.self) { response in
        guard let meals = response.value else { return }
        if let meal = meals.meals{
        self.items = meal
        }
        self.tableView.reloadData()
    }
  }
}




