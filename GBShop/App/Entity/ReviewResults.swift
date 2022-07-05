//
//  ReviewResults.swift
//  GBShop
//
//  Created by Денис Ледовский on 05.07.2022.
//

import Foundation

struct AllReviewResult: Codable {
    var result: Int
    var page_number: Int
    var reviews: [String]
}

struct AddReviewResult: Codable {
    var result: Int
    var user_message: String
}

struct RemoveReviewResult: Codable {
    var result: Int
}


