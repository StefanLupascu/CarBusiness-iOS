//
//  CarDetails.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 09.07.2021.
//

import UIKit
import SnapKit

final class CarDetailsViewController: CarBusinessViewController<CarDetailsViewModel, CarDetailsPresenter> {
    
    private let brandLabel = UILabel()
    private let yearLabel = UILabel()
    private let horsePowerLabel = UILabel()
    private let priceLabel = UILabel()
    private let updateButton = UIButton()
    private let deleteButton = UIButton()
    
    override init(viewModel: CarDetailsViewModel, presenter: CarDetailsPresenter) {
        super.init(viewModel: viewModel, presenter: presenter)
        
        self.presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        setNavigationBarTitle(viewModel.carDetails.brand.getBrand())
        
        setupBrandLabel()
        setupHorsePowerLabel()
        setupYearLabel()
        setupPriceLabel()
        setupDeleteButton()
        setupUpdateButton()
    }
    
    private func setupBrandLabel() {
        view.addSubview(brandLabel)
        brandLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(100)
        }
        
        brandLabel.text = viewModel.carDetails.brand.getBrand()
        brandLabel.applyStyle(style: .title)
    }
    
    private func setupHorsePowerLabel() {
        view.addSubview(horsePowerLabel)
        horsePowerLabel.snp.makeConstraints {
            $0.leading.equalTo(brandLabel)
            $0.top.equalTo(brandLabel.snp.bottom).offset(20)
        }
        
        horsePowerLabel.text = viewModel.getHorsePowerText()
        horsePowerLabel.applyStyle(style: .description)
    }
    
    private func setupYearLabel() {
        view.addSubview(yearLabel)
        yearLabel.snp.makeConstraints {
            $0.leading.equalTo(brandLabel)
            $0.top.equalTo(horsePowerLabel.snp.bottom).offset(10)
        }
        
        yearLabel.text = viewModel.getYearText()
        yearLabel.applyStyle(style: .description)
    }
    
    private func setupPriceLabel() {
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(brandLabel)
            $0.top.equalTo(yearLabel.snp.bottom).offset(10)
        }
        
        priceLabel.text = viewModel.getPriceText()
        priceLabel.applyStyle(style: .description)
    }
    
    private func setupUpdateButton() {
        view.addSubview(updateButton)
        updateButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(deleteButton.snp.top).offset(-10)
            $0.height.equalTo(60)
        }
        
        updateButton.applyStyle(style: .update)
        updateButton.setTitle(viewModel.updateText, for: .normal)
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    private func setupDeleteButton() {
        view.addSubview(deleteButton)
        deleteButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.height.equalTo(60)
        }
        
        deleteButton.applyStyle(style: .delete)
        deleteButton.setTitle(viewModel.deleteText, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    @objc private func updateButtonTapped() {
        
    }
    
    @objc private func deleteButtonTapped() {
        startSpinner()
        presenter.deleteCar(with: viewModel.carDetails.id)
    }
}

extension CarDetailsViewController: CarDetailsPresenterView {
    
    func didDeleteCar(with message: String) {
        stopSpinner()
        navigationController?.popViewController(animated: true)
    }
    
    func didFailToDeleteCar(with message: String) {
        displayAlert(with: viewModel.failedToDeleteCarText)
    }
    
    func didUpdateCar(with message: String) {
        
    }
    
    func didFailToUpdateCar(with message: String) {
        displayAlert(with: viewModel.failedToUpdateCarText)
    }
}
