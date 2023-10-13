//
//  CoreDataManager.swift
//  Investopedia
//
//  Created by João Ponte on 15/09/2023.
//

import CoreData

class CoreDataManager: Database {
    
    var cryptoCurrencies: [CryptoCurrencyEntity]? { 
        try? context.fetch(CryptoCurrencyEntity.fetchRequest()) }
    
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
    
    func findCryptoEntity(for id: String) -> CryptoCurrencyEntity? {
        let fetchRequest: NSFetchRequest<CryptoCurrencyEntity> = CryptoCurrencyEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)

        do {
            let result = try context.fetch(fetchRequest)
            return result.first
        } catch {
            print("Error fetching CryptoCurrencyEntity by id: \(error)")
            return nil
        }
    }

    func updateCoreData(with cryptoData: CryptoCurrency) {
        guard let cryptoEntity = findCryptoEntity(for: cryptoData.id) else {
            return
        }

        cryptoEntity.rank = cryptoData.rank
        cryptoEntity.symbol = cryptoData.symbol
        cryptoEntity.name = cryptoData.name
        cryptoEntity.supply = cryptoData.supply
        cryptoEntity.maxSupply = cryptoData.maxSupply
        cryptoEntity.marketCapUsd = cryptoData.marketCapUsd
        cryptoEntity.volumeUsd24Hr = cryptoData.volumeUsd24Hr
        cryptoEntity.priceUsd = cryptoData.priceUsd
        cryptoEntity.changePercent24Hr = cryptoData.changePercent24Hr
        cryptoEntity.vwap24Hr = cryptoData.vwap24Hr
        cryptoEntity.explorer = cryptoData.explorer

        save()
    }
    
    
    
    func removeCryptoFromFavorites(crypto: CryptoCurrencyEntity) {
        print("Crypto removing from favorites: \(crypto.name ?? "Unknown Crypto")")
        context.delete(crypto)
        save()
        print("Crypto removed from favorites: \(crypto.name ?? "Unknown Crypto")")
    }
    
    func getFavourites() -> [CryptoCurrencyEntity]? {
        return cryptoCurrencies
    }
    // MARK: - Helper functions
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                if let nserror = error as? NSError {
                    if nserror.domain == NSCocoaErrorDomain && nserror.code == NSValidationMissingMandatoryPropertyError {
                        print("Received nil data from API. Skipping save for now.")
                    } else {
                        fatalError("Error saving context: \(error), \(nserror.userInfo)")
                    }
                }
            }
        }
    }
}
