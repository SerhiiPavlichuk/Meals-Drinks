//
//  DetailMealFromSearchByIngredient.swift
//  Meals-Drinks
//
//  Created by admin on 01.09.2021.
//

import Foundation
import UIKit
import youtube_ios_player_helper
import SDWebImage
import SafariServices

class DetailMealFromSearchByIngredient: UIViewController {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    var viewModel: DetailMealFromSearchByIngredientViewModel = DetailMealFromSearchByIngredientViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.loadDetailMeal(completion: {
            self.displayMealDetailInformation()
        })
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
    }
    
    func displayMealDetailInformation() {
        
        self.title = self.viewModel.mealsByIngredients?.strMeal
        self.instructionsLabel.text = self.viewModel.detailMeal?.strInstructions
        if let mealImage = self.viewModel.detailMeal?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        if let videoURL = self.viewModel.detailMeal?.strYoutube {
            self.requestVideos(with: videoURL)
        }
    }
    
    func requestVideos(with url: String?) {
        guard let url = url else {
            return
        }
        if let range = url.range(of: "=") {
            let id = url[range.upperBound...]
            self.videoPlayer.load(withVideoId: String(id))
        }
    }
    
    @IBAction func loadSiteInSafaryButtonPressed(_ sender: Any) {
        if let optionalStringURL = self.viewModel.detailMeal?.strSource {
            let stringUrl = String(describing: optionalStringURL)
            let url = URL(string: stringUrl)!
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    @objc func addToCookLaterButtonPressed(){
        
        self.viewModel.saveDetailMealRealm(self.viewModel.detailMeal, completion: {
            
            let alert = UIAlertController(title: Constants.ui.mealSavedMessage,
                                          message: nil,
                                          preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: Constants.ui.okMealMessage,
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
}
