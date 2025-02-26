import Foundation
import CoreData

// MARK: - Devis
struct Devis: Identifiable {
    var id: UUID = UUID()
    var client: Client
    var prestations: [Prestation]
    var statut: StatutDevis
    var remise: Double
    var fraisAnnexes: Double
    var dateCreation: Date
    
    // Ajout d'un init si nécessaire
        init(client: Client, prestations: [Prestation], statut: String, remise: Double, fraisAnnexes: Double, dateCreation: Date) {
            self.client = client
            self.prestations = prestations
            self.statut = statut
            self.remise = remise
            self.fraisAnnexes = fraisAnnexes
            self.dateCreation = dateCreation

    // Calculs automatiques
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

enum StatutDevis: String, CaseIterable {
    case brouillon = "Brouillon"
    case envoye = "Envoyé"
    case accepte = "Accepté"
    case refuse = "Refusé"
    

    extension Devis {
        var statut: StatutDevis {
            get { StatutDevis(rawValue: statutRaw ?? "Brouillon") ?? .brouillon }
            set { statutRaw = newValue.rawValue }
        }
    } 
