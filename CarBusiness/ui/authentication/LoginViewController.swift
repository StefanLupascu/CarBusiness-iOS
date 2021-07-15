//
//  LoginViewController.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import UIKit
import SnapKit

final class LoginViewController: CarBusinessViewController<LoginViewModel, LoginPresenter> {
    
    private let usernameField = UITextField()
    private let passwordField = UITextField()
    private let loginButton = UIButton()

    override init(viewModel: LoginViewModel, presenter: LoginPresenter) {
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
        setNavigationBarTitle(viewModel.authenticationText)
        
        setupUsernameField()
        setupPasswordField()
        setupLoginButton()
    }
    
    private func setupUsernameField() {
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(view.snp.centerY).offset(-50)
            $0.height.equalTo(50)
        }
        
        usernameField.applyStyle(style: .mainTextField)
        usernameField.placeholder = viewModel.usernameText
    }
    
    private func setupPasswordField() {
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints {
            $0.leading.equalTo(usernameField.snp.leading)
            $0.trailing.equalTo(usernameField.snp.trailing)
            $0.top.equalTo(usernameField.snp.bottom).offset(10)
            $0.height.equalTo(50)
        }
        
        passwordField.applyStyle(style: .mainTextField)
        passwordField.isSecureTextEntry = true
        passwordField.placeholder = viewModel.passwordText
    }
    
    private func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(usernameField.snp.leading)
            $0.trailing.equalTo(usernameField.snp.trailing)
            $0.height.equalTo(60)
        }
        
        loginButton.applyStyle(style: .save)
        loginButton.setTitle(viewModel.loginText, for: .normal)
        loginButton.addTarget(self, action: #selector(didTapOnLogin), for: .touchUpInside)
    }
    
    @objc private func didTapOnLogin() {
        let username = usernameField.text ?? ""
        let password = usernameField.text ?? ""
        
        guard !username.isEmpty, !password.isEmpty else {
            // TODO: - display alert
            displayAlert(with: viewModel.allFieldsErrorText)
            return
        }
        
        startSpinner()
        presenter.authenticate(with: username, and: password)
    }
}

extension LoginViewController: LoginView {
    
    func didFailToAuthenticate() {
        displayAlert(with: viewModel.authenticationFailedText)
        stopSpinner()
    }
}
