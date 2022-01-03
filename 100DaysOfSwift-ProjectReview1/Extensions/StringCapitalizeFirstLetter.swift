//
//  StringCapitalizeFirstLetter.swift
//  100DaysOfSwift-ProjectReview1
//
//  Created by Lucas Maniero on 03/01/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizeFirstLetter()
    }
}
