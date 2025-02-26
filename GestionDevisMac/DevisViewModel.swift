import SwiftUI
import Combine

class DevisViewModel: ObservableObject {
    @Published var devis: [Devis] = []
    
    func ajouterDevis(_ nouveauDevis: Devis) {
        devis.append(nouveauDevis)
        // Sauvegarde dans Core Data
        DatabaseManager.shared.saveContext()
    }
}
