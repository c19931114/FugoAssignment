//
//  TypeListViewModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/25.
//

import Foundation

class TypeListViewModel {
    
    func getTypeList() -> [(String, Int)] {
        let data = getPublicBaseDataAPIModelListDic()
        var list = [(String, Int)]()
        for (key, value) in data {
            list.append((key.rawValue, value.count))
        }
        list.sort { $0.0 < $1.0 }
        return list
    }
    
    private func getPublicBaseDataAPIModelListDic() -> [TSE: [PublicBaseDataAPIModel]] {
        let listDic = UserDefaults.standard.getObject(forKey: "PublicBaseDataAPIModelListDic", castTo: [TSE: [PublicBaseDataAPIModel]].self) ?? [:]
        return listDic
    }
}
