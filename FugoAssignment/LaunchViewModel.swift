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
        apiManager.fetchAPIData(query: "/t187ap03_P") { [weak self] data, error in
            guard let data = data else { 
                completion(false)
                return
            }
            self?.transferData(data)
            completion(true)
        }
    }
    
    func transferData(_ data: [PublicBaseDataAPIModel]) {
        var array = data
        array.sort { a, b in
            a.產業別?.rawValue ?? "XX" < b.產業別?.rawValue ?? "XX"
        }
        print(array)
    }
    
//    func getTypeSet(from data: [PublicBaseDataAPIModel]) {
//        var someSet: Set<TSE>
//        return Set(<#T##sequence: Sequence##Sequence#>)
//    }
}

