//
//  PokeCard.swift
//  Pokedex
//
//  Created by Max Tharr on 19.07.20.
//

import SwiftUI
import URLImage

struct PokeCard: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            URLImage(pokemon.imageURL, placeholder: { _ in
                     Image("Mew")
                     .resizable()
                     .frame(width: 150.0, height: 150.0)
                     }) { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
                .frame(width: 150, height: 150, alignment: .center)
            Text(pokemon.name ?? "Unknown")
                .font(.title)
            Text(pokemon.number ?? "Unknown")
                .font(.caption)
        }
        .padding(.all, 10)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct PokeCard_Previews: PreviewProvider {
    static var previews: some View {
        let pokemon = Pokemon(id: "1", number: "001", name: "Bisasam", image: "https://img.pokemondb.net/artwork/bulbasaur.jpg")
        PokeCard(pokemon: pokemon)
    }
}
