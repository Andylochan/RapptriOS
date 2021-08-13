//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
    static let shared = LoginClient()
    
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        
        let jsonUrlString = "http://dev.rapptrlabs.com/Tests/scripts/login.php?email=\(email)&password=\(password)"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) 
        
    }
}
//
//func fetchChatData(completion: @escaping ([Message]) -> Void, error errorHandler: @escaping (String?) -> Void) {
//
//    let URLString = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
//    guard let url = URL(string: URLString) else { return }
//
//    URLSession.shared.dataTask(with: url) { (data, response, err) in
//        if let error = err {
//            print("Error: \(error)")
//            return
//        }
//        guard let httpResponse = response as? HTTPURLResponse,
//              (200...299).contains(httpResponse.statusCode) else {
//            print("Response: \(String(describing: response))")
//            return
//        }
//
//        guard let data = data else { return }
//        do {
//            let jsonData = try JSONDecoder().decode(Data.self, from: data)
//            let messages = jsonData.data
//            completion(messages)
//        } catch let jsonErr {
//            print("Error serializing json:", jsonErr)
//        }
//    }.resume()
//}
