//
//  FirstScreenViewController.swift
//  Meals-Drinks
//
//  Created by admin on 02.09.2021.
//

import Foundation
import UIKit

class FirstScreenViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
}
