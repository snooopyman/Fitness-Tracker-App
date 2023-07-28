//
//  SALabel.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 28/7/23.
//

import UIKit

class SALabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(texto: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = texto
        self.font = font
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}