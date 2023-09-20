//
//  CoreDataManager.swift
//  Investopedia
//
//  Created by João Ponte on 15/09/2023.
//

import CoreData

//class CoreDataManager: Database {
//    // Use the existing CoreDataStack context
//    private let context = CoreDataStack.context
//    
//    // MARK: - Database Protocol Methods
//    
//    func fetchData(completion: @escaping ([CryptoCurrency]?) -> Void) {
//        let fetchRequest: NSFetchRequest<CryptoCurrencyEntity> = CryptoCurrencyEntity.fetchRequest()
//        
//        do {
//            let cryptoEntities = try context.fetch(fetchRequest)
//            let cryptoCurrencies = cryptoEntities.compactMap { CryptoCurrency(entity: $0) }
//            completion(cryptoCurrencies)
//        } catch {
//            print("Error fetching data from Core Data: \(error)")
//            completion(nil)
//        }
//    }
//    func save() {
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Can not save context \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//}
