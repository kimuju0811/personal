import SwiftUI

struct WebtoonCardView: View {
    let webtoon: Webtoon

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                if let imageName = webtoon.thumbnail {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .overlay(Text("썸네일").font(.caption).foregroundColor(.gray))
                }
            }
            .frame(width: 70, height: 100)
            .cornerRadius(8)
            .clipped()

            VStack(alignment: .leading, spacing: 4) {
                Text(webtoon.title)
                    .font(.headline)
                    .lineLimit(1)

                Text(webtoon.author)
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack(spacing: 6) {
                    Label(webtoon.personalRating.rawValue, systemImage: "star.fill")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    Text(webtoon.status.rawValue)
                        .font(.caption2)
                        .foregroundColor(.gray)
                    if let studio = webtoon.studio {
                        Text(studio)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }

                Text("점수: \(String(format: "%.1f", webtoon.personalScore))")
                    .font(.caption2)
                    .foregroundColor(.blue)
            }
        }
        .padding(10)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}
