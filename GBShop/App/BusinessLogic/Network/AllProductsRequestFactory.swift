//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Денис Ледовский on 30.06.2022.
//

import Foundation
import Alamofire

protocol AllProductsRequestFactory {

    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[ProductsResult]>) -> Void)
}
