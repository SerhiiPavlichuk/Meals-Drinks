//
//  RandomDrinkDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices

class RandomDrinkDetailViewController: UIViewController {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var viewModel: RandomDrinkDetailViewModel = RandomDrinkDetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let drinkImage = self.viewModel.randomDrink?.strDrinkThumb {
            self.drinkImageView.sd_setImage(with: URL(string: drinkImage), completed: nil)
        }
        self.title = self.viewModel.randomDrink?.strDrink
        self.instructionsLabel.text = self.viewModel.randomDrink?.strInstructions
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDrinkDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
        
        createIngredientsList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    func addIngredients(measure: String?, ingredient: String?){
        guard measure != nil else {return}
        ingredientsTextView.text += measure!
        guard ingredient != nil else {return}
        ingredientsTextView.text += " \(ingredient!)\n"
    }
    
    func createIngredientsList(){
        ingredientsTextView.text = ""
        addIngredients(measure: viewModel.randomDrink?.strMeasure1, ingredient: viewModel.randomDrink?.strIngredient1)
        addIngredients(measure: viewModel.randomDrink?.strMeasure2, ingredient: viewModel.randomDrink?.strIngredient2)
        addIngredients(measure: viewModel.randomDrink?.strMeasure3, ingredient: viewModel.randomDrink?.strIngredient3)
        addIngredients(measure: viewModel.randomDrink?.strMeasure4, ingredient: viewModel.randomDrink?.strIngredient4)
        addIngredients(measure: viewModel.randomDrink?.strMeasure5, ingredient: viewModel.randomDrink?.strIngredient5)
        addIngredients(measure: viewModel.randomDrink?.strMeasure6, ingredient: viewModel.randomDrink?.strIngredient6)
        addIngredients(measure: viewModel.randomDrink?.strMeasure7, ingredient: viewModel.randomDrink?.strIngredient7)
        addIngredients(measure: viewModel.randomDrink?.strMeasure8, ingredient: viewModel.randomDrink?.strIngredient8)
        addIngredients(measure: viewModel.randomDrink?.strMeasure9, ingredient: viewModel.randomDrink?.strIngredient9)
        addIngredients(measure: viewModel.randomDrink?.strMeasure10, ingredient: viewModel.randomDrink?.strIngredient10)
        addIngredients(measure: viewModel.randomDrink?.strMeasure11, ingredient: viewModel.randomDrink?.strIngredient11)
        addIngredients(measure: viewModel.randomDrink?.strMeasure12, ingredient: viewModel.randomDrink?.strIngredient12)
        addIngredients(measure: viewModel.randomDrink?.strMeasure13, ingredient: viewModel.randomDrink?.strIngredient13)
        addIngredients(measure: viewModel.randomDrink?.strMeasure14, ingredient: viewModel.randomDrink?.strIngredient14)
        addIngredients(measure: viewModel.randomDrink?.strMeasure15, ingredient: viewModel.randomDrink?.strIngredient15)
        if ingredientsTextView.text != "" {
            ingredientsTextView.text.removeLast()
        }
    }
    
    @objc func addToCookLaterButtonPressed(){
        
        self.viewModel.saveDrinkRealm(self.viewModel.randomDrink, completion: {
            
            let alert = UIAlertController(title: Constants.ui.drinkSavedMessage,
                                          message: nil,
                                          preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: Constants.ui.okDrinkMessage,
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        let url = URL(string: Constants.drinkNetwork.iBAUrl)!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}

