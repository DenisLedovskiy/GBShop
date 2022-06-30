//
//  ProductResult.swift
//  GBShop
//
//  Created by Денис Ледовский on 30.06.2022.
//

import Foundation

struct AllProductsResult: Codable {
    let pageNumber: Int
    let products: [ProductsResult]

    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products
    }
}

struct ProductsResult: Codable {
    let idProduct: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
    }
}
