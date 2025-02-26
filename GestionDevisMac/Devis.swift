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

    init(client: Client, prestations: [Prestation], statut: StatutDevis, remise: Double, fraisAnnexes: Double, dateCreation: Date) {
        self.client = client
        self.prestations = prestations
        self.statut = statut
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

// MARK: - Enum StatutDevis
enum StatutDevis: String, CaseIterable {
    case brouillon = "Brouillon"
    case envoye = "Envoyé"
    case accepte = "Accepté"
    case refuse = "Refusé"
}

// MARK: - Extension Core Data (Si applicable)
extension Devis {
    var statut: StatutDevis {
        get { StatutDevis(rawValue: statutRaw ?? "Brouillon") ?? .brouillon }
        set { statutRaw = newValue.rawValue }
    }
}
