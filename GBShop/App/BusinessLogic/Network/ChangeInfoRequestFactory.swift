//
//  ChangeInfoRequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 19.06.2022.
//

import Foundation
import Alamofire

protocol ChangeInfoRequestFactory {

    func changeInfo(idUser: Int,
                  username: String,
                  password: String,
                  email: String,
                  gender: String,
                  creditCard: String,
                  bio: String,
                  completionHandler: @escaping (AFDataResponse<ChangeResult>) -> Void)
}
