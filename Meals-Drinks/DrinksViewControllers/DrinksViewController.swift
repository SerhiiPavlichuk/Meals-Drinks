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
        
        let randomDrinksCollectionViewCellIdentifier = String(describing: RandomDrinksCollectionViewCell.self)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.collectionView.register(UINib(nibName: randomDrinksCollectionViewCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: randomDrinksCollectionViewCellIdentifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DrinksNetworkManager.shared.requestRandomDrinks(completion: { randomDrinks in
            self.randomDrinks = randomDrinks
            self.collectionView.reloadData()
            
        })
    
        DrinksNetworkManager.shared.requestDrinkCategory(completion: { drinksCategory in
            self.drinksCategory = drinksCategory
            self.tableView.reloadData()

        })
     }
}

extension DrinksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drinksCategory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.drinksCategory[indexPath.row].strCategory
        return cell
    }
}

//extension DrinksViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let identifier = String(describing: MealsCategoryDetailViewController.self)
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? MealsCategoryDetailViewController {
//
//            detailViewController.mealCategory = self.mealCategory[indexPath.row]
//
//            self.navigationController?.pushViewController(detailViewController, animated: true)
//        }
//    }
//}

extension DrinksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.randomDrinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let urlBase = randomDrinks[indexPath.row].strDrinkThumb!
        let imageUrl = URL(string: urlBase)!
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RandomDrinksCollectionViewCell", for: indexPath) as! RandomDrinksCollectionViewCell
        cell.cellLabelView.text = randomDrinks[indexPath.row].strDrink
        cell.cellImageView.sd_setImage(with: imageUrl) { (image, erro, cache, url) in
            
        }
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
        
        let identifier = String(describing: RandomDrinkDetailViewController.self)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? RandomDrinkDetailViewController {

            detailViewController.drink = self.randomDrinks[indexPath.row]

            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
