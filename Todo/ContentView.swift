import SwiftUI

struct ContentView: View {
    @State private var notes: [Task] = []
    @State private var note: String = ""
    @State private var isCompleted = false
    
    private func addNote() {
        guard !note.isEmpty else {
            return
        }
        
        
        notes.append(Task(title: note))
        note.removeAll()
    }
    
    private func deleteNote(id: UUID) {
        let filteredNotes = notes.filter { note in
            return note.id != id
        }
        notes = filteredNotes
    }
    
    var body: some View {
        
        VStack {
            Text("Welcome to Todo IOS")
                .font(.largeTitle.bold())
            
            HStack {
                TextField("Add a note", text: $note)
                    .padding(10)
                    .border(.secondary)
                    .presentationCornerRadius(20)
                
                Button("Agregar", action: addNote)
                    .buttonStyle(.borderedProminent)
                    .presentationCornerRadius(20)
                
            }
            .padding(.horizontal, 15)
        }
        
        List {
            ForEach(notes, id: \.self.id) { note in
                HStack {
                    Text(note.title)
                    Toggle(isOn: $isCompleted) {
                        Text("")
                    }
                    .toggleStyle(.switch)
                    Button("", systemImage: "trash", action: {
                        deleteNote(id: note.id)
                    })
                    .foregroundStyle(.red)
                }
            }
        }
        .padding(.vertical, 16)
        Spacer()
    }
    
    
}


#Preview {
    ContentView()
}
