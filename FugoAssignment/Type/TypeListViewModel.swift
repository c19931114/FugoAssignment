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
        let dic = getPublicBaseDataAPIModelListDic()
        let array = dic.sorted { $0.0.rawValue < $1.0.rawValue }
        cellModels = array.compactMap { 
            TypeListCellModel(type: $0.key, list: $0.value) }
    }
    
    private func getPublicBaseDataAPIModelListDic() -> [TSE: [PublicBaseDataAPIModel]] {
        let listDic = UserDefaults.standard.getObject(forKey: "PublicBaseDataAPIModelListDic", castTo: [TSE: [PublicBaseDataAPIModel]].self) ?? [:]
        return listDic
    }
}
