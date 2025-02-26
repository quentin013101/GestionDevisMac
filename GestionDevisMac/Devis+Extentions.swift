import Foundation
import CoreData

extension Devis {
    // Permet d'accéder à remiseRaw comme un Double
    var remise: Double {
        get { remiseRaw } // Récupère la valeur
        set { remiseRaw = newValue } // Modifie la valeur
    }

    // Permet d'accéder à fraisAnnexesRaw comme un Double
    var fraisAnnexes: Double {
        get { fraisAnnexesRaw }
        set { fraisAnnexesRaw = newValue }
    }

    // Convertit `prestations` (Core Data) en un tableau Swift
    var prestationsArray: [Prestation] {
        let set = prestations as? Set<Prestation> ?? [] // Convertit NSSet en Set
        return Array(set) // Transforme Set en tableau
    }

    // Fonction qui convertit un `Devis` (Core Data) en `DevisModel` (Swift)
    var toDevisModel: DevisModel {
        return DevisModel(
            client: client!, // Attention, on force unwrap, assure-toi que client n'est jamais nil
            prestations: prestationsArray,
            remise: remise,
            fraisAnnexes: fraisAnnexes,
            dateCreation: dateCreation ?? Date() // Si la date est nil, on met la date actuelle
        )
    }
}
