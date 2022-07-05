//
//  ChangeInfo.swift
//  GBShop
//
//  Created by Денис Ледовский on 19.06.2022.
//

import Foundation
import Alamofire

class ChangeInfo: AbstractRequestFactory {

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

extension ChangeInfo: ChangeInfoRequestFactory {

    func changeInfo(idUser: Int, username: String, password: String,
                  email: String, gender: String, creditCard: String, bio: String,
                  completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void) {
        let requestModel = Change(baseUrl: baseUrl, userID: idUser, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeInfo {

    struct Change: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "change"
        let userID: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userID,
                "username" : username,
                "password" : password,
                "email" : email,
                "gender": gender,
                "credit_card" : creditCard,
                "bio" : bio
            ]
        }
    }
}
