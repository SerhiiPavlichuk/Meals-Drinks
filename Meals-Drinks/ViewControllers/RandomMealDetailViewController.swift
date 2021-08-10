//
//  MealDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 10.08.2021.
//

import UIKit
import SDWebImage
import AVKit


class RandomMealDetailViewController: UIViewController {
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var methodLabel: UILabel!
    
    
    
    var meals: MealInformation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //        if let mealVideo = self.meals?.strYoutube {
        //            self.videoPlayerView.load.
        //        }
        
        
        if let mealImage = self.meals?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        self.title = self.meals?.mealName
        self.methodLabel.text = self.meals?.strInstructions
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        if let mealVideo = self.meals?.strYoutube{
            guard let url = URL(string: mealVideo) else {
                return
            }
            
            let player = AVPlayer(url: url)
            
            let controller = AVPlayerViewController()
            controller.player = player
            present(controller, animated: true) {
                player.play()
            }
        }
    }
    
    
}

