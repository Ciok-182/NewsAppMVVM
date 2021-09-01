//
//  WebServices.swift
//  GoodNews
//
//  Created by Jorge Encinas on 01/09/21.
//

import Foundation

class WebServices {
    
    func getArticle(url: URL, completion: @escaping ([Article]?) ->() ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                print("Data: \(data)")
                
                if let articleList = try? JSONDecoder().decode(ArticleList.self, from: data){
                    print("Articles: \(articleList.articles.count)")
                    completion(articleList.articles)
                }
                
                
                
            }
            
        }.resume()
    }
}
