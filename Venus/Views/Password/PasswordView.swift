import Foundation
import SwiftUI
import Combine
import MTKepler

struct PSPasswordView: View {
    @EnvironmentObject var router: Router
    @State private var length = 16
    @State private var password: String = ""
    
    var body: some View {
        VStack{
            PSNavbarComponent()
            
            TextField("选择长度", value: $length, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("生成密码") {
                let randomCxxString = MTKepler.quark.PSRandom.randomString(Int32(length))
                self.password = String(randomCxxString)
            }
            .padding(.top, 12)
            
            Text(password)
        }
        .modifier(IgnoreSafeArea(apply: true))
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 0,
          maxHeight: .infinity,
          alignment: .topLeading
        ).padding(0)
            .background(Color.white)
    }
 
}

struct IgnoreSafeArea : ViewModifier {
    var apply: Bool
    
    @ViewBuilder func body(content: Content) -> some View {
        if apply {
            content.ignoresSafeArea()
        } else {
            content
        }
    }
}

//
//#Preview {
//    PSPasswordView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
