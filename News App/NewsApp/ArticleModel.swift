//
//  ArticleModel.swift
//  NewsApp
//
//  Created by sudohostname on 04.09.2022.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles:[Article])
}

class ArticleModel {
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        let stringUrl = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=738171768cd641cd9e57d6612abe6a5f"
        
        let url = URL(string: stringUrl)

        guard url != nil else {
            print("Couldn't create URL object")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()

                do {
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    let articles = articleService.articles!
                    
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles)
                    }
                }
                catch {
                    print("Error parsing JSON")
                }
            }
        }
        dataTask.resume()
    }
}
