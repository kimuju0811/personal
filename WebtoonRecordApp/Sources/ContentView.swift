import SwiftUI

struct ContentView: View {
    @State private var webtoons: [Webtoon] = SampleData.webtoons

    var body: some View {
        NavigationView {
            List(webtoons) { toon in
                NavigationLink(destination: WebtoonDetailView(webtoon: toon)) {
                    WebtoonCardView(webtoon: toon)
                }
            }
            .navigationTitle("내 웹툰")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
