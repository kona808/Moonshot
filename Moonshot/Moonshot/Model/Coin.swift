//
//  Coin.swift
//  Moonshot
//
//  Created by Jacob Perez on 10/3/22.
//

import Foundation

class Coin: Codable {
    
    var id: String
    var symbol: String
    var name: String
    
    init(id: String, symbol: String, name: String) {
        self.id = id
        self.symbol = symbol
        self.name = name
    }
}
