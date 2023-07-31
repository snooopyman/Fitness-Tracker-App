//
//  InsertDataViewController.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 28/7/23.
//

import UIKit

protocol InsertDataViewControllerDelegate: AnyObject {
    func didInsertData(_ data: Stadistic)
}

class InsertDataViewController: UIViewController {

    weak var delegate: InsertDataViewControllerDelegate?

    let kmTextField = SATextField(text: "", background: .white)
    let caloriesTextField = SATextField(text: "", background: .white)
    let durationTextField = SATextField(text: "", background: .white)

    private lazy var saveButton: SAButton = {
        let button = SAButton(backgroundColor: .systemBlue, title: "Save", action: UIAction(handler: { [weak self] _ in
            self?.saveData()
        }))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }

    private func configureUI() {
        kmTextField.placeholder = "Kms"
        caloriesTextField.placeholder = "Calories"
        durationTextField.placeholder = "Duration Of Training"
        view.addSubview(kmTextField)
        view.addSubview(caloriesTextField)
        view.addSubview(durationTextField)
        view.addSubview(saveButton)

        NSLayoutConstraint.activate([
            durationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            durationTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
            durationTextField.widthAnchor.constraint(equalToConstant: 300),
            durationTextField.heightAnchor.constraint(equalToConstant: 60),

            caloriesTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            caloriesTextField.bottomAnchor.constraint(equalTo: durationTextField.bottomAnchor, constant: -70),
            caloriesTextField.widthAnchor.constraint(equalToConstant: 300),
            caloriesTextField.heightAnchor.constraint(equalToConstant: 60),


            kmTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kmTextField.bottomAnchor.constraint(equalTo: caloriesTextField.bottomAnchor, constant: -70),
            kmTextField.widthAnchor.constraint(equalToConstant: 300),
            kmTextField.heightAnchor.constraint(equalToConstant: 60),

            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
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
        delegate?.didInsertData(data)
        navigationController?.popViewController(animated: true)
    }

}
