import Foundation
import SwiftUI

enum PersonalRating: String, CaseIterable, Identifiable, Codable {
    case terrible = "졸작"
    case average = "보통"
    case good = "수작"
    case great = "명작"
    case masterpiece = "인생작품"

    var id: String { rawValue }
}

enum WebtoonStatus: String, CaseIterable, Identifiable, Codable {
    case ongoing = "연재 중"
    case completed = "완결"
    case hiatus = "휴재"

    var id: String { rawValue }
}

struct Webtoon: Identifiable, Codable {
    var id = UUID()
    var title: String
    var author: String
    var genre: String
    var dayOfWeek: String
    var views: Int
    var status: WebtoonStatus
    var studio: String?
    var personalRating: PersonalRating
    var personalScore: Double
    var thumbnail: String?
    var episodes: [Episode]
    var review: String = ""
}

struct Episode: Identifiable, Codable {
    var id = UUID()
    var title: String
    var thumbnail: String?
    var read: Bool = false
}

struct SampleData {
    static let webtoons: [Webtoon] = [
        Webtoon(title: "테스트 웹툰", author: "작가A", genre: "판타지", dayOfWeek: "월", views: 12345, status: .ongoing, studio: "캐롯툰", personalRating: .good, personalScore: 8.4, thumbnail: nil, episodes: [
            Episode(title: "1화", thumbnail: nil),
            Episode(title: "2화", thumbnail: nil)
        ]),
        Webtoon(title: "샘플 웹툰", author: "작가B", genre: "로맨스", dayOfWeek: "수", views: 54321, status: .completed, studio: "골렘팩토리", personalRating: .great, personalScore: 9.2, thumbnail: nil, episodes: [
            Episode(title: "1화", thumbnail: nil)
        ])
    ]
}
