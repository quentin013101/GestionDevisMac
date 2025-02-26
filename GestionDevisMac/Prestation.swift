import Foundation
import CoreData

// MARK: - Prestation
struct PrestationModel: Identifiable {
    var id: UUID = UUID()
    var description: String
    var prixUnitaire: Double
    var unite: String // H, m², m³, Kg, unité, etc.
}

