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
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with cellModel: TypeListCellModel) {
        let typeName = cellModel.typeName
        let listCount = cellModel.listCount
        textLabel?.text = "\(typeName) (\(listCount))"
    }
}
