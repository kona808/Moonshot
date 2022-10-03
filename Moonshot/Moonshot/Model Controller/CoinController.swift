//
//  CoinController.swift
//  Moonshot
//
//  Created by Jacob Perez on 10/3/22.
//

import Foundation

class CoinController: Codable {
    
    static var coins: [Coin] = []
    
    private static let baseURLString = "https://api.coingecko.com/api/v3"
    private static let keyCoinsComponents = "coins"
    private static let keyListComponents = "list"
 
    static func fetchCoins(completion: @escaping (Bool) -> Void) {
        guard var baseURL = URL(string: baseURLString) else { return completion(false) }
        let coinsURL = baseURL.appendingPathComponent(keyCoinsComponents)
        let finalURL = coinsURL.appendingPathComponent(keyListComponents)
        print(finalURL)
    }
    
} // End of class
