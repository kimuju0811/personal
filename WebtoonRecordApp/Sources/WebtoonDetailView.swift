import SwiftUI

struct WebtoonDetailView: View {
    let webtoon: Webtoon
    @State private var selection = 0

    var body: some View {
        VStack {
            if let imageName = webtoon.thumbnail {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .overlay(Text("썸네일").font(.headline).foregroundColor(.gray))
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(webtoon.title)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text(webtoon.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text("\(webtoon.genre) | \(webtoon.dayOfWeek) | 조회수 \(webtoon.views)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("\(webtoon.status.rawValue) | \(webtoon.studio ?? "-")")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Text("내 점수: \(String(format: "%.1f", webtoon.personalScore))")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Picker("", selection: $selection) {
                Text("회차").tag(0)
                Text("정보").tag(1)
                Text("내 리뷰").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            TabView(selection: $selection) {
                EpisodeListView(episodes: webtoon.episodes).tag(0)
                InfoView(webtoon: webtoon).tag(1)
                ReviewView(review: webtoon.review).tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EpisodeListView: View {
    let episodes: [Episode]
    var body: some View {
        List(episodes) { ep in
            HStack {
                if let imageName = ep.thumbnail {
                    Image(imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(4)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .overlay(Text("썸네일").font(.caption))
                }
                Text(ep.title)
                Spacer()
                if ep.read {
                    Text("읽음").foregroundColor(.gray)
                }
            }
        }
    }
}

struct InfoView: View {
    let webtoon: Webtoon
    var body: some View {
        List {
            Section(header: Text("정보")) {
                Label(webtoon.status.rawValue, systemImage: "book.fill")
                if let studio = webtoon.studio { Text(studio) }
                Text(webtoon.genre)
                Text("연재 요일: \(webtoon.dayOfWeek)")
                Text("조회수: \(webtoon.views)")
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ReviewView: View {
    let review: String
    var body: some View {
        ScrollView {
            Text(review.isEmpty ? "리뷰가 없습니다." : review)
                .padding()
        }
    }
}
