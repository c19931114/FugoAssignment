//
//  CompanyDetailCell.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/31.
//

import UIKit

class CompanyDetailCell: UITableViewCell {
    
    private let keyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }() 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(keyLabel)
        stackView.addArrangedSubview(valueLabel)
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(16)
        }
    }
    
    func configData(cellModel: [String: Any?]) {
        keyLabel.text = cellModel.keys.first
        valueLabel.text = cellModel.values.first as? String
    }
}


