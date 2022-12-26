//
//  TypeListCell.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import UIKit

class TypeListCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with cellModel: TypeListCellModel) {
        let typeName = "\(cellModel.type)"
        let listCount = cellModel.list.count
        textLabel?.text = "\(typeName) (\(listCount))"
    }
}
