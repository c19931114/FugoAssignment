//
//  CompanyDetailViewModel.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/30.
//

import Foundation

class CompanyDetailViewModel {
    
    let model: PublicBaseDataAPIModel
    var cellModels: [[String: Any?]] = []
    
    var isFollowed: Bool {
        FollowedListManager.shared.isFollowed(model: model)
    }
    
    init(model: PublicBaseDataAPIModel) {
        self.model = model
        self.cellModels = convertToArray()
    }
    
    func updataFollowedList(completion: ((Bool) -> Void)) {
        FollowedListManager.shared.updataFollowedList(model: model, completion: completion)
    }
    
    private func convertToArray() -> [[String: Any?]] {
        do {
            let dic = try DictionaryEncoder.encode(model)
            let arr = dic.map { [$0: $1] }
            return arr
        } catch _  {
            return []
        }
    }
}

struct DictionaryEncoder {
    static func encode<T>(_ value: T) throws -> [String: Any] where T: Encodable {
        let jsonData = try JSONEncoder().encode(value)
        return try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]
    }
}
