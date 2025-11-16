import SwiftData
import SwiftUI

struct PSMainPage: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var router: Router

    var body: some View {

        Grid {
            GridRow {
                VStack { 
                    Image(.images)
                    Text("图片管理")
                        .onTapGesture {
                            print("Double tapped!")
                            router.navigate(to: .images)
                        }
                }
            }
        }
        
        .toolbar { 
            ToolbarItemGroup {
                Button {
                    // Action for help
                } label: {
                    Label("Help", systemImage: "questionmark.circle")
                }
            }
        }.toolbarBackground(Color.green)
        .padding(0)
        .frame(width: 1024, height: 768)
    }
}

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
