//
//  AddCarViewController.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 11.07.2021.
//

import UIKit
import SnapKit

final class AddCarViewController: CarBusinessViewController<AddCarViewModel, AddCarPresenter> {
    
    private let titleLabel = UILabel()
    private let brandPicker = UIPickerView()
    private let colorPicker = UIPickerView()
    private let horsePowerField = UITextField()
    private let yearField = UITextField()
    private let priceField = UITextField()
    private let saveButton = UIButton()
    
    override init(viewModel: AddCarViewModel, presenter: AddCarPresenter) {
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
        setNavigationBarTitle(viewModel.newText)
        
        setupGesture()
        setupTitleLabel()
        setupBrandPickerView()
        setupColorPickerView()
        setupHorsePowerField()
        setupYearField()
        setupPriceLabel()
        setupSaveButton()
    }
    
    private func setupGesture() {
        let tapToDismiss = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapToDismiss)
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        titleLabel.applyStyle(style: .subTitle)
        titleLabel.text = viewModel.detailsText
        titleLabel.numberOfLines = 0
    }
    
    private func setupBrandPickerView() {
        view.addSubview(brandPicker)
        brandPicker.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(view.snp.centerX)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        brandPicker.dataSource = self
        brandPicker.delegate = self
    }
    
    private func setupColorPickerView() {
        view.addSubview(colorPicker)
        colorPicker.snp.makeConstraints {
            $0.leading.equalTo(brandPicker)
            $0.trailing.equalTo(view.snp.centerX)
            $0.top.equalTo(brandPicker.snp.bottom)
            $0.height.equalTo(50)
        }
        
        colorPicker.dataSource = self
        colorPicker.delegate = self
    }
    
    private func setupHorsePowerField() {
        view.addSubview(horsePowerField)
        horsePowerField.snp.makeConstraints {
            $0.leading.equalTo(brandPicker)
            $0.trailing.equalTo(view.snp.centerX)
            $0.top.equalTo(colorPicker.snp.bottom).offset(10)
            $0.height.equalTo(40)
        }
        
        setAttributedPlaceholder(textfield: horsePowerField, text: viewModel.horsePowerPlaceholder)
        horsePowerField.applyStyle(style: .mainTextField)
    }
    
    private func setupYearField() {
        view.addSubview(yearField)
        yearField.snp.makeConstraints {
            $0.leading.equalTo(brandPicker)
            $0.trailing.equalTo(view.snp.centerX)
            $0.top.equalTo(horsePowerField.snp.bottom).offset(10)
            $0.height.equalTo(40)
        }

        setAttributedPlaceholder(textfield: yearField, text: viewModel.yearPlaceholder)
        yearField.applyStyle(style: .mainTextField)
    }
    
    private func setupPriceLabel() {
        view.addSubview(priceField)
        priceField.snp.makeConstraints {
            $0.leading.equalTo(brandPicker)
            $0.trailing.equalTo(view.snp.centerX)
            $0.top.equalTo(yearField.snp.bottom).offset(10)
            $0.height.equalTo(40)
        }

        setAttributedPlaceholder(textfield: priceField, text: viewModel.pricePlaceholder)
        priceField.applyStyle(style: .mainTextField)
    }
    
    private func setupSaveButton() {
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        saveButton.applyStyle(style: .save)
        saveButton.setTitle(viewModel.saveText, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setAttributedPlaceholder(textfield: UITextField, text: String) {
        textfield.attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: UIColor.white])
    }
    
    @objc private func saveButtonTapped() {
        startSpinner()
        
        let brand = CarBrand.allCases[brandPicker.selectedRow(inComponent: 0)]
        print(brand)
        let color = Colors.allCases[colorPicker.selectedRow(inComponent: 0)]
        guard let horsePower = horsePowerField.text.flatMap({ Int($0) }),
              let year = yearField.text.flatMap({ Int($0) }),
              let price = priceField.text.flatMap ({ Int($0) }) else {
            // TODO: - display alert
            return
        }
        guard horsePower != 0, year != 0, price != 0 else {
            // TODO: - display alert
            return
        }
        
        presenter.addCar(brand: brand, color: color.rawValue, horsePower: horsePower, year: year, price: price)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension AddCarViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case brandPicker:
            return CarBrand.allCases.count
        case colorPicker:
            return Colors.allCases.count
        default:
            fatalError("")
        }
    }
}

extension AddCarViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case brandPicker:
            return CarBrand.allCases[row].getBrand()
        case colorPicker:
            return Colors.allCases[row].rawValue
        default:
            fatalError("BLA")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        switch pickerView {
        case brandPicker:
            return NSAttributedString(string: CarBrand.allCases[row].getBrand(), attributes: [.foregroundColor: UIColor.white])
        case colorPicker:
            return NSAttributedString(string: Colors.allCases[row].rawValue, attributes: [.foregroundColor: UIColor.white])
        default:
            fatalError("BLA")
        }
    }
}

extension AddCarViewController: AddCarPresenterView {
    
    func didCreateCarSuccessfully() {
        stopSpinner()
        navigationController?.popViewController(animated: true)
    }
    
    func didNotCreateCar(with message: String) {
        stopSpinner()
        // TODO: - display alert
    }
}
