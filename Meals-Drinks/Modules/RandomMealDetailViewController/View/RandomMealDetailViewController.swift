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
import SafariServices

class RandomMealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var videoPlayer: YTPlayerView!
    
    var viewModel: RandomMealDetailViewModel = RandomMealDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let video = self.viewModel.randomMeal?.strYoutube {
            self.requestVideos()
        }
        
        if let mealImage = self.viewModel.randomMeal?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        
        self.title = self.viewModel.randomMeal?.mealName
        self.instructionsLabel.text = self.viewModel.randomMeal?.strInstructions
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         
         self.navigationController?.isNavigationBarHidden = false

     }
    
    func requestVideos (){
        
        let baseUrl = self.viewModel.randomMeal?.strYoutube
        if let range = baseUrl!.range(of: "=") {
            let id = baseUrl![range.upperBound...]
            self.videoPlayer.load(withVideoId: String(id))
        }
    }
    @objc func addToCookLaterButtonPressed(){

        self.viewModel.saveMealRealm(self.viewModel.randomMeal, completion: {

            let alert = UIAlertController(title: Constants.ui.mealSavedMessage,
                                          message: nil,
                                          preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: Constants.ui.okMealMessage,
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        if let optionalStringURL = self.viewModel.randomMeal?.strSource{
            let stringUrl = String(describing: optionalStringURL)
            let url = URL(string: stringUrl)!
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}

