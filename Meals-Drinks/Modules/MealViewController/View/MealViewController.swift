//
//  ViewController.swift
//  Meals-Drinks
//
//  Created by admin on 09.08.2021.
//

import UIKit

class MealViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: MealViewModel = MealViewModel()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
        setupTableViewUI()
        
    }
    
    //MARK: - Methods
    
    
    func setupCollectionViewUI(){
        let categoryCollectionViewCellIdentifier = String(describing: CategoriesMealCollectionViewCell.self)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ui.defaultCellIdentifier)
        self.collectionView.register(UINib(nibName: categoryCollectionViewCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: categoryCollectionViewCellIdentifier)
        
        self.viewModel.loadCategories(completion: {
            self.collectionView.reloadData()
        })
        
    }
    func setupTableViewUI(){
        self.viewModel.loadRandomMeals(completion: {
            self.tableView.reloadData()
        })
    }
}

    //MARK: - Extensions


extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.randomMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ui.defaultCellIdentifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.viewModel.randomMeals[indexPath.row].mealName
        return cell
    }
}

extension MealViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: RandomMealDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? RandomMealDetailViewController {
            
            detailViewController.viewModel.randomMeal = self.viewModel.randomMeals[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension MealViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.mealCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = String(describing: CategoriesMealCollectionViewCell.self)
        let urlBase = viewModel.mealCategories[indexPath.row].imageCategory!
        let imageUrl = URL(string: urlBase)!
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CategoriesMealCollectionViewCell
        cell.cellLabelView.text = viewModel.mealCategories[indexPath.row].nameCategory
        cell.cellImageView.sd_setImage(with: imageUrl) { (image, erro, cache, url) in
            
        }
        return (cell)
    }
}

extension MealViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
extension MealViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let identifier = String(describing: MealsInCategoryDetailViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? MealsInCategoryDetailViewController {
            
            detailViewController.viewModel.mealCategory = self.viewModel.mealCategories[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

