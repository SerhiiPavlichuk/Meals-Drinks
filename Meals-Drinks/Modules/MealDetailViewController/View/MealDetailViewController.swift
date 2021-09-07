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

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var videoPlayer: YTPlayerView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var viewModel: MealDetailViewModel = MealDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.loadDetailMeal(completion: {
            self.displayMealDetailInformation()
            self.createIngredientsList()
        })
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           self.navigationController?.isNavigationBarHidden = false

       }
    
    func displayMealDetailInformation() {
        
        self.title = self.viewModel.mealForCategory?.strMeal
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
    
    func addIngredients(measure: String?, ingredient: String?){
           guard measure != nil else {return}
           ingredientsTextView.text += measure!
           guard ingredient != nil else {return}
           ingredientsTextView.text += " \(ingredient!)\n"
       }

       func createIngredientsList(){
           ingredientsTextView.text = ""
           addIngredients(measure: viewModel.detailMeal?.strMeasure1, ingredient: viewModel.detailMeal?.strIngredient1)
           addIngredients(measure: viewModel.detailMeal?.strMeasure2, ingredient: viewModel.detailMeal?.strIngredient2)
           addIngredients(measure: viewModel.detailMeal?.strMeasure3, ingredient: viewModel.detailMeal?.strIngredient3)
           addIngredients(measure: viewModel.detailMeal?.strMeasure4, ingredient: viewModel.detailMeal?.strIngredient4)
           addIngredients(measure: viewModel.detailMeal?.strMeasure5, ingredient: viewModel.detailMeal?.strIngredient5)
           addIngredients(measure: viewModel.detailMeal?.strMeasure6, ingredient: viewModel.detailMeal?.strIngredient6)
           addIngredients(measure: viewModel.detailMeal?.strMeasure7, ingredient: viewModel.detailMeal?.strIngredient7)
           addIngredients(measure: viewModel.detailMeal?.strMeasure8, ingredient: viewModel.detailMeal?.strIngredient8)
           addIngredients(measure: viewModel.detailMeal?.strMeasure9, ingredient: viewModel.detailMeal?.strIngredient9)
           addIngredients(measure: viewModel.detailMeal?.strMeasure10, ingredient: viewModel.detailMeal?.strIngredient10)
           addIngredients(measure: viewModel.detailMeal?.strMeasure11, ingredient: viewModel.detailMeal?.strIngredient11)
           addIngredients(measure: viewModel.detailMeal?.strMeasure12, ingredient: viewModel.detailMeal?.strIngredient12)
           addIngredients(measure: viewModel.detailMeal?.strMeasure13, ingredient: viewModel.detailMeal?.strIngredient13)
           addIngredients(measure: viewModel.detailMeal?.strMeasure14, ingredient: viewModel.detailMeal?.strIngredient14)
           addIngredients(measure: viewModel.detailMeal?.strMeasure15, ingredient: viewModel.detailMeal?.strIngredient15)
           if ingredientsTextView.text != "" {
               ingredientsTextView.text.removeLast()
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
