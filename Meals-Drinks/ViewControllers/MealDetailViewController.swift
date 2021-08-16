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
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredient1Label: UILabel!
    @IBOutlet weak var ingredient2Label: UILabel!
    @IBOutlet weak var ingredient3Label: UILabel!
    @IBOutlet weak var ingredient4Label: UILabel!
    @IBOutlet weak var ingredient5Label: UILabel!
    @IBOutlet weak var ingredient6Label: UILabel!
    @IBOutlet weak var ingredient7Label: UILabel!
    @IBOutlet weak var ingredient8Label: UILabel!
    @IBOutlet weak var measure1Label: UILabel!
    @IBOutlet weak var measure2Label: UILabel!
    @IBOutlet weak var measure3Label: UILabel!
    @IBOutlet weak var measure4Label: UILabel!
    @IBOutlet weak var measure5Label: UILabel!
    @IBOutlet weak var measure6Label: UILabel!
    @IBOutlet weak var measure7Label: UILabel!
    @IBOutlet weak var measure8Label: UILabel!
    
    
    var detailMealArray: [DetailMealInformation] = []
    var mealForCategory: MealsInCategory? = nil
    var detailMeal: DetailMealInformation? = nil

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailMealRequest()
        
        self.title = self.mealForCategory?.strMeal
        self.instructionsLabel.text = self.detailMeal?.strInstructions
        if let mealImage = self.detailMeal?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        self.ingredient1Label.text = self.detailMeal?.strIngredient1
        self.ingredient2Label.text = self.detailMeal?.strIngredient2
        self.ingredient3Label.text = self.detailMeal?.strIngredient3
        self.ingredient4Label.text = self.detailMeal?.strIngredient4
        self.ingredient5Label.text = self.detailMeal?.strIngredient5
        self.ingredient6Label.text = self.detailMeal?.strIngredient6
        self.ingredient7Label.text = self.detailMeal?.strIngredient7
        self.ingredient8Label.text = self.detailMeal?.strIngredient8
        self.measure1Label.text = self.detailMeal?.strMeasure1
        self.measure2Label.text = self.detailMeal?.strMeasure2
        self.measure3Label.text = self.detailMeal?.strMeasure3
        self.measure4Label.text = self.detailMeal?.strMeasure4
        self.measure5Label.text = self.detailMeal?.strMeasure5
        self.measure6Label.text = self.detailMeal?.strMeasure6
        self.measure7Label.text = self.detailMeal?.strMeasure7
        self.measure8Label.text = self.detailMeal?.strMeasure8
        
    }
    func detailMealRequest(){

        if let mealID = mealForCategory?.idMeal{
            let stringID = String(describing : mealID)
            let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(stringID)"

            AF.request(url).responseJSON { responce in

                let decoder = JSONDecoder()

                if let data = try? decoder.decode(Meal.self, from: responce.data!) {
                    self.detailMealArray = data.meal ?? []
                }
            }
        }
    }
}
