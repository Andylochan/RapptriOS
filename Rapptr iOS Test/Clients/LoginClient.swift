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

// http://dev.rapptrlabs.com/Tests/scripts/login.php?email=info@rapptrlabs.com&password=Test123

class LoginClient {
    static let shared = LoginClient()
    
    func login(email: String, password: String, completion: @escaping (String) -> Void, error errorHandler: @escaping (String?) -> Void) {
        let start = CFAbsoluteTimeGetCurrent()
        
        let url = String(format: "http://dev.rapptrlabs.com/Tests/scripts/login.php")
        guard let serviceUrl = URL(string: url) else { return }
        let parameters: [String: Any] = [
            "email" : email,
            "password": password
        ]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("res:", response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("json:", json)
                    
                    let diff = CFAbsoluteTimeGetCurrent() - start
                    let diffToMilli = diff * 1000
                    let diffFormated = String(format: "%.0f", diffToMilli)
                    
                    completion("\(diffFormated)")
                } catch {
                    errorHandler(error.localizedDescription)
                }
            }
        }.resume()
    }
}
