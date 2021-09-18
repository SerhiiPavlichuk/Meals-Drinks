//
//  FirstScreenViewController.swift
//  Meals-Drinks
//
//  Created by admin on 02.09.2021.
//

import Foundation
import UIKit
import Lottie

class FirstScreenViewController: UIViewController {
    
    @IBOutlet weak var burgerAnimationView: AnimationView!
    @IBOutlet weak var drinkAnimationView: AnimationView!
    
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        imageView.image = UIImage(named: Constants.ui.logoImage)
        return imageView
    }()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupBurgerAnimation()
        setupDrinkAnimation()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Methods
    
    func setupBurgerAnimation() {
        
        burgerAnimationView.contentMode = .scaleAspectFit
        burgerAnimationView.loopMode = .loop
        burgerAnimationView.animationSpeed = 0.5
        burgerAnimationView.play()
    
    }
    
    func setupDrinkAnimation() {
        
        drinkAnimationView.contentMode = .scaleAspectFit
        drinkAnimationView.loopMode = .loop
        drinkAnimationView.animationSpeed = 0.5
        drinkAnimationView.play()
    
    }
    
    //MARK:- Add launchScreen animation
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        launchScreenAnimate()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.7, execute: {
            self.launchScreenAnimate()
        })
    }
    
    private func launchScreenAnimate() {
        UIView.animate(withDuration: 0.8, animations: {
            let size = self.view.frame.size.width * 20
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
            
            self.imageView.alpha = 0
        })
    }
}
