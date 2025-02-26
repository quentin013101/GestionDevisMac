import CoreData

class DatabaseManager {
    static let shared = DatabaseManager()
    
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "GestionDevisMac") // Vérifie le nom de ton modèle Core Data (.xcdatamodeld)
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Erreur lors du chargement de Core Data: \(error), \(error.userInfo)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // ✅ Méthode correcte pour sauvegarder le contexte
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Erreur lors de la sauvegarde du contexte: \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
