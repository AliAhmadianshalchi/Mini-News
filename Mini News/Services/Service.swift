//
//  Service.swift
//  Mini News
//
//  Created by Ali Ahmadian shalchi on 07/07/2021.
//

import Foundation

class Service {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data , response , error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self,from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
                
            }
        }.resume()
    }
    
}
