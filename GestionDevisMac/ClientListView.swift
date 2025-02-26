import SwiftUI
import CoreData

struct ClientListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Client.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Client.nom, ascending: true)]
    ) private var clients: FetchedResults<Client>

    @State private var isEditing = false
    @State private var selectedClient: Client?

    var body: some View {
        VStack {
            Text("Liste des Clients")
                .font(.title)
                .padding()

            List {
                ForEach(clients, id: \.self) { client in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(client.nom ?? "Sans nom")
                                .font(.headline)
                            Text(client.email ?? "Sans email")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            selectedClient = client
                            isEditing = true
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding()
                }
            }
        }
        .sheet(item: $selectedClient) { client in
            EditClientView(client: client, onSave: { updatedClient in
                try? viewContext.save()
                isEditing = false
            })
        }
    }
}

#Preview {
    ClientListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
