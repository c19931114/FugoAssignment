//
//  LaunchViewModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/23.
//

import Foundation

class LaunchViewModel {
    
    private let apiManager = APIManager()
    
    func getPublicBaseData(completion: @escaping (Bool) -> Void) {
        guard UserDefaults.standard.getObject(forKey: "PublicBaseDataAPIModelListDic", castTo: [TSE: [PublicBaseDataAPIModel]].self) == nil else {
            completion(true)
            return
        }
        apiManager.fetchAPIData(query: "/t187ap03_P") { [weak self] data, error in
            guard let data = data else { 
                completion(false)
                return
            }
            self?.saveData(data)
            completion(true)
        }
    }
    
    private func saveData(_ data: [PublicBaseDataAPIModel]) {
        var dic = [TSE: [PublicBaseDataAPIModel]]()
        data.forEach { model in
            let type: TSE = model.產業別 ?? .未定義
            if var modelList = dic[type] {
                modelList.append(model)
                dic[type] = modelList
            } else {
                dic[type] = [model]
            }
        }
        UserDefaults.standard.setObjectToUserDefault(dic, forKey: "PublicBaseDataAPIModelListDic")
    }
}
