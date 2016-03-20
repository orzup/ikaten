class Lobby {
    let name: String
    private static let keys = [
        "タッグマッチ"       : "tag",
        "ガチマッチ"         : "gachi",
        "レギュラーマッチ"   : "regular"
    ]
    private static let statInkKeys = [
        "タッグマッチ"       : "squad_2",
        "ガチマッチ"         : "standard",
        "レギュラーマッチ"   : "standard"
    ]
    private static let splapiKeys = [
        "タッグマッチ"       : "gachi",
        "ガチマッチ"         : "gachi",
        "レギュラーマッチ"   : "regular"
    ]

    init(let _ name: String) {
        self.name = name
    }

    func toKey() -> String {
        return Lobby.keys[name]!
    }

    func toStatInkKey() -> String {
        return Lobby.statInkKeys[name]!
    }

    func toSplapiKey() -> String {
        return Lobby.splapiKeys[name]!
    }
}
