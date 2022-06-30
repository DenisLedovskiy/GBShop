//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 30.06.2022.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {

    func getProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
