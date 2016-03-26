class Battle {
    let lobby: Lobby
    let rule: Rule
    let weapon: Weapon
    let udemae: Udemae
    var map: Stage!
    var udemaeAfter: Udemae!
    var isWin: Bool!
    var kill: Int!
    var death: Int!
    var knockOut: Bool!

    init(let data: Dictionary<String, AnyObject>) {
        lobby        = data["lobby"] as! Lobby
        rule         = data["rule"] as! Rule
        weapon       = data["weapon"] as! Weapon
        udemae       = data["udemae"] as! Udemae
    }

    func setResult(data: Dictionary<String, AnyObject>) {
        let isWin = data["is_win"] as! Bool

        map          = data["map"] as! Stage
        self.isWin   = isWin
        kill         = data["kill"] as! Int
        death        = data["death"] as! Int
        knockOut     = data["knock_out"] as! Bool
        udemaeAfter  = udemae.after(isWin, rankExpChange: data["rankExpChange"] as! Int)
    }
    

    func decode() -> Dictionary<String, AnyObject> {
        return [
            "lobby":          lobby.toStatInkKey(),
            "rule":           rule.toStatInkKey(),
            "map":            map.key,
            "weapon":         weapon.key,
            "rank":           udemae.rank.lowercaseString,
            "rank_exp":       udemae.exp,
            "rank_after":     udemaeAfter!.rank.lowercaseString,
            "rank_exp_after": udemaeAfter!.exp,
            "result":         isWin! ? "win" : "lose",
            "kill":           kill!,
            "death":          death!,
            "knock_out":      knockOut! ? "yes" : "no"
       ]
    }
}
