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
        guard let baseURL = URL(string: baseURLString) else { return completion(false) }
        let coinsURL = baseURL.appendingPathComponent(keyCoinsComponents)
        let finalURL = coinsURL.appendingPathComponent(keyListComponents)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { coinData, _, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
                completion(false)
            }
            guard let data = coinData else { completion(false)
                return }
            do {
                if let topLevelArrayOfCoinDictionaries = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: String]] {
                    for coinDictionary in topLevelArrayOfCoinDictionaries {
                        if let id = coinDictionary["id"],
                           let symbol = coinDictionary["symbol"],
                           let name = coinDictionary["name"] {
                            let parcedCoin = Coin(id: id, symbol: symbol, name: name)
                            coins.append(parcedCoin)
                        }
                    }
                    completion(true)
                }
            } catch {
                print("Error in Do/Try/Catch: \(error.localizedDescription)")
                    completion(false)
            }
        }.resume()
    }
} // End of class
