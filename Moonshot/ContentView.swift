//
//  ContentView.swift
//  Moonshot
//
//  Created by Maciej Wiącek on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isGridLayout = true
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Missions")
                        .font(.largeTitle.bold())
                        .padding()
                    
                    Spacer()
                    
                    Button(!isGridLayout ? "Grid" : "List") {
                        isGridLayout.toggle()
                    }
                    .padding()
                }
                
                Group {
                    if isGridLayout {
                        MainScreenGridLayout(astronauts: astronauts, missions: missions)
                    } else {
                        MainScreenListLayout(astronauts: astronauts, missions: missions)
                    }
                }
            }
            .navigationTitle("Missions")
            .navigationBarHidden(true)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
