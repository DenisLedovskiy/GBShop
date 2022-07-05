//
//  Product.swift
//  GBShop
//
//  Created by Денис Ледовский on 30.06.2022.
//

import Foundation
import Alamofire

class Product: AbstractRequestFactory {

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

extension Product: ProductRequestFactory {

    func getProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = GetOneProduct(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Product {
    struct GetOneProduct: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .post
        var path: String = "product"
        let idProduct: Int

        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}
