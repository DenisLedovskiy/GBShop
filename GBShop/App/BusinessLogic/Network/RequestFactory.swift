//
//  RequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 12.06.2022.
//

import Foundation
import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    func makeRegistartionRequestFactory() -> RegistartionRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    func makeChangeInfoRequestFactory() -> ChangeInfoRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeInfo(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    func makeAllProductsRequestFactory() -> AllProductsRequestFactory {
        let errorParser = makeErrorParser()
        return AllProducts(errorParser: errorParser, sessinManager: commonSession, queue: sessionQueue)
    }

    func makeOneProductRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return Product(errorParser: errorParser, sessinManager: commonSession, queue: sessionQueue)
    }

    func makeReviewsRequestFactory() -> ReviewsRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser, sessinManager: commonSession, queue: sessionQueue)
    }
}
