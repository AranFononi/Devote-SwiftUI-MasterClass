//
//  ContentView.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 16/4/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - Property
    @State var task: String = ""
    
    // Fetch Data
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Items.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Items>
    
    // MARK: - Function
    private func addItem() {
        withAnimation {
            let newItem = Items(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 16) {
                    TextField("New Task", text: $task)
                        .padding()
                        .background(
                            Color(UIColor.systemGray6)
                        )
                        .clipShape(.rect(cornerRadius: 10))
                        
                    Button {
                        addItem()
                    }label: {
                        Spacer()
                        Text("SAVE")
                        Spacer()
                    }
                    .padding()
                    .font(.headline)
                    .foregroundStyle(.white)
                    .background(Color.pink)
                    .clipShape(.rect(cornerRadius: 10))
                } //: VStack
                .padding()
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                        } label: {
                            Text(item.timestamp!, formatter: itemFormatter)
                        }
                    }
                    .onDelete(perform: deleteItems)
                } //: List
            } //: VStack
            .navigationTitle("Daily Tasks")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            } //: Toolbar
            Text("Select an item")
        } //: NavigationView
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
