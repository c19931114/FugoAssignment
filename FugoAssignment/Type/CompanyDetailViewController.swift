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
        button.isHidden = true
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CompanyDetailCell.self, 
                           forCellReuseIdentifier: String(describing: CompanyDetailCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
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
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(companyLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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

extension CompanyDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: String(describing: CompanyDetailCell.self), for: indexPath)
        guard let cell = reuseCell as? CompanyDetailCell else { return reuseCell }
        cell.configData(cellModel: viewModel.cellModels[indexPath.row])
        return cell
    }
}

extension CompanyDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
