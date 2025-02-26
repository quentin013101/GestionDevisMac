import SwiftUI

struct PrestationListView: View {
    @State private var prestations: [Prestation] = [
        Prestation(description: "Réparation toiture", prixUnitaire: 500, unite: "m²"),
        Prestation(description: "Peinture murale", prixUnitaire: 300, unite: "m²")
    ]
    
    var body: some View {
        VStack {
            Text("Liste des Prestations")
                .font(.title)
                .padding()
            
            List(prestations) { prestation in
                HStack {
                    Text(prestation.description)
                        .font(.headline)
                    Spacer()
                    Text("\(prestation.prixUnitaire, specifier: "%.2f") €/\(prestation.unite)")
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
    }
}

#Preview {
    PrestationListView()
}
