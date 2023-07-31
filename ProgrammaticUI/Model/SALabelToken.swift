//
//  SALabelToken.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 31/7/23.
//

import UIKit

struct SAFontToken {
    static let heading: SAFontToken = .init(size: 20, weight: .regular, bold: false)
    static let headingHighlight: SAFontToken = .init(size: 20, weight: .regular, bold: true)
    static let title: SAFontToken = .init(size: 40, weight: .regular, bold: true)

    let size: CGFloat
    let weight: UIFont.Weight
    let bold: Bool

    var font: UIFont {
        var font: UIFont

        if bold {
            font = UIFont.boldSystemFont(ofSize: size)
        } else {
            font = UIFont.systemFont(ofSize: size, weight: weight)
        }

        return font
    }
}

