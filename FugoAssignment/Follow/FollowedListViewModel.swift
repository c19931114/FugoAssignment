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
    
    func updataFollowedList(model: PublicBaseDataAPIModel, 
                            completion: ((Bool) -> Void)) {
        FollowedListManager.shared.updataFollowedList(model: model, completion: completion)
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
        
        let isFollowed = isFollowed(model: model)
        if isFollowed, let index = currentList.firstIndex(of: model) {
            currentList.remove(at: index)
        } else {
            currentList.append(model)
        }
        
        UserDefaults.standard.setObjectToUserDefault(currentList, forKey: "FollowedDataModelList")
        completion(!isFollowed)
        
    }
}
