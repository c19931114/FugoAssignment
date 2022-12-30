//
//  TypeListCellModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import Foundation

class TypeListCellModel {
    
    let type: TSE
    let list: [PublicBaseDataAPIModel]
        
    init(type: TSE, list: [PublicBaseDataAPIModel]) {
        self.type = type
        self.list = list
    }
}
