import SwiftUI
import Combine

class PrestationViewModel: ObservableObject {
    @Published var prestations: [Prestation] = []
    
    func ajouterPrestation(_ nouvellePrestation: Prestation) {
        prestations.append(nouvellePrestation)
        DatabaseManager.shared.saveContext()
    }
}
