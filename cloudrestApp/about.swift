import SwiftUI
struct about: View {
  var body: some View {
    ZStack {
      Color("Background")
        .ignoresSafeArea()
      VStack(alignment: .leading, spacing: 20.0) {
        Text("cloudrest")
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(Color("Icons"))
        Text("the problem")
          .foregroundColor(Color("Headings"))
          .font(.title3)
          .fontWeight(.bold)
        HStack {
          ZStack {
            Circle()
              .frame(width: 150.0)
              .foregroundColor(Color("SmallBackground"))
            Text("73%")
              .fontWeight(.bold)
              .foregroundColor(Color("Headings"))
          }
          Text("of adolescents are not sufficiently resting")
            .font(.headline)
            .fontWeight(.heavy)
            .padding(.leading, 15)
            .foregroundColor(Color("Buttons"))
            .kerning(1.25)
        }
        HStack {
          ZStack {
            Circle()
              .frame(width: 150.0)
              .foregroundColor(Color("SmallBackground"))
            Text("33%")
              .fontWeight(.bold)
              .foregroundColor(Color("Headings"))
          }
          Text("of adults sleep <7 hrs daily")
            .font(.headline)
            .fontWeight(.heavy)
            .padding(.leading, 15)
            .foregroundColor(Color("Buttons"))
            .kerning(1.25)
        }
        HStack {
          ZStack {
            Circle()
              .frame(width: 150.0)
              .foregroundColor(Color("SmallBackground"))
            Text("75%")
              .fontWeight(.bold)
              .foregroundColor(Color("Headings"))
          }
          Text("of older adults experience symptoms of insomnia")
            .font(.headline)
            .fontWeight(.heavy)
            .padding(.leading, 15)
            .foregroundColor(Color("Buttons"))
            .kerning(1.25)
        }
        HStack {
          VStack(alignment: .center, spacing: 10.0) {
            Text("sleep health is universal, but so often overlooked. it has a huge impact on not just our daily well-being but on public safety--drowsy driving is responsible for 6,000+ fatal car crashes yearly in the U.S.")
              .foregroundColor(Color("Headings"))
              .font(.title3)
              .fontWeight(.bold)
              .padding(.top, 15)
              .kerning(1.5)
            Text("our solution")
              .foregroundColor(Color("Headings"))
              .font(.title3)
              .fontWeight(.bold)
              .padding(.top, 1)
              .kerning(1.16)
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                  .frame(width: 350.0, height: 70.0)
                  .foregroundColor(Color("Buttons"))
              Text("motivate users to care for their sleep health")
                  .font(.callout)
                  .fontWeight(.semibold)
                  .foregroundColor(Color("Background"))
                  .kerning(1.12)
            }
            ZStack {
              RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 350.0, height: 70.0)
                .foregroundColor(Color("Buttons"))
              Text("guide users to improve their sleeping habits")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color("Background"))
                .kerning(1.12)
            }
          }
        }
      }
      .padding()
    }
  }
}
#Preview {
  AppView()
}
