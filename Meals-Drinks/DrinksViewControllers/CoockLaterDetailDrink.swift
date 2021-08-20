//
//  CoockLaterDetailDrinkViewController.swift
//  Meals-Drinks
//
//  Created by admin on 20.08.2021.
//

import Foundation
import UIKit
import RealmSwift
import SDWebImage
import SafariServices

class CoockLaterDetailDrinkViewController: UIViewController {
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    let realm = try? Realm()
    var drink: DrinksRealm? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let drinkImageView = self.drink?.strDrinkThumb {
            self.drinkImageView.sd_setImage(with: URL(string: drinkImageView), completed: nil)
        }
        self.title = self.drink?.strDrink
        self.instructionsLabel.text = self.drink?.strInstructions
    }
    
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        let url = URL(string: "https://iba-world.com/")!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}
