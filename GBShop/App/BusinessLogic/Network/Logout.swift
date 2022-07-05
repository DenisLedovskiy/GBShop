//
//  Logout.swift
//  GBShop
//
//  Created by Денис Ледовский on 18.06.2022.
//

import Foundation
import Alamofire

class Logout: AbstractRequestFactory {

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://secure-basin-15400.herokuapp.com/")!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Logout: LogoutRequestFactory {

    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Exit(baseUrl: baseUrl, userID: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {

    struct Exit: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "logout"
        let userID: Int
        var parameters: Parameters? {
            return [
                "id_user": userID
            ]
        }
    }
}
