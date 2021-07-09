//
//  MiniNewsTableViewController.swift
//  Mini News
//
//  Created by Ali Ahmadian shalchi on 07/07/2021.
//

import Foundation
import UIKit

class MiniNewsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: Constants.newsAPI.rawValue)!
        
        Service().getArticles(url: url) { _ in
            
        }
    }
    
}
