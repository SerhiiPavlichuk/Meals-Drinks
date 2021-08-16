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


class RandomMealDetailViewController: UIViewController {
    
    let realm = try? Realm()
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    
    
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
        self.methodLabel.text = self.meals?.strInstructions
        let addToWatchLaterBarButtonItem = UIBarButtonItem(title: "Cook Later", style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToWatchLaterBarButtonItem
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
}
