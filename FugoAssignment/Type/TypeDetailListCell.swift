//
//  TypeDetailListCell.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import UIKit

class TypeDetailListCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with model: PublicBaseDataAPIModel) {
        let companyID = model.公司代號 ?? ""
        let companyName = model.公司簡稱 ?? ""
        textLabel?.text = "\(companyID) \(companyName)"
    }
}
