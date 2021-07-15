//
//  CarsViewController.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 07.07.2021.
//

import UIKit
import SnapKit

final class CarsViewController: CarBusinessViewController<CarsViewModel, CarsPresenter> {
    
    private let CAR_CELL_ID = "CAR_CELL_ID"
    
    private let tableView = UITableView()
    
    override init(viewModel: CarsViewModel, presenter: CarsPresenter) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBarTitle(viewModel.navigationBarTitle)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getCars()
    }
    
    private func getCars() {
        startSpinner()
        presenter.getCars()
    }
    
    private func setupViews() {
        setupAddButton()
        setupTableView()
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
    }
    
    @objc private func addButtonTapped() {
        presenter.presentAddCar()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CarCell.self, forCellReuseIdentifier: CAR_CELL_ID)
    }
}

extension CarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let carCell = tableView.dequeueReusableCell(withIdentifier: CAR_CELL_ID) as? CarCell else {
            return UITableViewCell()
        }
        
        let carCellModels = viewModel.getCarCellModels()
        carCell.updateUI(carCellModel: carCellModels[indexPath.row])
        
        return carCell
    }
}

extension CarsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = viewModel.cars[indexPath.row].id
        startSpinner()
        presenter.getCar(with: id)
    }
}

extension CarsViewController: CarsPresenterView {
    
    func didReceiveCar(_ carDetails: Car) {
        stopSpinner()
        setNavigationBarTitle("")
        presenter.presentCar(with: carDetails)
    }
    
    func didReceiveCars() {
        stopSpinner()
        tableView.reloadData()
    }
    
    func failedToRetrieveCars() {
        stopSpinner()
        displayAlert(with: viewModel.carsRetrievalFailed)
    }
    
    func didDeleteCar(with message: String) {
        
    }
    
    func didUpdateCar(with message: String) {
        
    }
}
