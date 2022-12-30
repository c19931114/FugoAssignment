//
//  CompanyDetailViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import UIKit

class CompanyDetailViewController: BaseViewController {
    
    let viewModel: CompanyDetailViewModel
    private lazy var barButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "star"), 
                                     style: .done, target: self, 
                                     action: #selector(starDidTap))
        return button
    }()
    
    init(model: PublicBaseDataAPIModel) {
        self.viewModel = CompanyDetailViewModel(model: model)
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
        let imageName = viewModel.isFollowed ? "star.fill" : "star"
        barButtonItem.image = UIImage(systemName: imageName)
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func starDidTap(sender: UIBarButtonItem) {
    
        viewModel.updataFollowedList { [weak self] isFollowed in
            let imageName = isFollowed ? "star.fill" : "star"
            self?.barButtonItem.image = UIImage(systemName: imageName)
        }
    }
}
