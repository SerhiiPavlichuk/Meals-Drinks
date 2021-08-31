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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let drinkImageView = self.viewModel.drink?.strDrinkThumb {
            self.drinkImageView.sd_setImage(with: URL(string: drinkImageView), completed: nil)
        }
        self.title = self.viewModel.drink?.strDrink
        self.instructionsLabel.text = self.viewModel.drink?.strInstructions
    }
    
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        let url = URL(string: Constants.drinkNetwork.iBAUrl)!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}
