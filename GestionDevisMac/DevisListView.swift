import SwiftUI

struct DevisListView: View {
    @State private var devisList: [Devis] = [
        Devis(client: Client(nom: "Jean Dupont", email: "jean@example.com", telephone: "0612345678", adresse: "10 rue de Paris"),
              prestations: [Prestation(description: "Réparation toiture", prixUnitaire: 500, unite: "m²")],
              statut: .brouillon, remise: 0, fraisAnnexes: 50, dateCreation: Date()),
        
        Devis(client: Client(nom: "Sophie Martin", email: "sophie@example.com", telephone: "0698765432", adresse: "15 avenue Lyon"),
              prestations: [Prestation(description: "Peinture murale", prixUnitaire: 300, unite: "m²")],
              statut: .envoye, remise: 10, fraisAnnexes: 30, dateCreation: Date())
    ]
    
    var body: some View {
        VStack {
            Text("Liste des Devis")
                .font(.title)
                .padding()
            
            List(devisList) { devis in
                HStack {
                    Text(devis.client.nom)
                        .font(.headline)
                    Spacer()
                    Text("\(devis.montantTTC, specifier: "%.2f") €")
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
    }
}

#Preview {
    DevisListView()
}
