//
//  SATextField.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 27/7/23.
//

import UIKit

public class SATextField: UITextField {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    public convenience init(text: String, background: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.backgroundColor = background
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .bezel
    }
}
