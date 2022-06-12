//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 11.06.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {

    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
