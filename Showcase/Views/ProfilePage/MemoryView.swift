import SwiftUI

struct MemoryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Memories")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading, 24)
                .padding(.top, 16) // You might want to adjust this padding to reduce space

            ZStack(alignment: .bottomLeading) {
                // Dummy image with a system name for example purposes
                // Replace "photo" with your actual image asset name
                Image("placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 325, height: 450)
                    .cornerRadius(10) // Make sure this is sufficiently large to be noticeable
                    .clipped()

                VStack(alignment: .leading) {
                    Text("VACATION")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding([.leading], 10)
                        .padding([.top], 20)
                        .padding([.bottom], 5)
                   
                    Text("Visiting Alaska and saw beautiful snow wolves")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding([.leading, .bottom], 10)
                    Spacer()
                    Text("The place was really nice 10/10 experience was really good I loved going there. I loved going there.")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding([.leading, .bottom], 10)
                    Text("#vacation #trip #cantwait")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding([.leading], 10)
                        .padding([.bottom], 20)
                }
                .frame(width: 325, height: 450)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10) // Make sure this is sufficiently large to be
            }
            .padding(.leading, 24)
            .padding(.trailing, 24)
            .padding(.bottom, 16) // You might want to adjust this padding to reduce space
        }
    }
}

struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView()
    }
}
