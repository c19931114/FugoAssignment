//
//  CompanyDetailViewModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/30.
//

import Foundation

class CompanyDetailViewModel {
    let model: PublicBaseDataAPIModel
    var isFollowed: Bool {
        FollowedListManager.shared.isFollowed(model: model)
    }
    
    init(model: PublicBaseDataAPIModel) {
        self.model = model
    }
    
    func updataFollowedList(completion: ((Bool) -> Void)) {
        FollowedListManager.shared.updataFollowedList(model: model, completion: completion)
    }
}
