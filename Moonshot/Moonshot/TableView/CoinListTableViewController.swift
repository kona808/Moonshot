//
//  CoinListTableViewController.swift
//  Moonshot
//
//  Created by Jacob Perez on 10/3/22.
//

import UIKit

class CoinListTableViewController: UITableViewController {
    
    @IBOutlet weak var coinDetail: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoinController.fetchCoins { success in
            if success == true {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CoinController.coins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath)
        
        let coin = CoinController.coins[indexPath.row]
        cell.detailTextLabel?.text = "Symbol:\(coin.symbol), ID:\(coin.id)"
        cell.textLabel?.text = "\(coin.name)"
    
        return cell
    }
    
} // End of class
