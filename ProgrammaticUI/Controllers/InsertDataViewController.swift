//
//  InsertDataViewController.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 28/7/23.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import DesignSystem

protocol InsertDataViewControllerDelegate: AnyObject {
    func inserDataViewController(_ insertDataViewController: InsertDataViewController, didInsertData data: Stadistic)
}

class InsertDataViewController: UIViewController {

    weak var delegate: InsertDataViewControllerDelegate?

    private let titleLabel = DesignSystem.SALabel(text: "Edit your statistics", token: .title)
    private let kmTextField = DesignSystem.SATextField(text: "", background: .white)
    private let caloriesTextField = DesignSystem.SATextField(text: "", background: .white)
    private let durationTextField = DesignSystem.SATextField(text: "", background: .white)

    private lazy var saveButton: SAButton = {
        let button = DesignSystem.SAButton(backgroundColor: .systemBlue, title: "Save", action: UIAction(handler: { [weak self] _ in
            self?.saveData()
        }))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .white

        kmTextField.placeholder = "Kms"
        caloriesTextField.placeholder = "Calories"
        durationTextField.placeholder = "Duration Of Training"

        let stackView = UIStackView(arrangedSubviews: [titleLabel, kmTextField, caloriesTextField, durationTextField, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

    private func saveData() {
        guard
            let kmText = kmTextField.text,
            let caloriesText = caloriesTextField.text,
            let durationText = durationTextField.text,
            let km = Double(kmText),
            let calories = Int(caloriesText)
        else {
            fatalError("Error saving data.")
        }

        let data = Stadistic(km: km, calories: calories, duration: durationText)


        guard let userEmail = Auth.auth().currentUser?.email else {
            fatalError("User not authenticated.")
        }

        let username = getUsername(from: userEmail)
        let ref = Database.database().reference().child("users").child(username)
        ref.setValue(data.toDictionary())

        delegate?.inserDataViewController(self, didInsertData: data)
        navigationController?.popViewController(animated: true)

    }

    private func getUsername(from email: String) -> String {
        guard let username = email.split(separator: "@").first else {
            fatalError("Invalid email format.")
        }
        return String(username)
    }
}

