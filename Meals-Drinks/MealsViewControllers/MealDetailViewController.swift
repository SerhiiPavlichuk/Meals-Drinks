//
//  MealDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 15.08.2021.
//

import Foundation
import UIKit
import youtube_ios_player_helper
import SDWebImage




class MealDetailViewController: UIViewController {
    
    var detailMealArray: [DetailMealInformation] = []
    var detailMeal: DetailMealInformation? = nil
    var mealForCategory: MealsInCategory? = nil
    
    
    
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
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        MealsNetworkManager.shared.detailMealRequest(mealId: mealForCategory, completion: {
             detailMeal in
            self.detailMealArray = detailMeal ?? []
            let dataArray = detailMeal ?? []
            self.displayMealDetailInformation(dataArray.first)
//            self.requestVideos(dataArray ??)
            
        })
//        self.displayMealDetailInformation()
    }


    func displayMealDetailInformation(_ meal: DetailMealInformation?) {

            self.title = self.mealForCategory?.strMeal
            self.instructionsLabel.text = meal?.strInstructions
            if let mealImage = meal?.strMealThumb {
                self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
            }
            self.ingredient1Label.text = meal?.strIngredient1
            self.ingredient2Label.text = meal?.strIngredient2
            self.ingredient3Label.text = meal?.strIngredient3
            self.ingredient4Label.text = meal?.strIngredient4
            self.ingredient5Label.text = meal?.strIngredient5
            self.ingredient6Label.text = meal?.strIngredient6
            self.ingredient7Label.text = meal?.strIngredient7
            self.ingredient8Label.text = meal?.strIngredient8
            self.measure1Label.text = meal?.strMeasure1
            self.measure2Label.text = meal?.strMeasure2
            self.measure3Label.text = meal?.strMeasure3
            self.measure4Label.text = meal?.strMeasure4
            self.measure5Label.text = meal?.strMeasure5
            self.measure6Label.text = meal?.strMeasure6
            self.measure7Label.text = meal?.strMeasure7
            self.measure8Label.text = meal?.strMeasure8
    }
//
//            if let videoURL = meal?.strYoutube {
//                self.requestVideos(with: videoURL)
//            }

        
//    func requestVideos(with url: String?) {
//          guard let url = url else {
//              print("Meal youtube video url is empty")
//              return
//          }
//          if let range = url.range(of: "=") {
//              let id = url[range.upperBound...]
//            self.videoPlayer.load(withVideoId: String(id))
//          }
//      }
  



//    func requestVideos (){
//
//        var baseUrl = self.meal?.strYoutube
//        if let range = baseUrl!.range(of: "=") {
//            let id = baseUrl![range.upperBound...]
//            self.videoPlayer.load(withVideoId: String(id))
//        }
//    }
//        func displayMealDetailInformation() {
//
//        self.title = self.mealForCategory?.strMeal
//        self.instructionsLabel.text = detailMeal?.strInstructions
//        if let mealImage = detailMeal?.strMealThumb {
//            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
//        }
//        self.ingredient1Label.text = detailMeal?.strIngredient1
//        self.ingredient2Label.text = detailMeal?.strIngredient2
//        self.ingredient3Label.text = detailMeal?.strIngredient3
//        self.ingredient4Label.text = detailMeal?.strIngredient4
//        self.ingredient5Label.text = detailMeal?.strIngredient5
//        self.ingredient6Label.text = detailMeal?.strIngredient6
//        self.ingredient7Label.text = detailMeal?.strIngredient7
//        self.ingredient8Label.text = detailMeal?.strIngredient8
//        self.measure1Label.text = detailMeal?.strMeasure1
//        self.measure2Label.text = detailMeal?.strMeasure2
//        self.measure3Label.text = detailMeal?.strMeasure3
//        self.measure4Label.text = detailMeal?.strMeasure4
//        self.measure5Label.text = detailMeal?.strMeasure5
//        self.measure6Label.text = detailMeal?.strMeasure6
//        self.measure7Label.text = detailMeal?.strMeasure7
//        self.measure8Label.text = detailMeal?.strMeasure8
//
//        }

}
