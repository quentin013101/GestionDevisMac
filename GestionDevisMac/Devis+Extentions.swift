import Foundation
import CoreData

extension Devis {
    public var id: UUID {
        self.objectID.uriRepresentation().uuid
    }
    var statut: StatutDevis {
        get { StatutDevis(rawValue: statutRaw ?? "Brouillon") ?? .brouillon }
        set { statutRaw = newValue.rawValue }
    }
    
    var remise: Double {
        get { Double(remiseRaw ?? "0") ?? 0.0 }
        set { remiseRaw = String(newValue) }
    }
    
    var fraisAnnexes: Double {
        get { Double(fraisAnnexesRaw ?? "0") ?? 0.0 }
        set { fraisAnnexesRaw = String(newValue) }
    }
}

