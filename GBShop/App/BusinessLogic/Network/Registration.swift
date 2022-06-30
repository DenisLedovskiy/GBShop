//
//  Registration.swift
//  GBShop
//
//  Created by Денис Ледовский on 19.06.2022.
//

import Foundation
import Alamofire

class Registration: AbstractRequestFactory {

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Registration: RegistartionRequestFactory {

    func register(idUser: Int, username: String, password: String,
                  email: String, gender: String, creditCard: String, bio: String,
                  completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) {
        let requestModel = Reg(baseUrl: baseUrl, userID: idUser, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Registration {

    struct Reg: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
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
                "username": username,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
