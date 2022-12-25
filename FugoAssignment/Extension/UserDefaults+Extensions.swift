//
//  UserDefaults+Extensions.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/26.
//

import Foundation

extension UserDefaults {
    func setObjectToUserDefault<Object>(_ object: Object, forKey: String) where Object: Encodable {
        
        guard let data = try? JSONEncoder().encode(object) else { return }
        set(data, forKey: forKey)
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) -> Object? where Object: Decodable {
        guard let data = data(forKey: forKey),
              let object = try? JSONDecoder().decode(type, from: data) else { return nil }
        return object
    }
}
