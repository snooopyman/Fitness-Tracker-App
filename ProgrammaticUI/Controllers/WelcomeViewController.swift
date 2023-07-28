//
//  WelcomeViewController.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 25/7/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let titleLabel = SALabel(texto: "", font: .boldSystemFont(ofSize: 35))
    private let imageFitness = SAImageView(imageNamed: "fitness.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUp()
    }

    private func setUp() {
        let loginButton = SAButton(backgroundColor: UIColor(named: "ButtonLogin"), title: "Login", action: UIAction(handler: { [weak self] _ in
            self?.nextScreen(controller: LoginViewController())
        }))

        let registerButton = SAButton(backgroundColor: UIColor(named: "ButtonRegister"), title: "Register", action: UIAction(handler: { [weak self] _ in
            self?.nextScreen(controller: RegisterViewController())
        }))

        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(titleLabel)
        view.addSubview(imageFitness)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: (view.bounds.height - 700)),

            imageFitness.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageFitness.centerYAnchor.constraint(equalTo: view.topAnchor, constant: (view.bounds.height - 500)),
            imageFitness.widthAnchor.constraint(equalToConstant: 460),
            imageFitness.heightAnchor.constraint(equalToConstant: 460),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 60),

            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -16),
            registerButton.widthAnchor.constraint(equalToConstant: 300),
            registerButton.heightAnchor.constraint(equalToConstant: 60)
        ])

        animateTitleLabel()
    }

    private func animateTitleLabel() {
        let titleText = "Fitness Tracker App"
        var charIndex = 0.0

        for letter in titleText {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 * charIndex) { [weak self] in
                self?.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }

    private func nextScreen(controller: UIViewController) {
        let nextScreen = controller
        navigationController?.pushViewController(nextScreen, animated: true)
    }

}
