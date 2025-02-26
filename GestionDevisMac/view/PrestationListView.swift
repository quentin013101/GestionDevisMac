import SwiftUI
import CoreData

struct PrestationListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Prestation.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Prestation.nom, ascending: true)]
    ) private var prestations: FetchedResults<Prestation>

    @State private var showAddPrestationSheet = false // ✅ État pour afficher la pop-up

    var body: some View {
        NavigationView {
            VStack {
                Text("Liste des Prestations")
                    .font(.title)
                    .padding()

                Button("Ajouter une Prestation") { // ✅ Ouvre la pop-up
                    showAddPrestationSheet = true
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

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
            .sheet(isPresented: $showAddPrestationSheet) { // ✅ Affichage de la `Sheet`
                AddPrestationView(isPresented: $showAddPrestationSheet)
            }
        }
    }
}

#Preview {
    PrestationListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
