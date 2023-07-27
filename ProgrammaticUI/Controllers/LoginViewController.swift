//
//  SecondScreen.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 25/7/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    let emailTextField = SATextField(text: "123@123.com", background: .gray)
    let passwordTextField = SATextField(text: "123456", background: .gray)

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Log In"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .boldSystemFont(ofSize: 35)
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Fitness Tracker App"
        setup()
    }

    private func setup() {
        passwordTextField.isSecureTextEntry = true

        let loginButton = SAButton(backgroundColor: .blue, title: "Log In", action: UIAction(handler: { register in
            self.loginAction()
        }))

        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(titleLabel)
        view.addSubview(loginButton)

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

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    func loginAction() {

        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }
                else {
                    self?.navigationController?.pushViewController(HomeViewController(), animated: true)
                }
            }
        }
    }
}
