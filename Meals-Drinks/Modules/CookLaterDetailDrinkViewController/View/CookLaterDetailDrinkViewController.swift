//
//  CookLaterDetailDrinkViewController.swift
//  Meals-Drinks
//
//  Created by admin on 20.08.2021.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices

class CookLaterDetailDrinkViewController: UIViewController {
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var viewModel: CookLaterDetailDrinkViewModel = CookLaterDetailDrinkViewModel()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           self.navigationController?.isNavigationBarHidden = false

       }
    
    //MARK: - Methods
    
    func setupUI() {
        
        if let drinkImageView = self.viewModel.drink?.strDrinkThumb {
            self.drinkImageView.sd_setImage(with: URL(string: drinkImageView), completed: nil)
        }
        self.title = self.viewModel.drink?.strDrink
        self.instructionsLabel.text = self.viewModel.drink?.strInstructions
        createIngredientsList()
    }
        
    
    func addIngredients(measure: String?, ingredient: String?){
            guard measure != nil else {return}
            ingredientsTextView.text += measure!
            guard ingredient != nil else {return}
            ingredientsTextView.text += " \(ingredient!)\n"
        }
        
        func createIngredientsList(){
            ingredientsTextView.text = ""
            addIngredients(measure: viewModel.drink?.strMeasure1, ingredient: viewModel.drink?.strIngredient1)
            addIngredients(measure: viewModel.drink?.strMeasure2, ingredient: viewModel.drink?.strIngredient2)
            addIngredients(measure: viewModel.drink?.strMeasure3, ingredient: viewModel.drink?.strIngredient3)
            addIngredients(measure: viewModel.drink?.strMeasure4, ingredient: viewModel.drink?.strIngredient4)
            addIngredients(measure: viewModel.drink?.strMeasure5, ingredient: viewModel.drink?.strIngredient5)
            addIngredients(measure: viewModel.drink?.strMeasure6, ingredient: viewModel.drink?.strIngredient6)
            addIngredients(measure: viewModel.drink?.strMeasure7, ingredient: viewModel.drink?.strIngredient7)
            addIngredients(measure: viewModel.drink?.strMeasure8, ingredient: viewModel.drink?.strIngredient8)
            addIngredients(measure: viewModel.drink?.strMeasure9, ingredient: viewModel.drink?.strIngredient9)
            addIngredients(measure: viewModel.drink?.strMeasure10, ingredient: viewModel.drink?.strIngredient10)
            addIngredients(measure: viewModel.drink?.strMeasure11, ingredient: viewModel.drink?.strIngredient11)
            addIngredients(measure: viewModel.drink?.strMeasure12, ingredient: viewModel.drink?.strIngredient12)
            addIngredients(measure: viewModel.drink?.strMeasure13, ingredient: viewModel.drink?.strIngredient13)
            addIngredients(measure: viewModel.drink?.strMeasure14, ingredient: viewModel.drink?.strIngredient14)
            addIngredients(measure: viewModel.drink?.strMeasure15, ingredient: viewModel.drink?.strIngredient15)
            if ingredientsTextView.text != "" {
                ingredientsTextView.text.removeLast()
            }
        }
    
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        let url = URL(string: Constants.drinkNetwork.iBAUrl)!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}
