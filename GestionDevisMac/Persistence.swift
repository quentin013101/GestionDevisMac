import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "GestionDevisMac") // Remplace par le nom exact de ton modèle Core Data
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Erreur lors du chargement de Core Data: \(error), \(error.userInfo)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }
}
