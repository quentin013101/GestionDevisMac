import SwiftUI
import CoreData

struct PrestationListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Prestation.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Prestation.nom, ascending: true)]
    ) private var prestations: FetchedResults<Prestation>

    var body: some View {
        NavigationView {
            VStack {
                Text("Liste des Prestations")
                    .font(.title)
                    .padding()

                NavigationLink(destination: AddPrestationView()) { // ✅ Bouton pour ajouter une prestation
                    Text("Ajouter une Prestation")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                List {
                    ForEach(prestations, id: \.objectID) { prestation in
                        HStack {
                            Text(prestation.nom ?? "Sans nom")
                                .font(.headline)
                            Spacer()
                            Text("\(String(format: "%.2f", prestation.prixUnitaire)) €")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Prestations")
        }
    }
}

#Preview {
    PrestationListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
