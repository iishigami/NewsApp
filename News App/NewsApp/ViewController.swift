//
//  ViewController.swift
//  NewsApp
//
//  Created by sudohostname on 04.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else {
            return
        }

        let article = articles[indexPath!.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.articleUrl = article.url!
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        let article = articles[indexPath.row]
        cell.displayArticle(article)

        return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "goToDetail", sender: self)
        }
    
}

extension ViewController: ArticleModelProtocol {
    // MARK: - Article Model Protocol Methods
    func articlesRetrieved(_ articles: [Article]) {
        self.articles = articles
        tableView.reloadData()
    }
}
