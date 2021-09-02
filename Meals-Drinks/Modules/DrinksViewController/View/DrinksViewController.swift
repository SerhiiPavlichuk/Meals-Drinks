//
//  DrinksViewController.swift
//  Meals-Drinks
//
//  Created by admin on 17.08.2021.
//

import Foundation
import UIKit

class DrinksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: DrinksViewModel = DrinksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryDrinksCollectionViewCellIdentifier = String(describing: CategoryDrinksCollectionViewCell.self)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
        self.collectionView.register(UINib(nibName: categoryDrinksCollectionViewCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: categoryDrinksCollectionViewCellIdentifier)
        
        self.viewModel.loadCategories(completion: {
            self.collectionView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.loadRandomDrinks(completion: {
            self.tableView.reloadData()
        })
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension DrinksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.randomDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.viewModel.randomDrinks[indexPath.row].strDrink
        return cell
    }
}

extension DrinksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: RandomDrinkDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? RandomDrinkDetailViewController {
            
            detailViewController.viewModel.randomDrink = self.viewModel.randomDrinks[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension DrinksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.drinkCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = String(describing: CategoryDrinksCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CategoryDrinksCollectionViewCell
        cell.cellLabelView.text = viewModel.drinkCategories[indexPath.row].strCategory
        return (cell)
    }
}

extension DrinksViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
extension DrinksViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let identifier = String(describing: DrinksCategoryDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? DrinksCategoryDetailViewController {
            
            detailViewController.viewModel.drinksCategory = self.viewModel.drinkCategories[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
