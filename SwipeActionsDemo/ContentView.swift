//
//  ContentView.swift
//  SwipeActionsDemo
//
//  Created by Gabriel Theodoropoulos.
//  https://serialcoder.dev
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movies = Movies()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies.moviesData) { movie in
                    movieInfo(for: movie)
                        .swipeActions(edge: .leading, content: {
                            Button {
                                movies.toggleWatched(for: movie.id)
                            } label: {
                                Label("Watched", systemImage: !movie.watched ? "eye" : "eye.slash")
                            }
                            .tint(.green)
                            
                            Button {
                                movies.toggleWatchedWithFriends(for: movie.id)
                            } label: {
                                Image(systemName: "person.3")
                            }
                            .tint(.indigo)
                        })
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation(.linear(duration: 0.4)) {
                                    movies.removeMovie(with: movie.id)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
            .navigationTitle("Movies List")
            
        }
    }
    
    
    @ViewBuilder
    func movieInfo(for movie: MovieData) -> some View {
        HStack {
            Image(movie.image)
                .padding(.trailing)
            
            Text(movie.title)
                .font(.headline)
            
            if movie.watched || movie.watchedWithFriends {
                Spacer()
            }
            
            if movie.watched {
                Image(systemName: "eye")
            }
            if movie.watchedWithFriends {
                Image(systemName: "person.3")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
