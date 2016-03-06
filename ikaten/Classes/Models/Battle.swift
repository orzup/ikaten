class Battle {
    let lobby: String
    let rule: String
    let map: String
    let weapon: String
    let rank: String
    let rankExp: Int
    var rankAfter: String
    var rankExpAfter: Int
    var result: String
    var kill: Int
    var death: Int
    var knockOut: Bool

    init(let data: Dictionary<String, AnyObject>) {
        lobby        = data["lobby"] as! String
        rule         = data["rule"] as! String
        map          = data["map"] as! String
        weapon       = data["weapon"] as! String
        rank         = data["rank"] as! String
        rankExp      = data["rank_exp"] as! Int
        rankAfter    = data["rankAfter"] as! String
        rankExpAfter = data["rankExpAfter"] as! Int
        result       = data["result"] as! String
        kill         = data["kill"] as! Int
        death        = data["death"] as! Int
        knockOut     = data["knockOut"] as! Bool
    }

    func decode() -> Dictionary<String, AnyObject> {
        let knockOutString = knockOut ? "yes" : "no"
        return [
            "lobby":          lobby,
            "rule":           rule,
            "map":            map,
            "weapon":         weapon,
            "rank":           rank,
            "rank_exp":       rankExp,
            "rank_after":     rankAfter,
            "rank_exp_after": rankExpAfter,
            "result":         result,
            "kill":           kill,
            "death":          death,
            "knock_out":      knockOutString
       ]
    }
}
