import SwiftUI
import CoreData

struct ClientListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Client.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Client.nom, ascending: true)]
    ) private var clients: FetchedResults<Client>

    var body: some View {
        NavigationView {
            VStack {
                Text("Liste des Clients")
                    .font(.title)
                    .padding()

                NavigationLink(destination: AddClientView()) { // ✅ Bouton pour ajouter un client
                    Text("Ajouter un Client")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                List {
                    ForEach(clients, id: \.objectID) { client in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(client.nom ?? "Sans nom")
                                    .font(.headline)
                                Text(client.email ?? "Sans email")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Clients")
        }
    }
}

#Preview {
    ClientListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
