//
//  AppDelegate.swift
//  Sample
//
//  Created by matheus.filipe.bispo on 09/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//
import CardDetailModule
import Entities

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = CardDetailModuleBuilder.buildRoot(card: Card(id: "", name: "", imageUrl: ""))
        viewController.delegate = self
        window.rootViewController = viewController

        self.window = window
        window.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}

extension AppDelegate: CardDetailControllerDelegate {
    func didFavoriteButtonWasTapped(card: Card) {
        print("favoritei")
    }
}
