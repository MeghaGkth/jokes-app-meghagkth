//
//  ContentView.swift
//  Jokes (NEW)
//
//  Created by Megha Gokulnath on 13/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    var jokes = [Joke(setup: "Why couldn't the bicycle stand up?",
                          punchline: "It was two tired!"),
                     Joke(setup: "Why did the chicken cross the road?",
                          punchline: "To get to the other side!"),
                     Joke(setup: "Is this pool safe for diving?",
                          punchline: "It deep ends"),
                     Joke(setup: "Did you hear about the cheese factory that exploded in France?",
                          punchline: "There was nothing left but de Brie"),
                     Joke(setup: "Dad, can you put my shoes on?",
                          punchline: "I don’t think they'll fit me")]
    
    @State private var showPunchline = false
    @State private var currentJokeIndex = 0
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                      .onTapGesture {
                          if showPunchline {
                              currentJokeIndex += 1
                              showPunchline = false
                          }
                      }
            VStack {
                Text(jokes[currentJokeIndex % jokes.count].setup)
                    .padding()
                
                Button {
                    print("Button tapped!!")
                    showPunchline = true
                } label: {
                    Text("Why?")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                }
                .padding()
                
                if showPunchline {
                    Text(jokes[currentJokeIndex].punchline)
                        .padding()
                    
                    Text("**Tap** to continue")
                        .italic()
                        .padding()
                    
                    Text(jokes[currentJokeIndex % jokes.count].punchline)
                        .padding()
                        .opacity(showPunchline ? 1 : 0)

                    Text("Tap to continue")
                        .hidden()
                        .italic()
                        .padding()
                        .opacity(showPunchline ? 1 : 0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
