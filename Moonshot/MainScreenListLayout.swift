//
//  MainScreenListLayout.swift
//  Moonshot
//
//  Created by Maciej Wiącek on 17/09/2023.
//

import SwiftUI

struct MainScreenListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack(spacing: 15) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .padding(.vertical, 5)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(mission.displayName)
                                .font(.subheadline.bold())
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                        }
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
        }
        .listStyle(.plain)
    }
}

struct MainScreenListLayout_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MainScreenListLayout(astronauts: astronauts, missions: missions)
            .preferredColorScheme(.dark)
            .background(.darkBackground)
    }
}
