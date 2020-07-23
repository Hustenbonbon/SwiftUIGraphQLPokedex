//
//  ContentView.swift
//  Shared
//
//  Created by Max Tharr on 19.07.20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var pokeFetcher = PokeFetcher()
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 200, maximum: 300))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(pokeFetcher.pokemons) { pokemon in
                PokeCard(pokemon: pokemon)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class PokeFetcher: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    init() {
        PokemonsQuery(first: 15)
            .fetchPokemons()
            .replaceError(with: [])
            .assign(to: $pokemons)
    }
}
