//
//  WebViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/31.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {
    
    private let request: URLRequest
    private let webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    init(request: URLRequest) {
        self.request = request
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadRequest()
    }
    
    private func setupUI() {
        view.addSubview(webView)
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func loadRequest() {
        webView.load(request)
    }
}
