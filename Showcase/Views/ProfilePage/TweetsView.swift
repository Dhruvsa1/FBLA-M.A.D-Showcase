import SwiftUI

struct TweetsView: View {
  
//https://twitter.com/TwitterDev/timelines/539487832448843776
    var body: some View {
        
        NavigationView {
                   WebView(urlString: "https://twitter.com/TwitterDev/timelines/539487832448843776")
                       .navigationBarTitle("Twitter Feed", displayMode: .inline)
                       .ignoresSafeArea(edges: .bottom) // allow web content to extend to the bottom edge
               }
    }
}

#Preview {
    TweetsView()
}
