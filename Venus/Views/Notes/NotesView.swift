import Foundation
import SwiftUI
import Combine
import MTKepler

struct PSNotesView: View {
    @EnvironmentObject var router: Router
    var ownerName: String
    
    
    var body: some View {
        Text("\(ownerName) Notes")
    }
 
}


#Preview {
    PSNotesView(ownerName: "xxxxPreview")
        .modelContainer(for: Item.self, inMemory: true)
}
