//
//  Network.swift
//  Pokedex
//
//  Created by Max Tharr on 19.07.20.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql-pokemon.now.sh/")!)
}
