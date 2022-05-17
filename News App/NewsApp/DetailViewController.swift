//
//  DetailViewController.swift
//  NewsApp
//
//  Created by sudohostname on 04.09.2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if articleUrl != nil {
            let url = URL(string: articleUrl!)
            guard url != nil else {
                return
            }
            
            let request = URLRequest(url: url!)

            spinner.alpha = 1
            spinner.startAnimating()
            webView.load(request)
        }
    }
}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
