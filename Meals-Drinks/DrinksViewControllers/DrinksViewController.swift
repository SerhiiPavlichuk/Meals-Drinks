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
    
    var randomDrinks: [RandomDrinks] = []
    var drinksCategory: [DrinksCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryDrinksCollectionViewCellIdentifier = String(describing: CategoryDrinksCollectionViewCell.self)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.collectionView.register(UINib(nibName: categoryDrinksCollectionViewCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: categoryDrinksCollectionViewCellIdentifier)
        
        DrinksNetworkManager.shared.requestDrinkCategory(completion: { drinksCategory in
               self.drinksCategory = drinksCategory
               self.collectionView.reloadData()
           })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DrinksNetworkManager.shared.requestRandomDrinks(completion: { randomDrinks in
            self.randomDrinks = randomDrinks
            self.tableView.reloadData()
        })
    }
}

extension DrinksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.randomDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.randomDrinks[indexPath.row].strDrink
        return cell
    }
}

extension DrinksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: RandomDrinkDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? RandomDrinkDetailViewController {
            
            detailViewController.drink = self.randomDrinks[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension DrinksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.drinksCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let urlBase = drinksCategory[indexPath.row].strDrinkThumb!
//        let imageUrl = URL(string: urlBase)!
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDrinksCollectionViewCell", for: indexPath) as! CategoryDrinksCollectionViewCell
        cell.cellLabelView.text = drinksCategory[indexPath.row].strCategory
//        cell.cellImageView.sd_setImage(with: imageUrl) { (image, erro, cache, url) in
//        }
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
            
            detailViewController.drinksCategory = self.drinksCategory[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
