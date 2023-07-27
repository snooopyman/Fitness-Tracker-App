//
//  SATextField.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 27/7/23.
//

import UIKit

class SATextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    convenience init(text: String, background: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.backgroundColor = background
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = UITextField.BorderStyle.line
        isSecureTextEntry = false
    }
}
