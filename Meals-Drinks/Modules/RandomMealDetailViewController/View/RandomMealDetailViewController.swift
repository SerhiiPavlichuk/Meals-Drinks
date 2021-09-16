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
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    
    var viewModel: RandomMealDetailViewModel = RandomMealDetailViewModel()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestVideos()
        setupUI()
        createIngredientsList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    //MARK: - Methods
    
    func setupUI(){
        
        if let mealImage = self.viewModel.randomMeal?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        
        self.title = self.viewModel.randomMeal?.mealName
        self.instructionsLabel.text = self.viewModel.randomMeal?.strInstructions
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
        
    }
    
    func requestVideos (){
        guard self.viewModel.randomMeal?.strYoutube != nil else { return }
        let baseUrl = self.viewModel.randomMeal?.strYoutube
        if let range = baseUrl!.range(of: "=") {
            let id = baseUrl![range.upperBound...]
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
        addIngredients(measure: viewModel.randomMeal?.strMeasure1, ingredient: viewModel.randomMeal?.strIngredient1)
        addIngredients(measure: viewModel.randomMeal?.strMeasure2, ingredient: viewModel.randomMeal?.strIngredient2)
        addIngredients(measure: viewModel.randomMeal?.strMeasure3, ingredient: viewModel.randomMeal?.strIngredient3)
        addIngredients(measure: viewModel.randomMeal?.strMeasure4, ingredient: viewModel.randomMeal?.strIngredient4)
        addIngredients(measure: viewModel.randomMeal?.strMeasure5, ingredient: viewModel.randomMeal?.strIngredient5)
        addIngredients(measure: viewModel.randomMeal?.strMeasure6, ingredient: viewModel.randomMeal?.strIngredient6)
        addIngredients(measure: viewModel.randomMeal?.strMeasure7, ingredient: viewModel.randomMeal?.strIngredient7)
        addIngredients(measure: viewModel.randomMeal?.strMeasure8, ingredient: viewModel.randomMeal?.strIngredient8)
        addIngredients(measure: viewModel.randomMeal?.strMeasure9, ingredient: viewModel.randomMeal?.strIngredient9)
        addIngredients(measure: viewModel.randomMeal?.strMeasure10, ingredient: viewModel.randomMeal?.strIngredient10)
        addIngredients(measure: viewModel.randomMeal?.strMeasure11, ingredient: viewModel.randomMeal?.strIngredient11)
        addIngredients(measure: viewModel.randomMeal?.strMeasure12, ingredient: viewModel.randomMeal?.strIngredient12)
        addIngredients(measure: viewModel.randomMeal?.strMeasure13, ingredient: viewModel.randomMeal?.strIngredient13)
        addIngredients(measure: viewModel.randomMeal?.strMeasure14, ingredient: viewModel.randomMeal?.strIngredient14)
        addIngredients(measure: viewModel.randomMeal?.strMeasure15, ingredient: viewModel.randomMeal?.strIngredient15)
        if ingredientsTextView.text != "" {
            ingredientsTextView.text.removeLast()
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

