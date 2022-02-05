//
//  Model.swift
//  Scaner
//
//  Created by Геворг on 05.02.2022.
//

import SwiftUI
import Foundation

class TextItem: Identifiable {
    var id: String
    var text: String = ""
 
    init() {
        id = UUID().uuidString
    }
}
