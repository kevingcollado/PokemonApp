//
//  AppDelegate.swift
//  PokemonApp
//
//  Created by Kevin Gustavo Collado on 10/12/23.
//

import UIKit

//Cambiar @main por @UIApplicationMain
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //Variable window para presentar datos en pantalla
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //
        let window = UIWindow(frame: UIScreen.main.bounds)
        ///Añadir Control de navegación y pasar MainViewController como controlador de vista inicial
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    //Se elimina SceneDelegate y ciclo de vida.
}

