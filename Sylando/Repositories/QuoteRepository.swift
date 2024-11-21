//
//  QuoteRepository.swift
//  Sylando
//
//  Created by Lars Nicodemus on 21.11.24.
//

import Foundation

class QuoteRepository {
    func getQuoteFromAPI() async throws -> Quote? {
        let urlString = "https://api.syntax-institut.de/quotes?language=DE"

        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Quote].self, from: data)

        return result.first
    }
}
