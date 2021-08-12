//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    static let shared = ChatClient()
    
    func fetchChatData(completion: @escaping ([Message]) -> Void, error errorHandler: @escaping (String?) -> Void) {
        
        let URLString = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
        guard let url = URL(string: URLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let error = err {
                print("Error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Response: \(String(describing: response))")
                return
            }
            
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode(Data.self, from: data)
                let messages = jsonData.data
                completion(messages)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}
