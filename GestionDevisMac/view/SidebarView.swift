import SwiftUI

struct SidebarView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DevisListView()) {
                    Label("Devis", systemImage: "doc.text")
                }
                NavigationLink(destination: ClientListView()) {
                    Label("Clients", systemImage: "person.3")
                }
                NavigationLink(destination: PrestationListView()) {
                    Label("Prestations", systemImage: "wrench")
                }
            }
            .listStyle(SidebarListStyle())
            
            // Vue par défaut affichée au démarrage
            Text("Bienvenue dans Gestion Devis Mac")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.title)
        }
    }
}

#Preview {
    SidebarView()
}
