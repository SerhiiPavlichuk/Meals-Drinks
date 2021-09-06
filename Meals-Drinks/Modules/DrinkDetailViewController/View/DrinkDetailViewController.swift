//
//  DrinkDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 21.08.2021.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices

class DrinkDetailViewController: UIViewController {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var viewModel: DrinkDetailViewModel = DrinkDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.loadDetailDrink(completion: {
            
            self.displayDrinkDetailInformation()
            self.createIngredientsList()
        })
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    func displayDrinkDetailInformation() {
        
        self.title = self.viewModel.drinkInCategory?.strDrink
        self.instructionsLabel.text = viewModel.detailDrink?.strInstructions
        if let drinkImage = viewModel.detailDrink?.strDrinkThumb {
            self.drinkImageView.sd_setImage(with: URL(string: drinkImage), completed: nil)
            
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
        addIngredients(measure: viewModel.detailDrink?.strMeasure1, ingredient: viewModel.detailDrink?.strIngredient1)
        addIngredients(measure: viewModel.detailDrink?.strMeasure2, ingredient: viewModel.detailDrink?.strIngredient2)
        addIngredients(measure: viewModel.detailDrink?.strMeasure3, ingredient: viewModel.detailDrink?.strIngredient3)
        addIngredients(measure: viewModel.detailDrink?.strMeasure4, ingredient: viewModel.detailDrink?.strIngredient4)
        addIngredients(measure: viewModel.detailDrink?.strMeasure5, ingredient: viewModel.detailDrink?.strIngredient5)
        addIngredients(measure: viewModel.detailDrink?.strMeasure6, ingredient: viewModel.detailDrink?.strIngredient6)
        addIngredients(measure: viewModel.detailDrink?.strMeasure7, ingredient: viewModel.detailDrink?.strIngredient7)
        addIngredients(measure: viewModel.detailDrink?.strMeasure8, ingredient: viewModel.detailDrink?.strIngredient8)
        addIngredients(measure: viewModel.detailDrink?.strMeasure9, ingredient: viewModel.detailDrink?.strIngredient9)
        addIngredients(measure: viewModel.detailDrink?.strMeasure10, ingredient: viewModel.detailDrink?.strIngredient10)
        addIngredients(measure: viewModel.detailDrink?.strMeasure11, ingredient: viewModel.detailDrink?.strIngredient11)
        addIngredients(measure: viewModel.detailDrink?.strMeasure12, ingredient: viewModel.detailDrink?.strIngredient12)
        addIngredients(measure: viewModel.detailDrink?.strMeasure13, ingredient: viewModel.detailDrink?.strIngredient13)
        addIngredients(measure: viewModel.detailDrink?.strMeasure14, ingredient: viewModel.detailDrink?.strIngredient14)
        addIngredients(measure: viewModel.detailDrink?.strMeasure15, ingredient: viewModel.detailDrink?.strIngredient15)
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
    
    @objc func addToCookLaterButtonPressed(){
        
        self.viewModel.saveDetailDrinkRealm(self.viewModel.detailDrink, completion: {
            
            let alert = UIAlertController(title: Constants.ui.drinkSavedMessage,
                                          message: nil,
                                          preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: Constants.ui.okDrinkMessage,
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
}
