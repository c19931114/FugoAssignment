//
//  CompanyDetailViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import UIKit

class CompanyDetailViewController: BaseViewController {
    
    private let model: PublicBaseDataAPIModel
    
    init(model: PublicBaseDataAPIModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "\(model.公司代號 ?? "") \(model.公司簡稱 ?? "")"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .done, target: self, action: #selector(addTapped))
    }
    
    @objc private func addTapped(sender: UIBarButtonItem) {
    }
}
