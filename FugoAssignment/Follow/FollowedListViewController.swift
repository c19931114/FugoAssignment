//
//  FollowedListViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/24.
//

import UIKit

class FollowedListViewController: BaseViewController {
    
    private let viewModel: FollowedListViewModel
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TypeDetailListCell.self, 
                           forCellReuseIdentifier: String(describing: TypeDetailListCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    init(viewModel: FollowedListViewModel) {
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension FollowedListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TypeDetailListCell.self), for: indexPath)
        guard let cell = reuseCell as? TypeDetailListCell else { return reuseCell }
        let model = viewModel.list[indexPath.row]
        cell.config(with: model)
        return cell
    }
}

extension FollowedListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.list[indexPath.row]
        let vc = CompanyDetailViewController(model: model)
        navigationController?.pushViewController(vc, animated: true)
    }
}
