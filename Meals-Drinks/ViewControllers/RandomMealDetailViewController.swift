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


class RandomMealDetailViewController: UIViewController {
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
    }
    
    func requestVideos (){
        
        var baseUrl = self.meals?.strYoutube
        if let range = baseUrl!.range(of: "=") {
            let id = baseUrl![range.upperBound...]
            self.videoPlayer.load(withVideoId: String(id))
        }
    }
}
