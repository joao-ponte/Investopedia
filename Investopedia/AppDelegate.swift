//
//  AppDelegate.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var networkManager: NetworkManagerProtocol?
    var database: Database?
    var timer: Timer?
    let networkUtility = NetworkUtility()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        networkManager = NetworkManager()
        database = CoreDataManager()
        networkUtility.delegate = self
        networkUtility.startMonitoring()

        
        startDataUpdateTimer()
        
        return true
    }
    
    // MARK: - UISceneSession Lifecycle
    
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
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        timer?.invalidate()
        timer = nil
    }
    
    private func startDataUpdateTimer() {
        // Schedule a timer to update data every 40 seconds
        timer = Timer.scheduledTimer(withTimeInterval: 40, repeats: true) { [weak self] _ in
            // Fetch data for specific cryptocurrencies and update Core Data
            if let cryptoIDsToUpdate = self?.database?.getFavourites()?.compactMap({ $0.id }) {
                for cryptoID in cryptoIDsToUpdate {
                    self?.networkManager?.requestCryptoCurrencyData(for: cryptoID) { result in
                        switch result {
                        case .success(let cryptoData):
                            self?.database?.updateCoreData(with: cryptoData.data)
                        case .failure(let error):
                            print("Failed to update data for \(cryptoID): \(error)")
                        }
                    }
                }
            }
        }
    }
}

extension AppDelegate: NetworkUtilityDelegate {
    func networkStatusDidChange(isConnected: Bool) {
        if !isConnected {
            DispatchQueue.main.async {
                // Show your alert here
                let rootViewController = UIApplication.shared.windows.first?.rootViewController
                Alert.basicAlert(title: "No Internet Connection", message: "Please check your internet connection.", vc: rootViewController ?? UIViewController())
            }
        }
    }
}
