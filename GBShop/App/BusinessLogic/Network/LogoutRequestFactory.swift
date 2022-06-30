//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 18.06.2022.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {

    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}

