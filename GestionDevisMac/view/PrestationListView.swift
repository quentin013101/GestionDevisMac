import SwiftUI
import CoreData

struct PrestationListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: GestionDevisMac.Prestation.entity(), // ✅ Spécifie que c'est une entité Core Data
        sortDescriptors: [NSSortDescriptor(keyPath: \Prestation.description, ascending: true)]
    ) private var prestations: FetchedResults<Prestation>

    var body: some View {
        VStack {
            Text("Liste des Prestations")
                .font(.title)
                .padding()
            
            List(prestations, id: \.self) { prestation in
                HStack {
                    Text(prestation.description ?? "Sans description") // ✅ Protection contre nil
                        .font(.headline)
                    Spacer()
                    Text("\(prestation.prix ?? 0.0, specifier: "%.2f") €")
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
    }
}

#Preview {
    PrestationListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
