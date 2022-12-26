//
//  TypeListViewModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/25.
//

import Foundation

class TypeListViewModel {
    
    var cellModels: [TypeListCellModel] = []
    
    func getTypeList() {
        let data = getPublicBaseDataAPIModelListDic()
        var list = [(TSE, String)]()
        for (key, value) in data {
            list.append((key, "\(value.count)"))
        }
        list.sort { $0.0.rawValue < $1.0.rawValue }
        cellModels = list.compactMap {
            TypeListCellModel(typeName: "\($0.0)", listCount: $0.1)
        }
    }
    
    private func getPublicBaseDataAPIModelListDic() -> [TSE: [PublicBaseDataAPIModel]] {
        let listDic = UserDefaults.standard.getObject(forKey: "PublicBaseDataAPIModelListDic", castTo: [TSE: [PublicBaseDataAPIModel]].self) ?? [:]
        return listDic
    }
}
