//
//  APIManager.swift
//  FugoAssignment
//
//  Created by Crystal on 2022/12/23.
//

import Foundation

class APIManager {
    
    private let baseURL: URL = URL(string: "https://openapi.twse.com.tw/v1/opendata")!
    
    let session: URLSession = URLSession(configuration: .default)
    
    typealias APICompletionHandler = ([PublicBaseDataAPIModel]?, Error?) -> Void
    
    func fetchAPIData(query: String,
                      completion: @escaping APICompletionHandler) {
        guard let request = buildRequest(query: query) else { return }
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else { return }
                    if httpResponse.statusCode == 200 {
                        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
                        let filename: String = httpResponse.suggestedFilename ?? "default"
                        let fileURL = documentsDirectory.appendingPathComponent(filename)
                        (data as NSData).write(toFile: fileURL, atomically: true)
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: fileURL), options: .mappedIfSafe)
                            let apiData = try JSONDecoder().decode([PublicBaseDataAPIModel].self, from: data)
                            completion(apiData, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        print(httpResponse.statusCode)
                        completion(nil, error)
                    }
                } else if let error = error {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
    
    private func buildRequest(query: String) -> URLRequest? {
        let baseURL = baseURL.appendingPathComponent(query)
        guard let components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else { return nil }
        guard let url = components.url else { return nil }
        return buildRequest(url: url)
    }
    
    private func buildRequest(url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
}
