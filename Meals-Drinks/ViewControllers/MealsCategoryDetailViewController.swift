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
    
   
    var mealsInCategory: [MealsInCategory] = []
    var mealsInCategoryForIdReuest: MealsInCategory? = nil
    var mealCategory: MealsCategory? = nil
    var detailMeal: [DetailMealInformation] = []
    var responcedetailmeal: DetailMealInformation? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.title = self.mealCategory?.nameCategory
        self.requestMealsInCategory()
        
        
    }
    
//    func requestMealsInCategory(){
//
//        if let categoryNameForURL = mealCategory?.nameCategory{
//            let stringID = String(describing : categoryNameForURL)
//            let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(stringID)"
//
//            AF.request(url).responseJSON { responce in
//
//                let decoder = JSONDecoder()
//
//                if let data = try? decoder.decode(OpenMealCategory.self, from: responce.data!) {
//                    self.mealsInCategory = data.mealsInCategory ?? []
//                    self.tableView.reloadData()
//
//                }
//            }
//        }
//    }
}

extension MealsCategoryDetailViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mealsInCategory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.mealsInCategory[indexPath.row].strMeal
        return cell
    }

}

extension MealsCategoryDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: MealDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? MealDetailViewController {
            
            detailViewController.mealForCategory = self.mealsInCategory[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
