//
//  CarBusinessNavigationController.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 09.07.2021.
//

import UIKit

final class CarBusinessNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        navigationBar.barTintColor = .systemBlue
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.backIndicatorImage = UIImage(systemName: "back")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "back")
    }
}
