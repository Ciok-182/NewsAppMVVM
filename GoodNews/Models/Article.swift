//
//  Article.swift
//  GoodNews
//
//  Created by Jorge Encinas on 01/09/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title : String
    let description: String
    
}
