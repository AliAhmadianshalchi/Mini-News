//
//  MiniNewsTableViewController.swift
//  Mini News
//
//  Created by Ali Ahmadian shalchi on 07/07/2021.
//

import Foundation
import UIKit

class MiniNewsTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: Constants.newsAPI.rawValue)!
        
        Service().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    
    override func numberOfSections(in tableview: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableview: UITableView,numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "ArticleCellID", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArtileTableViewCell not found!")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
    
}
