//
//  AstronautsScrollView.swift
//  Moonshot
//
//  Created by Maciej Wiącek on 17/09/2023.
//

import SwiftUI

struct AstronautsScrollView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crew in
                    NavigationLink {
                        AstronautView(astronaut: crew.astronaut)
                    } label: {
                        HStack {
                            Image(crew.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Rectangle())
                            
                            VStack(alignment: .leading) {
                                Text(crew.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crew.role)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal, 15)
                        }
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .strokeBorder(.white, lineWidth: 1)
                        )
                        .padding(.horizontal, 5)
                    }
                }
            }
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct AstronautsScrollView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautsScrollView(mission: missions[2], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
