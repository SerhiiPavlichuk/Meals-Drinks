//
//  RandomDrinksCollectionViewCell.swift
//  Meals-Drinks
//
//  Created by admin on 18.08.2021.
//

import UIKit

class CategoryDrinksCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabelView: UILabel!
    
    var categoryDrinks: DrinksCategory? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.cellImageView.layer.cornerRadius = self.cellImageView.frame.height / 2
    }
}
