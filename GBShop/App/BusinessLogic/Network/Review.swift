//
//  Review.swift
//  GBShop
//
//  Created by Денис Ледовский on 05.07.2022.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory {

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://secure-basin-15400.herokuapp.com/")!

    init (
        errorParser: AbstractErrorParser,
        sessinManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessinManager
            self.queue = queue
        }
}

extension Review: ReviewsRequestFactory {

    func getAllReviews(pageNumber: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<AllReviewResult>) -> Void) {
        let requestModel = AllReviews(baseUrl: baseUrl, pageNumber: pageNumber, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func addReview(idUser: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReview(baseUrl: baseUrl, idUser: idUser, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReview(baseUrl: baseUrl, idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension Review {

    struct AllReviews: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "allreview"
        let pageNumber: Int
        let idProduct: Int

        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_product": idProduct
            ]
        }
    }

    struct AddReview: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "addreview"
        let idUser: Int
        let text: String

        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "text": text
            ]
        }
    }

    struct RemoveReview: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "removereview"
        let idComment: Int

        var parameters: Parameters? {
            return [
                "id_comment": idComment
            ]
        }
    }


}
