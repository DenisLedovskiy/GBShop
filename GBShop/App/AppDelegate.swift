//
//  AppDelegate.swift
//  GBShop
//
//  Created by Денис Ледовский on 10.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory()
// Нужен новый реквест
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let auth = requestFactory.makeAuthRequestFatory()
        let logout = requestFactory.makeLogoutRequestFactory()
        let registration = requestFactory.makeRegistartionRequestFactory()
        let changeUserData = requestFactory.makeChangeInfoRequestFactory()
        let allProducts = requestFactory.makeAllProductsRequestFactory()
        let product = requestFactory.makeOneProductRequestFactory()

        auth.login(userName: "Somebody", password: "mypassword") {
            response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        logout.logout(idUser: 123) {
            response in
            switch response.result {
            case .success(let exit):
                print(exit)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        registration.register(idUser: 123, username: "Somebody", password: "mypassword", email: "some@some.ru",
                              gender: "m", creditCard: "9872389-2424-234224-234",
                              bio: "This is good! I think I will switch to another language") {
            response in
            switch response.result {
            case .success(let reg):
                print(reg)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        changeUserData.changeInfo(idUser: 123, username: "Somebody", password: "mypassword", email: "some@some.ru",
                              gender: "m", creditCard: "9872389-2424-234224-234",
                              bio: "This is good! I think I will switch to another language") {
            response in
            switch response.result {
            case .success(let change):
                print(change)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        allProducts.getCatalog(pageNumber: 1, categoryId: 1) {
            response in
            switch response.result {
            case .success(let rezult):
                print(rezult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }


        product.getProduct(idProduct: 123) {
            response in
            switch response.result {
            case .success(let rezult):
                print(rezult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

