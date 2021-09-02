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
        
        var text = ""
        for i in 1...10 {
            text += viewModel.randomDrink?.strIngredient1 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient2 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient3 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient4 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient5 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient6 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient7 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient8 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient9 ?? "" + "\n"
            text += viewModel.randomDrink?.strIngredient10 ?? "" + "\n"
            
            self.ingredientsTextView.text = text
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           self.navigationController?.isNavigationBarHidden = false

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

