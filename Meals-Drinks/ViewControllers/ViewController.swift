//
//  ViewController.swift
//  Meals-Drinks
//
//  Created by admin on 09.08.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var randomMeals: [Meals] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        
        self.requestMealCategory()
        
    }
    
    func requestMealCategory() {

        let url = "https://www.themealdb.com/api/json/v2/api-key/randomselection.php"

        AF.request(url).responseJSON { responce in


            let decoder = JSONDecoder()

            if let data = try? decoder.decode(RandomMeals.self, from: responce.data!) {
                self.randomMeals = data.meals ?? []
                self.tableView.reloadData()

            }
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.randomMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
                   return UITableViewCell()
               }
        cell.textLabel?.text = self.randomMeals[indexPath.row].mealName
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    
}

