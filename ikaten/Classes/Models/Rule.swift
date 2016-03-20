class Rule {
    let name: String
    private static let statInkKeys = [
        "ナワバリバトル" : "nawabari",
        "ガチエリア" :     "area",
        "ガチヤグラ" :     "yagura",
        "ガチホコ" :       "hoko"
    ]

    init(let _ name: String) {
        self.name = name
    }

    func toStatInkKey() -> String {
        return Rule.statInkKeys[name]!
    }
}
