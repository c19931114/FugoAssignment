//
//  TypeDetailListCell.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import UIKit

class TypeDetailListCell: UITableViewCell {
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "greaterthan")?.withRenderingMode(.alwaysTemplate)
        image?.withTintColor(.black, renderingMode: .alwaysTemplate)
        imageView.image = image
        return imageView
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
        contentView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(-16)
        }
    }
    
    func config(with model: PublicBaseDataAPIModel) {
        let companyID = model.公司代號 ?? ""
        let companyName = model.公司簡稱 ?? ""
        textLabel?.text = "\(companyID) \(companyName)"
    }
}
