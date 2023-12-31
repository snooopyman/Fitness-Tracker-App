//
//  Stadistic.swift
//  ProgrammaticUI
//
//  Created by Jesús Armando Cáceres Vilchez on 27/7/23.
//

import Foundation

struct Stadistic {
    let km: Double
    let calories: Int
    let duration: String

    var kmString: String {
        return String(format: "%.1f", km)
    }

    func toDictionary() -> [String: Any] {
        return [
            "km": km,
            "calories": calories,
            "duration": duration
        ]
    }
}
