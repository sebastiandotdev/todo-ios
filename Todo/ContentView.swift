import SwiftUI

struct ContentView: View {
    @State private var notes: [String] = []
    @State private var note: String = ""
    
    private func addNote() {
        guard note.isEmpty else {
            return
        }
        
        notes.append(note)
        note.removeAll()
    }
    
    var body: some View {
        
        VStack {
            HStack {
                
                TextField("Add a note", text: $note)
                    .padding(10)
                    .border(.secondary)
                
                Button("", systemImage: "plus", action: addNote)
            }
            .padding(.horizontal, 15)
        }
        
        List {
            ForEach(notes, id: \.self) { note in
                Text(note)
            }
        }
        .padding(.vertical, 16)
        Spacer()
    }
    
    
}


#Preview {
    ContentView()
}
