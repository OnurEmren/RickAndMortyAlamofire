//
//  AppDelegate.swift
//  RickAndMortyAlamofire
//
//  Created by Onur Emren on 17.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var characterCoordinator: CharacterCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        characterCoordinator = CharacterCoordinator()
        characterCoordinator?.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = characterCoordinator?.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

