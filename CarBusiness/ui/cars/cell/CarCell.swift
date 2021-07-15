//
//  CarCell.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 07.07.2021.
//

import UIKit
import SnapKit

final class CarCell: UITableViewCell {
    
    private let containerView = UIView()
    private let brandLabel = UILabel()
    private let yearLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        
        selectionStyle = .none
        
        setupContainerView()
        setupYearLabel()
        setupBrandLabel()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        containerView.backgroundColor = .black
        containerView.layer.cornerRadius = 20
    }
    
    private func setupBrandLabel() {
        containerView.addSubview(brandLabel)
        brandLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.bottom.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(yearLabel.snp.leading)
        }
        
        brandLabel.applyStyle(style: .subTitle)
    }
    
    private func setupYearLabel() {
        containerView.addSubview(yearLabel)
        yearLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        yearLabel.applyStyle(style: .description)
        yearLabel.textAlignment = .right
    }
    
    func updateUI(carCellModel: CarCellModel) {
        brandLabel.text = carCellModel.brand
        yearLabel.text = "\(carCellModel.year)"
    }
}
