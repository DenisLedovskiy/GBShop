//
//  AllProdacts.swift
//  GBShop
//
//  Created by Денис Ледовский on 30.06.2022.
//

import Foundation
import Alamofire

class AllProducts: AbstractRequestFactory {

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

extension AllProducts: AllProductsRequestFactory {

    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[ProductsResult]>) -> Void) {
        let requestModel = GetAllProducts(baseUrl: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AllProducts {
    struct GetAllProducts: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "catalog"
        let pageNumber: Int
        let categoryId: Int

        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}
