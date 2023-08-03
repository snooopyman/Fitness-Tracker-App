//
//  RegisterViewController.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 25/7/23.
//

import UIKit
import FirebaseAuth
import DesignSystem

class RegisterViewController: UIViewController {

    private let emailTextField = DesignSystem.SATextField(text: "123@123.com", background: .white)
    private let passwordTextField = DesignSystem.SATextField(text: "123456", background: .white)
    private let titleLabel = DesignSystem.SALabel(text: "Register", token: .heading)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Fitness Tracker App"
        setup()
    }

    private func setup() {
        passwordTextField.isSecureTextEntry = true
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "password"

        let registerButton = DesignSystem.SAButton(backgroundColor: UIColor(named: "ButtonRegister"), title: "Register", action: UIAction(handler: { register in
            self.registerAction()
        }))

        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(titleLabel)
        view.addSubview(registerButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: (view.bounds.height - 700)),

            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),

            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -70),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),

            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            registerButton.widthAnchor.constraint(equalToConstant: 300),
            registerButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    func registerAction() {

        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.navigationController?.pushViewController(HomeViewController(), animated: true)
                }
            }
        }
    }
}
