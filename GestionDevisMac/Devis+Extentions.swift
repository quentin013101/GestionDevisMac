import Foundation
import CoreData

extension Devis {
    var statut: StatutDevis {
        get {
            return StatutDevis(rawValue: statutRaw ?? "Brouillon") ?? .brouillon
        }
        set {
            statutRaw = newValue.rawValue
        }
    }
}
