//
//  CarBusinessViewController.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import UIKit
import SnapKit

class CarBusinessViewController<VM, P>: UIViewController {
    
    let viewModel: VM
    var presenter: P
    
    private let spinner = UIActivityIndicatorView(style: .large)
    private let alertLabel = PaddingLabel()
    
    init(viewModel: VM, presenter: P) {
        self.viewModel = viewModel
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBaseViews()
    }
    
    private func setupBaseViews() {
        view.backgroundColor = .systemBlue
        
        setupSpinner()
        setupAlertLabel()
    }
    
    private func setupSpinner() {
        view.addSubview(spinner)
        spinner.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        spinner.color = .white
        spinner.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
    }
    
    private func setupAlertLabel() {
        view.addSubview(alertLabel)
        alertLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        alertLabel.applyStyle(style: .alert)
        alertLabel.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
    }
    
    func setNavigationBarTitle(_ title: String) {
        navigationItem.title = title
    }
    
    func startSpinner() {
        spinner.startAnimating()
    }
    
    func stopSpinner() {
        spinner.stopAnimating()
    }
    
    func displayAlert(with message: String) {
        alertLabel.text = message
        
        UIView.animate(withDuration: 1) {
            self.alertLabel.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 2, delay: 3, options: .allowAnimatedContent) {
                self.alertLabel.alpha = 0
            }
        }
    }
}
