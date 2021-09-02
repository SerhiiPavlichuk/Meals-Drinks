//
//  DetailDrinkFromSearchByIngredient.swift
//  Meals-Drinks
//
//  Created by admin on 01.09.2021.
//

import Foundation
import UIKit
import SDWebImage
import SafariServices


class DetailDrinkFromSearchByIngredientViewController: UIViewController {
    
        @IBOutlet weak var drinkImageView: UIImageView!
        @IBOutlet weak var ingredientsTextView: UITextView!
        @IBOutlet weak var instructionsLabel: UILabel!
        
        var viewModel: DetailDrinkFromSearchByIngredientViewModel = DetailDrinkFromSearchByIngredientViewModel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.viewModel.loadDetailDrink(completion: {
                
                self.displayDrinkDetailInformation()
                
                var text = ""
                
                for i in 1...10 {
                    text += self.viewModel.detailDrink?.strIngredient1 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient2 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient3 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient4 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient5 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient6 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient7 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient8 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient9 ?? "" + "\n"
                    text += self.viewModel.detailDrink?.strIngredient10 ?? "" + "\n"
                    
                    self.ingredientsTextView.text = text
                }
            })
            
            let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
            self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
        }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           self.navigationController?.isNavigationBarHidden = false

       }
        
        func displayDrinkDetailInformation() {
            
            self.title = self.viewModel.drinks?.strDrink
            self.instructionsLabel.text = viewModel.detailDrink?.strInstructions
            if let drinkImage = viewModel.detailDrink?.strDrinkThumb {
                self.drinkImageView.sd_setImage(with: URL(string: drinkImage), completed: nil)
                
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
