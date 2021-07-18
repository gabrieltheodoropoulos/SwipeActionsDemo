//
//  Model.swift
//  SwipeActionsDemo
//
//  Created by Gabriel Theodoropoulos.
//  https://serialcoder.dev
//

import Foundation

struct MovieData: Identifiable {
    var id = UUID().uuidString
    var title: String
    var image: String
    var watched = false
    var watchedWithFriends = false
}

class Movies: ObservableObject {
    @Published var moviesData: [MovieData] = [
        MovieData(title: "The Godfather", image: "godfather"),
        MovieData(title: "The Dark Knight", image: "dark_knight"),
        MovieData(title: "Pulp Fiction", image: "pulp_fiction"),
        MovieData(title: "Forrest Gump", image: "forrest_gump"),
        MovieData(title: "Inception", image: "inception"),
        MovieData(title: "The Matrix", image: "matrix"),
        MovieData(title: "Se7en", image: "seven"),
        MovieData(title: "The Silence of the Lambs", image: "silence_of_lambs"),
        MovieData(title: "Saving Private Ryan", image: "saving_private_ryan"),
        MovieData(title: "The Green Mile", image: "the_green_mile")
    ]
    
    func toggleWatched(for movieID: String) {
        guard let index = moviesData.firstIndex(where: { $0.id == movieID }) else { return }
        moviesData[index].watched.toggle()
    }
    
    
    func toggleWatchedWithFriends(for movieID: String) {
        guard let index = moviesData.firstIndex(where: { $0.id == movieID }) else { return }
        moviesData[index].watchedWithFriends.toggle()
    }
 
    
    func removeMovie(with movieID: String) {
        guard let index = moviesData.firstIndex(where: { $0.id == movieID }) else { return }
        moviesData.remove(at: index)
    }
    
}
