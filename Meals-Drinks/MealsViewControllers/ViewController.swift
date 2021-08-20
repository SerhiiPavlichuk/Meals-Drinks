//
//  ViewController.swift
//  Meals-Drinks
//
//  Created by admin on 09.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var randomMeals: [MealInformation] = []
    var mealCategory: [MealsCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomMealCollectionViewCellIdentifier = String(describing: RandomMealCollectionViewCell.self)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.collectionView.register(UINib(nibName: randomMealCollectionViewCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: randomMealCollectionViewCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MealsNetworkManager.shared.requestRandomMeals(completion: { randomMeals in
            self.randomMeals = randomMeals
            self.collectionView.reloadData()
            
        })
        
        MealsNetworkManager.shared.requestMealCategory(completion: { mealCategory in
            self.mealCategory = mealCategory
            self.tableView.reloadData()
            
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mealCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.mealCategory[indexPath.row].nameCategory
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: MealsCategoryDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? MealsCategoryDetailViewController {
            
            detailViewController.mealCategory = self.mealCategory[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.randomMeals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let urlBase = randomMeals[indexPath.row].strMealThumb!
        let imageUrl = URL(string: urlBase)!
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RandomMealCollectionViewCell", for: indexPath) as! RandomMealCollectionViewCell
        cell.cellLabelView.text = randomMeals[indexPath.row].mealName
        cell.cellImageView.sd_setImage(with: imageUrl) { (image, erro, cache, url) in
            
        }
        return (cell)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let identifier = String(describing: RandomMealDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? RandomMealDetailViewController {
            
            detailViewController.meals = self.randomMeals[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
