//
//  SAImageView.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 28/7/23.
//

import UIKit

public class SAImageView: UIImageView {

    public static let fitnessImage = SAImageView(imageNamed: "fitness.png")

    public override init(image: UIImage?) {
        super.init(image: image)
        configure()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    public convenience init(imageNamed imageName: String) {
        guard let image = UIImage(named: imageName) else {
            fatalError("No se ha cargado la imagen \(imageName)")
        }
        self.init(image: image)
    }

    private func configure() {
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }
}
