//
//  CookDrinkLaterViewController.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import Foundation
import UIKit
import RealmSwift

class CookDrinkLaterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try? Realm()
    var drink: [DrinksRealm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.drink = self.getDrinks()
        self.tableView.reloadData()
    }
    
    func getDrinks() -> [DrinksRealm] {
        
        var drinks = [DrinksRealm]()
        guard let drinksResult = realm?.objects(DrinksRealm.self) else { return [] }
        for drink in drinksResult {
            drinks.append(drink)
        }
        return drinks
    }
}

extension CookDrinkLaterViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = self.drink[indexPath.row].strDrink
        
        return cell ?? UITableViewCell()
    }
}

extension CookDrinkLaterViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let item = drink[indexPath.row]
            tableView.beginUpdates()
            drink.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            let realm = try! Realm()
            try! realm.write {
                realm.delete(item)
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: CoockLaterDetailDrinkViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? CoockLaterDetailDrinkViewController {
            
            detailViewController.drink = self.drink[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

