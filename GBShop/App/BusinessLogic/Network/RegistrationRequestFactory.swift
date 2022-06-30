//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 19.06.2022.
//

import Foundation
import Alamofire

protocol RegistartionRequestFactory {

    func register(idUser: Int,
                  username: String,
                  password: String,
                  email: String,
                  gender: String,
                  creditCard: String,
                  bio: String,
                  completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void)
}




