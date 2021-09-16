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
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    
    var viewModel: CoockLaterDetailMealViewModel = CoockLaterDetailMealViewModel()
    
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
    
    func setupUI() {
        
        if let mealImage = self.viewModel.meal?.strMealThumb {
            self.mealImageView.sd_setImage(with: URL(string: mealImage), completed: nil)
        }
        self.title = self.viewModel.meal?.mealName
        self.instructionsLabel.text = self.viewModel.meal?.strInstructions
    }
    
    func requestVideos () {
        
        guard self.viewModel.meal?.strYoutube != nil else { return }
        let baseUrl = self.viewModel.meal?.strYoutube
        if let range = baseUrl!.range(of: "=") {
            let id = baseUrl![range.upperBound...]
            self.videoPlayer.load(withVideoId: String(id))
        }
    }
    
    func addIngredients(measure: String?, ingredient: String?) {
        guard measure != nil else {return}
        ingredientsTextView.text += measure!
        guard ingredient != nil else {return}
        ingredientsTextView.text += " \(ingredient!)\n"
    }
    
    func createIngredientsList() {
        ingredientsTextView.text = ""
        addIngredients(measure: viewModel.meal?.strMeasure1, ingredient: viewModel.meal?.strIngredient1)
        addIngredients(measure: viewModel.meal?.strMeasure2, ingredient: viewModel.meal?.strIngredient2)
        addIngredients(measure: viewModel.meal?.strMeasure3, ingredient: viewModel.meal?.strIngredient3)
        addIngredients(measure: viewModel.meal?.strMeasure4, ingredient: viewModel.meal?.strIngredient4)
        addIngredients(measure: viewModel.meal?.strMeasure5, ingredient: viewModel.meal?.strIngredient5)
        addIngredients(measure: viewModel.meal?.strMeasure6, ingredient: viewModel.meal?.strIngredient6)
        addIngredients(measure: viewModel.meal?.strMeasure7, ingredient: viewModel.meal?.strIngredient7)
        addIngredients(measure: viewModel.meal?.strMeasure8, ingredient: viewModel.meal?.strIngredient8)
        addIngredients(measure: viewModel.meal?.strMeasure9, ingredient: viewModel.meal?.strIngredient9)
        addIngredients(measure: viewModel.meal?.strMeasure10, ingredient: viewModel.meal?.strIngredient10)
        addIngredients(measure: viewModel.meal?.strMeasure11, ingredient: viewModel.meal?.strIngredient11)
        addIngredients(measure: viewModel.meal?.strMeasure12, ingredient: viewModel.meal?.strIngredient12)
        addIngredients(measure: viewModel.meal?.strMeasure13, ingredient: viewModel.meal?.strIngredient13)
        addIngredients(measure: viewModel.meal?.strMeasure14, ingredient: viewModel.meal?.strIngredient14)
        addIngredients(measure: viewModel.meal?.strMeasure15, ingredient: viewModel.meal?.strIngredient15)
        if ingredientsTextView.text != "" {
            ingredientsTextView.text.removeLast()
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
