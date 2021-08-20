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
import SafariServices
import RealmSwift

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    var detailMealArray: [DetailMealInformation] = []
    var detailMeal: DetailMealInformation? = nil
    var mealForCategory: MealsInCategory? = nil
    let realm = try? Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MealsNetworkManager.shared.detailMealRequest(mealId: mealForCategory, completion: {
            detailMeal in
            self.detailMealArray = detailMeal ?? []
            let dataArray = detailMeal ?? []
            self.displayMealDetailInformation(dataArray.first)
        })
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
    }
    
    func displayMealDetailInformation(_ meal: DetailMealInformation?) {
        
        self.title = self.mealForCategory?.strMeal
        self.instructionsLabel.text = meal?.strInstructions
        if let mealImage = meal?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        if let videoURL = meal?.strYoutube {
            self.requestVideos(with: videoURL)
        }
    }
    
    func requestVideos(with url: String?) {
        guard let url = url else {
            print("Meal youtube video url is empty")
            return
        }
        if let range = url.range(of: "=") {
            let id = url[range.upperBound...]
            self.videoPlayer.load(withVideoId: String(id))
        }
    }
    // MARK:- detailMeal? сайт не открывается потому что detailMeal is nil.
    
    @IBAction func loadSiteInSafaryButtonPressed(_ sender: Any) {
        if let optionalStringURL = self.detailMeal?.strSource {
            let stringUrl = String(describing: optionalStringURL)
            let url = URL(string: stringUrl)!
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    // MARK:- detailMeal? реалм не сохраняется не корректно
    
    @objc func addToCookLaterButtonPressed(){
        
        let mealsRealm = MealsRealm()
        mealsRealm.idMeal = self.detailMeal?.idMeal ?? ""
        mealsRealm.mealName = self.detailMeal?.strMeal ?? ""
        mealsRealm.mealCategory = self.detailMeal?.strCategory ?? ""
        mealsRealm.strInstructions = self.detailMeal?.strInstructions ?? ""
        mealsRealm.strMealThumb = self.detailMeal?.strMealThumb ?? ""
        mealsRealm.strYoutube = self.detailMeal?.strYoutube ?? ""
        mealsRealm.strSource = self.detailMeal?.strSource ?? ""
        
        try? realm?.write {
            realm?.add(mealsRealm)
        }
    }
    
    
    
    
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
