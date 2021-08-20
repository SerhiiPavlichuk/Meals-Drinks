//
//  CategoryCollectionViewCell.swift
//  Meals-Drinks
//
//  Created by admin on 09.08.2021.
//

import UIKit

class RandomMealCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabelView: UILabel!
    
    var randomMeal: MealInformation? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.cellImageView.layer.cornerRadius = self.cellImageView.frame.height / 2
    }
}
