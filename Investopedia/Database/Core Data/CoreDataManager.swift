//
//  CoreDataManager.swift
//  Investopedia
//
//  Created by João Ponte on 15/09/2023.
//

import CoreData

class CoreDataManager: Database {
    
    var cryptoCurrencies: [CryptoCurrencyEntity]? { try? context.fetch(CryptoCurrencyEntity.fetchRequest()) }
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = CoreDataStack.context) {
        self.context = context
    }
    
    func addCryptoToFavorites(crypto: CryptoCurrency) {
        let newCrypto = CryptoCurrencyEntity(context: context)
        newCrypto.id = crypto.id
        newCrypto.rank = crypto.rank
        newCrypto.symbol = crypto.symbol
        newCrypto.name = crypto.name
        newCrypto.supply = crypto.supply
        newCrypto.maxSupply = crypto.maxSupply
        newCrypto.marketCapUsd = crypto.marketCapUsd
        newCrypto.volumeUsd24Hr = crypto.volumeUsd24Hr
        newCrypto.priceUsd = crypto.priceUsd
        newCrypto.changePercent24Hr = crypto.changePercent24Hr
        newCrypto.vwap24Hr = crypto.vwap24Hr
        newCrypto.explorer = crypto.explorer
        
        save()
        print("Crypto added to favorites: \(newCrypto.name ?? "Unknown Crypto")")
    }
    
    func removeCryptoFromFavorites(crypto: CryptoCurrencyEntity) {
        print("Crypto removing from favorites: \(crypto.name ?? "Unknown Crypto")")
        context.delete(crypto)
        save()
        print("Crypto removed from favorites: \(crypto.name ?? "Unknown Crypto")")
    }
    
    func getFavorites() -> [CryptoCurrencyEntity]? {
        return cryptoCurrencies
    }
    
    // MARK: - Helper functions
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Can not save context \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
