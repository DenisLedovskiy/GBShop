//
//  RegisterUser.swift
//  GBShop
//
//  Created by Денис Ледовский on 12.06.2022.
//

import Foundation

struct RegisterResult: Codable {
    let result: Int
    let userMessage: String
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
        case errorMessage = "error_message"
    }
}
