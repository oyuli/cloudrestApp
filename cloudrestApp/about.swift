import SwiftUI

struct about: View {
  var body: some View {
    ZStack {
      Color("Background")
        .ignoresSafeArea()
        
      VStack(alignment: .leading, spacing: 20.0) {
        Text("cloudrest")
          //.font(.title)
          //.fontWeight(.bold)
          .foregroundColor(Color("Icons"))
          .font(.lexend(fontStyle: .title, fontWeight: .bold))
          .kerning(0.75)
          
        Text("sleep health is universal but overlooked ")
          .foregroundColor(Color("BrighterYellow"))
          //.font(.title3)
          //.fontWeight(.bold)
          .font(.lexend(fontStyle: .headline, fontWeight: .bold))
          .padding(.bottom, 2.0)
          
        HStack {
          ZStack {
            Circle()
                  .padding(.leading, 2.0)
                  .frame(width: 120.0)
                  .foregroundColor(Color("SmallBackground"))
            Text("73%")
              //.fontWeight(.bold)
              .foregroundColor(Color("BrighterYellow"))
              .font(.lexend(fontStyle: .title2, fontWeight: .bold))
              .kerning(0.5)
          }
          Text("of adolescents\nare not sufficiently resting")
            //.font(.headline)
            //.fontWeight(.heavy)
            .padding(.leading, 10)
            .foregroundColor(Color("Buttons"))
            .kerning(0.5)
            .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
            
        }
        HStack {
          ZStack {
            Circle()
                  .padding(.leading, 2.0)
                  .frame(width: 120.0)
                  .foregroundColor(Color("SmallBackground"))
            Text("33%")
              //.fontWeight(.bold)
              .foregroundColor(Color("BrighterYellow"))
              .font(.lexend(fontStyle: .title2, fontWeight: .bold))
              .kerning(0.5)
          }
          Text("of adults sleep <7 hrs daily")
            //.font(.headline)
            //.fontWeight(.heavy)
            .padding(.leading, 10)
            .foregroundColor(Color("Buttons"))
            .kerning(0.5)
            .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
        }
        HStack {
          ZStack {
            Circle()
                  .padding(.leading, 2.0)
                  .frame(width: 120.0)
                  .foregroundColor(Color("SmallBackground"))
            Text("75%")
              //.fontWeight(.bold)
              .foregroundColor(Color("BrighterYellow"))
              .font(.lexend(fontStyle: .title2, fontWeight: .bold))
              .kerning(0.5)
          }
        
          Text("of older adults exhibit symptoms of insomnia")
            //.font(.headline)
            //.fontWeight(.heavy)
            .padding(.leading, 10)
            .foregroundColor(Color("Buttons"))
            .kerning(0.5)
            .font(.lexend(fontStyle: .headline, fontWeight: .semibold))
        }
        
          //VStack(alignment: .center, spacing: 10.0) {
            Text("Drowsy driving is responsible for\n6,000+ fatal car crashes yearly in the U.S.")
              .foregroundColor(Color("Icons"))
              //.font(.title3)
              //.fontWeight(.bold)
              .padding(.top, 7)
              .kerning(0.5)
              //.lineLimit(5)
              .font(.lexend(fontStyle: .body, fontWeight: .semibold))
              
            Text("our solution")
              .foregroundColor(Color("BrighterYellow"))
              //.font(.title3)
              //.fontWeight(.bold)
              .padding(.top, 1)
              .kerning(0.5)
              .font(.lexend(fontStyle: .title3, fontWeight: .bold))
          
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                  .frame(width: 350.0, height: 60.0)
                  .foregroundColor(Color("Buttons"))
              Text("motivate users to care about \ntheir sleep health")
                  //.font(.callout)
                  //.fontWeight(.semibold)
                  .foregroundColor(Color("Background"))
                  .kerning(0.5)
                  .font(.lexend(fontStyle: .body, fontWeight: .semibold))
                  //.alignmentGuide(.center) { $0 }
            }
            ZStack {
              RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 350.0, height: 60.0)
                .foregroundColor(Color("Buttons"))
              Text("guide users to improve their sleeping habits")
                //.font(.callout)
                //.fontWeight(.semibold)
                .foregroundColor(Color("Background"))
                .kerning(0.5)
                .font(.lexend(fontStyle: .body, fontWeight: .semibold))
            }
          
        
      }
      .padding()
    }
  }
}
#Preview {
  AppView()
}
