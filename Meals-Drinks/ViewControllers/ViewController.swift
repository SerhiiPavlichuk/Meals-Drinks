//
//  ViewController.swift
//  Meals-Drinks
//
//  Created by admin on 09.08.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var randomMeals: [MealInformation] = []
    var allMeals: [Meals] = []
    var mealCategory: [MealsCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.requestRandomMeals()
        self.requestAllMeals()
        self.requestMealCategory()
    }
    
    func requestRandomMeals() {
        
        let url = "https://www.themealdb.com/api/json/v2/api-key/randomselection.php"
        
        AF.request(url).responseJSON { responce in
            
            
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode(RandomMeals.self, from: responce.data!) {
                self.randomMeals = data.meals ?? []
                self.tableView.reloadData()
                
            }
        }
    }
    
    func requestAllMeals(){
        
        let url = "https://www.themealdb.com/api/json/v2/api-key/search.php?s="
        
        AF.request(url).responseJSON { responce in
            
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode(AllMeals.self, from: responce.data!) {
                self.allMeals = data.meals ?? []
                self.tableView.reloadData()
                
            }
        }
    }
    
    func requestMealCategory(){
        
        let url = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        AF.request(url).responseJSON { responce in
            
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode(MealCategory.self, from: responce.data!) {
                self.mealCategory = data.categories ?? []
                self.tableView.reloadData()
                
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.randomMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.randomMeals[indexPath.row].mealName
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: RandomMealDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? RandomMealDetailViewController {
            
            detailViewController.meals = self.randomMeals[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mealCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell",
                                                         for: indexPath) as? CategoryCollectionViewCell {
            cell.configureWith(nameCategory: self.mealCategory[indexPath.row].nameCategory, imageCategory: "")
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
