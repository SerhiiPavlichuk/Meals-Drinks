//
//  MealsCategoryDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 13.08.2021.
//

import Foundation
import UIKit
import Alamofire



class MealsCategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var mealsInCategory = MealsInCategory? = nil
    var mealCategory: MealsCategory? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.title = self.mealCategory?.nameCategory
        self.requestMealsInCategory()
    }
    
    
    func requestMealsInCategory(){
        
        if let categoryNameForURL = mealCategory?.nameCategory{
            let stringID = String(describing : categoryNameForURL)
            let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(stringID)"
            
            AF.request(url).responseJSON { responce in
                
                let decoder = JSONDecoder()
                
                if let data = try? decoder.decode(mealsInCategory.self, from: responce.data!) {
                    //                self.mealCategory = data.categories ?? []
                    self.tableView.reloadData()
                    
                }
            }
        }
    }
}

extension MealsCategoryDetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mealsInCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.mealsInCategory[indexPath.row].*****
        return cell
    }
    
}
