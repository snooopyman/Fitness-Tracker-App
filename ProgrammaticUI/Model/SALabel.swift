//
//  SALabel.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 28/7/23.
//

import UIKit

public class SALabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public convenience init(text: String, token: SAFontToken) {
        self.init(frame: .zero)
        self.text = text
        self.font = token.font
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
