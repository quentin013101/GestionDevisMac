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
            
            List(devisList, id: \.self) { devis in
                HStack {
                    Text(devis.client?.nom ?? "Sans client")
                        .font(.headline)
                        .onAppear {
                            print("Client du devis : \(devis.client?.nom ?? "nil")") // ✅ Debug
                        }
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
    DevisListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
