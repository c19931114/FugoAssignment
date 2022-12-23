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
        apiManager.fetchAPIData(query: "/t187ap03_P") { data, error in
            completion(true)
        }
    }
}
