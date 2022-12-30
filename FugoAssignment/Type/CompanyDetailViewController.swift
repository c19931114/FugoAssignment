//
//  CompanyDetailViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import UIKit

class CompanyDetailViewController: BaseViewController {
    
    private let fieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "基本資料"
        return label
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var wedButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "globe")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(goToWeb), for: .touchUpInside)
        return button
    }()
    
    let viewModel: CompanyDetailViewModel
    private lazy var barButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "star"), 
                                     style: .done, target: self, 
                                     action: #selector(starDidTap))
        button.isHidden = true
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
        configData()
    }
    
    private func setupUI() {
        let imageName = viewModel.isFollowed ? "star.fill" : "star"
        barButtonItem.image = UIImage(systemName: imageName)
        navigationItem.rightBarButtonItem = barButtonItem
        
        view.addSubview(fieldLabel)
        fieldLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.equalTo(16)
        }
        view.addSubview(companyLabel)
        companyLabel.snp.makeConstraints {
            $0.top.equalTo(fieldLabel.snp.bottom).offset(4)
            $0.leading.equalTo(16)
        }
        view.addSubview(wedButton)
        wedButton.snp.makeConstraints {
            $0.leading.equalTo(companyLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(companyLabel)
            $0.width.height.equalTo(32)
        }
    }
    
    private func configData() {
        companyLabel.text = viewModel.model.公司名稱
        if let _ = viewModel.model.網址 {
            wedButton.isHidden = false
        }
    }
    
    @objc private func starDidTap(sender: UIBarButtonItem) {
    
        viewModel.updataFollowedList { [weak self] isFollowed in
            let imageName = isFollowed ? "star.fill" : "star"
            self?.barButtonItem.image = UIImage(systemName: imageName)
        }
    }
    
    @objc private func goToWeb(sender: UIButton) {
        guard let urlString = viewModel.model.網址,
              let url = URL(string: urlString.trimmingCharacters(in: .whitespaces)) else { return }
        let request = URLRequest(url: url)
        let vc = WebViewController(request: request)
        navigationController?.pushViewController(vc, animated: true)
    }
}
