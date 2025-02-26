import Foundation
import CoreData

// MARK: - DevisModel
struct DevisModel: Identifiable {
    var id: UUID = UUID()
    var client: Client
    var prestations: [Prestation]
    var remise: Double
    var fraisAnnexes: Double
    var dateCreation: Date

    init(client: Client, prestations: [Prestation], remise: Double, fraisAnnexes: Double, dateCreation: Date) {
        self.client = client
        self.prestations = prestations
        self.remise = Double(remiseRaw ?? "0") ?? 0.0
        self.fraisAnnexes = Double(fraisAnnexesRaw ?? "0") ?? 0.0
        self.dateCreation = dateCreation
    }

    var montantHT: Double {
        prestations.reduce(0) { $0 + $1.prixUnitaire }
    }

    var montantTVA: Double {
        montantHT * 0.2 // Exemple de TVA à 20%
    }

    var montantTTC: Double {
        montantHT + montantTVA + fraisAnnexes - remise
    }
}
