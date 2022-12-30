//
//  TypeListViewController.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/24.
//

import UIKit

class TypeListViewController: BaseViewController {
    
    private let viewModel: TypeListViewModel
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TypeListCell.self, 
                           forCellReuseIdentifier: String(describing: TypeListCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    init(viewModel: TypeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getTypeList()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TypeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TypeListCell.self), for: indexPath)
        guard let cell = reuseCell as? TypeListCell else { return reuseCell }
        let cellModel = viewModel.cellModels[indexPath.row]
        cell.config(with: cellModel)
        return cell
    }
}

extension TypeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = viewModel.cellModels[indexPath.row]
        let vc = TypeDetailListViewController(viewModel: cellModel)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
