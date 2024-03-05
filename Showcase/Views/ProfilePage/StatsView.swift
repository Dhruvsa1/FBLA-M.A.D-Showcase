import SwiftUI

struct StatsView: View {
    var body: some View {
        VStack {
            Text("Stats")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 32)
                .padding(.leading, 40)
                .frame(maxWidth: .infinity, alignment: .leading) // Align 'Stats' to the leading edge

            // Define a fixed size for the card to ensure it's a square
            let cardSize: CGFloat = 325

            VStack( alignment: .leading, spacing: 35) {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("SAT")
                            .foregroundStyle(.blue)
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.secondary)
                        Text("1500")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    Spacer() // This spacer will push the ACT to the right side
                    VStack(alignment: .leading, spacing: 10) {
                        Text("ACT")
                            .foregroundStyle(.blue)
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                        Text("36")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
                .padding(.leading, 15)
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Unweighted GPA")
                            .foregroundStyle(.blue)
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("3.4")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Weighted GPA")
                            .foregroundStyle(.blue)
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.secondary)
                        Text("4.0")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .padding(.leading, 20)
                    Spacer()
                }.padding(.leading, 15)
            }
            .padding(.horizontal, 24)
            .frame(width: cardSize, height: cardSize) // Apply the fixed size to the card
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        }
        .padding(.bottom, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Align the whole VStack to the top
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
