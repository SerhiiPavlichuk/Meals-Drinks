//
//  CoockLaterDetailMealViewController.swift
//  Meals-Drinks
//
//  Created by admin on 20.08.2021.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices
import youtube_ios_player_helper

class CoockLaterDetailMealViewController: UIViewController {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    var viewModel: CoockLaterDetailMealViewModel = CoockLaterDetailMealViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let video = self.viewModel.meal?.strYoutube {
            self.requestVideos()
        }
        
        if let mealImage = self.viewModel.meal?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        self.title = self.viewModel.meal?.mealName
        self.instructionsLabel.text = self.viewModel.meal?.strInstructions
    }
    
    func requestVideos (){
        
        var baseUrl = self.viewModel.meal?.strYoutube
        if let range = baseUrl!.range(of: "=") {
            let id = baseUrl![range.upperBound...]
            self.videoPlayer.load(withVideoId: String(id))
        }
    }
    
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        if let optionalStringURL = self.viewModel.meal?.strSource{
            let stringUrl = String(describing: optionalStringURL)
            let url = URL(string: stringUrl)!
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
}
