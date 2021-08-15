//
//  MealDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 15.08.2021.
//

import Foundation
import UIKit
import Alamofire



class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var detailMeal: MealsInCategory? = nil
    
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        self.title = self.detailMeal?.strMeal
              self.label.text = self.detailMeal?.strMeal
        
    }
}
