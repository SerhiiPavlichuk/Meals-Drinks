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
import RealmSwift

class DrinkDetailViewController: UIViewController {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var instructionsLabel: UILabel!
    
        var detailDrink: DetailDrinkInformation? = nil
        var drinkInCategory: DrinksInCategory? = nil
        let realm = try? Realm()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            DrinksNetworkManager.shared.detailDrinkRequest(drinkId: drinkInCategory, completion: {
                detailDrink in
                let dataArray = detailDrink ?? []
                let detailDrinkResponce = dataArray.first
                
                self.displayDrinkDetailInformation(detailDrinkResponce)
                self.detailDrink = detailDrinkResponce
            })
            
            let addToCookLaterButtonPressed = UIBarButtonItem(title: Constants.RandomDetailViewControllerBarButtonItem, style: .done, target: self, action: #selector(addToCookLaterButtonPressed))
            self.navigationItem.rightBarButtonItem = addToCookLaterButtonPressed
        }
        
        func displayDrinkDetailInformation(_ drink: DetailDrinkInformation?) {
            
            self.title = self.drinkInCategory?.strDrink
            self.instructionsLabel.text = drink?.strInstructions
            if let drinkImage = drink?.strDrinkThumb {
                self.drinkImageView.sd_setImage(with: URL(string: drinkImage), completed: nil)
            }
        }

    @IBAction func loadSiteInSafariButtonPressed(_ sender: Any) {
        
        let url = URL(string: "https://iba-world.com/")!
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
        
        @objc func addToCookLaterButtonPressed(){
            
            let drinksRealm = DrinksRealm()
            drinksRealm.idDrink = self.detailDrink?.idDrink ?? ""
            drinksRealm.strDrink = self.detailDrink?.strDrink ?? ""
            drinksRealm.strCategory = self.detailDrink?.strCategory ?? ""
            drinksRealm.strInstructions = self.detailDrink?.strInstructions ?? ""
            drinksRealm.strDrinkThumb = self.detailDrink?.strDrinkThumb ?? ""
            drinksRealm.strGlass = self.detailDrink?.strGlass ?? ""
            
            try? realm?.write {
                realm?.add(drinksRealm)
            }
        }
    }
