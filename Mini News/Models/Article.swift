//
//  Article.swift
//  Mini News
//
//  Created by Ali Ahmadian shalchi on 07/07/2021.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    
    var title: String
    var description: String
    
    init(title: String,description: String) {
        self.title = title
        self.description = description
    }
    
}
