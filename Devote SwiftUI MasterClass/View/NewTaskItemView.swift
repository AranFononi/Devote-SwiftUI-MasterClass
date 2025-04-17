//
//  NewTaskItemView.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 17/4/25.
//

import SwiftUI
import CoreData

struct NewTaskItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    private var isButtonDisabled: Bool { task.isEmpty }
    
    private func addItem() {
        withAnimation {
            let newItem = Items(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundStyle(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        Color(UIColor.systemGray6)
                    )
                    .clipShape(.rect(cornerRadius: 10))
                
                Button {
                    addItem()
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(isButtonDisabled)
                .padding()
                .foregroundStyle(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .clipShape(.rect(cornerRadius: 10))
            } //: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(.white)
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: .black.opacity(0.2), radius: 24)
            .frame(maxWidth: 640)
        } //: VStack
        .padding()
    }
}

#Preview {
    NewTaskItemView()
        .background(.gray)
}
