//
//  SAButton.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 26/7/23.
//
import UIKit

/*
protocol SAButtonViewControllerDelegate {
    func nextScreen(controller: UIViewController)
}*/

class SAButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    convenience init(backgroundColor: UIColor?, title: String, action: UIAction) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor ?? .clear
        self.setTitle(title, for: .normal)
        self.addAction(action, for: .touchUpInside)
    }

    private func configure() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
