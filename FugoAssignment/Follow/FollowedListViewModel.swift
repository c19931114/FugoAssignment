//
//  FollowedListViewModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/29.
//

import Foundation

class FollowedListViewModel {
    
    var list: [PublicBaseDataAPIModel] {
        getFollewedList()
    }
    
    private func getFollewedList() -> [PublicBaseDataAPIModel] {
        FollowedListManager.shared.list
    }
    
}

class FollowedListManager {
    
    static let shared = FollowedListManager()
    
    var list: [PublicBaseDataAPIModel] {
        getFollewedList()
    }
        
    private func getFollewedList() -> [PublicBaseDataAPIModel] {
        let list = UserDefaults.standard.getObject(forKey: "FollowedDataModelList", castTo: [PublicBaseDataAPIModel].self) ?? []
        return list
    }
    
    func isFollowed(model: PublicBaseDataAPIModel) -> Bool {
        return list.contains { $0 == model }        
    }
    
    func updataFollowedList(model: PublicBaseDataAPIModel, 
                            completion: ((Bool) -> Void)) {
        var currentList = list
        if isFollowed(model: model) {
            if let index = currentList.firstIndex(of: model) {
                currentList.remove(at: index)
                completion(false)
            }
        } else {
            currentList.append(model)
            completion(true)
        }
        UserDefaults.standard.setObjectToUserDefault(currentList, forKey: "FollowedDataModelList")
    }
}
