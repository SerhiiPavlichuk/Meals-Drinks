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
    
    var detailMeal: DetailMealInformation? = nil
    var mealForCategory: MealsInCategory? = nil
    let realm = try? Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MealsNetworkManager.shared.detailMealRequest(mealId: mealForCategory, completion: {
            detailMeal in
            let dataArray = detailMeal ?? []
            let detailMealResponce = dataArray.first
            
            self.displayMealDetailInformation(detailMealResponce)
            self.detailMeal = detailMealResponce
        })
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
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
    
    @objc func addToCookLaterButtonPressed(){
        
        let mealsRealm = MealsRealm()
        mealsRealm.idMeal = self.detailMeal?.idMeal ?? ""
        mealsRealm.mealName = self.detailMeal?.mealName ?? ""
        mealsRealm.mealCategory = self.detailMeal?.mealCategory ?? ""
        mealsRealm.strInstructions = self.detailMeal?.strInstructions ?? ""
        mealsRealm.strMealThumb = self.detailMeal?.strMealThumb ?? ""
        mealsRealm.strYoutube = self.detailMeal?.strYoutube ?? ""
        mealsRealm.strSource = self.detailMeal?.strSource ?? ""
        
        try? realm?.write {
            realm?.add(mealsRealm)
        }
    }
}
