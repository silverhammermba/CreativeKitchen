//
//  CategoryViewModel.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    let name: String
    let options: [String]

    func sample() -> String {
        return options.randomElement()!
    }
}
