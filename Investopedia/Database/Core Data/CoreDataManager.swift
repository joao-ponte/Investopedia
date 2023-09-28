//
//  CoreDataManager.swift
//  Investopedia
//
//  Created by João Ponte on 15/09/2023.
//

import CoreData

class CoreDataManager: Database {
    
    var favourites: [CryptoCurrencyEntity]? { try? context.fetch(CryptoCurrencyEntity.fetchRequest()) }
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
    }
    
    func removeCryptoFromFavorites(crypto: CryptoCurrencyEntity) {
        context.delete(crypto)
        save()
    }
    
    func getFavorites() -> [CryptoCurrencyEntity]? {
        return favourites
    }
    
    func updateFavoriteCrypto(updatedCrypto: CryptoCurrency, existingCrypto: CryptoCurrencyEntity) {
        existingCrypto.id = updatedCrypto.id
        existingCrypto.rank = updatedCrypto.rank
        existingCrypto.symbol = updatedCrypto.symbol
        existingCrypto.name = updatedCrypto.name
        existingCrypto.supply = updatedCrypto.supply
        existingCrypto.maxSupply = updatedCrypto.maxSupply
        existingCrypto.marketCapUsd = updatedCrypto.marketCapUsd
        existingCrypto.volumeUsd24Hr = updatedCrypto.volumeUsd24Hr
        existingCrypto.priceUsd = updatedCrypto.priceUsd
        existingCrypto.changePercent24Hr = updatedCrypto.changePercent24Hr
        existingCrypto.vwap24Hr = updatedCrypto.vwap24Hr
        existingCrypto.explorer = updatedCrypto.explorer
        
        save()
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
