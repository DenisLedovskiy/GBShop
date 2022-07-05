//
//  ReviewsRequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 05.07.2022.
//

import Foundation
import Alamofire

protocol ReviewsRequestFactory {

    func getAllReviews(pageNumber: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<AllReviewResult>) -> Void)

    func addReview(idUser: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)

    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
}
