//
//  LaunchViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/23.
//

import UIKit

class LaunchViewController: BaseViewController {
    
    private let viewModel: LaunchViewModel
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImage(named: "Fugo_logo")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var loadingImageView: UIImageView = {
        let image = UIImage(named: "loading")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getPublicBaseData { isDone in
            if isDone {
                self.present(TabBarController(), animated: true)
            }
        }
    }
    
    private func setupUI() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(view.snp.width).dividedBy(2)
            $0.center.equalTo(view)
        }
        view.addSubview(loadingImageView)
        loadingImageView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(logoImageView.snp.bottom).offset(16)
        }
    }
}
