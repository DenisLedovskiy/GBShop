//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Денис Ледовский on 10.06.2022.
//

import XCTest
import Alamofire
@testable import GBShop

class RequestsTests: XCTestCase {
    
    var requestFactory: RequestFactory!
    var id: Int!
    var login: String!
    var password: String!
    var username: String!
    var lastname: String!
    var email: String!
    var gender: String!
    var creditCard: String!
    var bio: String!
    var pageNumber: Int!
    var categoryId: Int!
    var idProduct: Int!
    var idComment: Int!
    var text: String!

    let expectation = XCTestExpectation(description: "Request")
    let timeoutValu = 10.0


    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        id = 123
        login = "Somebody"
        password = "mypassword"
        username = "John"
        lastname = "Doe"
        email = "some@some.ru"
        gender = "m"
        creditCard = "9872389-2424-234224-234"
        bio = "This is good! I think I will switch to another language"
        pageNumber = 1
        categoryId = 1
        idProduct = 123
        idComment = 12
        text = "Отлично"
    }

    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        id = nil
        login = nil
        password = nil
        username = nil
        lastname = nil
        email = nil
        gender = nil
        creditCard = nil
        bio = nil
        pageNumber = nil
        categoryId = nil
        idProduct = nil
        idComment = nil
        text = nil
    }

    func testShouldPerformAuthRequest() {
        let factory = requestFactory.makeAuthRequestFatory()
        factory.login(userName: username, password: password) { [weak self] response in
            
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

    func testShouldPerformRegistRequest() {
        let factory = requestFactory.makeRegistartionRequestFactory()
        factory.register(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

    func testShouldPerformLogoutRequest() {
        let factory = requestFactory.makeLogoutRequestFactory()
        factory.logout(idUser: id) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

    func testShouldPerformChangeInfoRequest() {
        let factory = requestFactory.makeChangeInfoRequestFactory()
        factory.changeInfo(idUser: id, username: username, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }


    func testShouldPerformAllProductsRequest() {
        let factory = requestFactory.makeAllProductsRequestFactory()
        factory.getCatalog(pageNumber: pageNumber, categoryId: categoryId) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result[0].idProduct, 123)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

    func testShouldPerformOneProductRequest() {
        let factory = requestFactory.makeOneProductRequestFactory()
        factory.getProduct(idProduct: idProduct) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

    func testShouldPerformAllReviews() {
        let factory = requestFactory.makeReviewsRequestFactory()
        factory.getAllReviews(pageNumber: pageNumber, idProduct: idProduct) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

    func testShouldAddReview() {
        let factory = requestFactory.makeReviewsRequestFactory()
        factory.addReview(idUser: id, text: text) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

    func testShouldRemoveReview() {
        let factory = requestFactory.makeReviewsRequestFactory()
        factory.removeReview(idComment: idComment) { [weak self] response in

            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }

}
