//
//  Api+Extensions.swift
//  Pokedex
//
//  Created by Max Tharr on 19.07.20.
//

import Foundation
import Combine

typealias Pokemon = PokemonsQuery.Data.Pokemon

extension Pokemon: Identifiable {}

extension Pokemon {
    var imageURL: URL {
        URL(string: image!)!
    }
}

extension PokemonsQuery {
    func fetchPokemons() -> Future<[Pokemon], Error> {
        Future<[Pokemon], Error> { promise in
            Network.shared.apollo.fetch(query: self) { result in
                switch result {
                    case .success(let graphQLResult):
                        if let data = graphQLResult.data,
                           let pokemons = data.pokemons {
                            promise(.success(pokemons.compactMap { $0 }))
                        } else {
                            promise(.failure(APIError.propertyNotThere))
                        }
                    case .failure(let error):
                        promise(.failure(error))
                }
            }
        }
    }

    private enum APIError: Error {
        case propertyNotThere
    }
}
