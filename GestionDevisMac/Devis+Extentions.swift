import Foundation
import CoreData

extension Devis {
    @NSManaged public var client: Client?
    var statut: StatutDevis {
        get {
            return StatutDevis(rawValue: statutRaw ?? "Brouillon") ?? .brouillon
        }
        set {
            statutRaw = newValue.rawValue
        }
    }
}
