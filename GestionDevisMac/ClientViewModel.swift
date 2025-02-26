import SwiftUI
import Combine
import Foundation
import CoreData

class ClientViewModel: ObservableObject {
    @Published var clients: [Client] = []
    
    func ajouterClient(_ nouveauClient: Client) {
        clients.append(nouveauClient)
        DatabaseManager.shared.saveContext() // Correction ici
    }
}

