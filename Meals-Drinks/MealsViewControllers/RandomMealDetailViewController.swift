//
//  MealDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 10.08.2021.
//

import Foundation
import UIKit
import SDWebImage
import youtube_ios_player_helper
import RealmSwift
import SafariServices

class RandomMealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    let realm = try? Realm()
    var meals: MealInformation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let video = self.meals?.strYoutube {
            self.requestVideos()
        }
        
        if let mealImage = self.meals?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        
        self.title = self.meals?.mealName
        self.instructionsLabel.text = self.meals?.strInstructions
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
    }
    
    func requestVideos (){
        
        var baseUrl = self.meals?.strYoutube
        if let range = baseUrl!.range(of: "=") {
            let id = baseUrl![range.upperBound...]
            self.videoPlayer.load(withVideoId: String(id))
        }
    }
    
    @objc func addToCookLaterButtonPressed(){
        
        let mealsRealm = MealsRealm()
        mealsRealm.idMeal = self.meals?.idMeal ?? ""
        mealsRealm.mealName = self.meals?.mealName ?? ""
        mealsRealm.mealCategory = self.meals?.mealCategory ?? ""
        mealsRealm.strInstructions = self.meals?.strInstructions ?? ""
        mealsRealm.strMealThumb = self.meals?.strMealThumb ?? ""
        mealsRealm.strYoutube = self.meals?.strYoutube ?? ""
        mealsRealm.strSource = self.meals?.strSource ?? ""
        
        try? realm?.write {
            realm?.add(mealsRealm)
        }
    }
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        if let optionalStringURL = self.meals?.strSource{
            let stringUrl = String(describing: optionalStringURL)
            let url = URL(string: stringUrl)!
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}
