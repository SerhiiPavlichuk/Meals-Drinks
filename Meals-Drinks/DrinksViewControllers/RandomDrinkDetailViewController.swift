//
//  RandomDrinkDetailViewController.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import Foundation
import UIKit
import SDWebImage
import RealmSwift
import SafariServices

class RandomDrinkDetailViewController: UIViewController {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    var drink : RandomDrinks? = nil
    let realm = try? Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let drinkImage = self.drink?.strDrinkThumb {
            self.drinkImageView.sd_setImage(with: URL(string: drinkImage), completed: nil)
        }
        self.title = self.drink?.strDrink
        self.instructionsLabel.text = self.drink?.strInstructions
        
        let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.ui.RandomDrinkDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
        self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
        
        var text = ""
        for i in 1...10 {
            text += drink?.strIngredient1 ?? "" + "\n"
            text += drink?.strIngredient2 ?? "" + "\n"
            text += drink?.strIngredient3 ?? "" + "\n"
            text += drink?.strIngredient4 ?? "" + "\n"
            text += drink?.strIngredient5 ?? "" + "\n"
            text += drink?.strIngredient6 ?? "" + "\n"
            text += drink?.strIngredient7 ?? "" + "\n"
            text += drink?.strIngredient8 ?? "" + "\n"
            text += drink?.strIngredient9 ?? "" + "\n"
            text += drink?.strIngredient10 ?? "" + "\n"
            
            self.ingredientsTextView.text = text
        }
    }
    
    @objc func addToCookLaterButtonPressed(){
        
        let drinksRealm = DrinksRealm()
        drinksRealm.idDrink = self.drink?.idDrink ?? ""
        drinksRealm.strDrink = self.drink?.strDrink ?? ""
        drinksRealm.strCategory = self.drink?.strCategory ?? ""
        drinksRealm.strInstructions = self.drink?.strInstructions ?? ""
        drinksRealm.strDrinkThumb = self.drink?.strDrinkThumb ?? ""
        drinksRealm.strGlass = self.drink?.strGlass ?? ""
        
        try? realm?.write {
            realm?.add(drinksRealm)
        }
    }
    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        let url = URL(string: "https://iba-world.com/")!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}

