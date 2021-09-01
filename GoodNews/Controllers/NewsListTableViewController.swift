//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Jorge Encinas on 31/08/21.
//

import Foundation


import UIKit

class NewsListTableViewController: UITableViewController{
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=ee9d21a6a6a74ce7b3741bd4035af49a")!
        
        WebServices().getArticle(url: url, completion:{ articles in
            
            if let articles = articles{
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
        })
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellArticle", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleCell not Founde")
        }
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.descriptionLabel.text = articleVM.description
        cell.titleLabel.text = articleVM.title
        
        return cell
    }
    
}
