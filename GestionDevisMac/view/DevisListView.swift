import SwiftUI
import CoreData

struct DevisListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Devis.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Devis.dateCreation, ascending: false)]
    ) private var devisList: FetchedResults<Devis>

    var body: some View {
        VStack {
            Text("Liste des Devis")
                .font(.title)
                .padding()

            List(devisList, id: \.objectID) { devis in
                Text(devis.client?.nom ?? "Sans client")
                    .font(.headline)
                    .onAppear {
                        if let clientNom = devis.client?.nom {
                            print("Client du devis : \(clientNom)")
                        } else {
                            print("Client du devis : nil")
                        }
                    }
                Spacer()
                Text("\((devis.montantTTC as? Double ?? 0.0), specifier: "%.2f") €")
                    .foregroundColor(.gray)
            }
                .padding()
            }
        }
    }

#Preview {
    DevisListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
