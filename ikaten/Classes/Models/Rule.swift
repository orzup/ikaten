class Rule {
    let name: String
    let statInkKeys = [
        "ナワバリバトル" : "nawabari",
        "ガチエリア" :     "area",
        "ガチヤグラ" :     "yagura",
        "ガチホコ" :       "hoko"
    ]

    init(let _ name: String) {
        self.name = name
    }

    func toStatInkKey() -> String {
        return statInkKeys[name]!
    }
}
