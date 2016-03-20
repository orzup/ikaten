class Battle {
    let lobby: String
    let rule: Rule
    let weapon: String
    let rank: String
    let rankExp: Int
    var map: Stage!
    var rankAfter: String!
    var rankExpAfter: Int!
    var isWin: Bool!
    var kill: Int!
    var death: Int!
    var knockOut: Bool!

    init(let data: Dictionary<String, AnyObject>) {
        lobby        = data["lobby"] as! String
        rule         = data["rule"] as! Rule
        weapon       = data["weapon"] as! String
        rank         = data["rank"] as! String
        rankExp      = data["rank_exp"] as! Int
    }

    func setResult(data: Dictionary<String, AnyObject>) {
        map          = data["map"] as! Stage
        isWin        = data["result"] as! Bool
        kill         = data["kill"] as! Int
        death        = data["death"] as! Int
        knockOut     = data["knock_out"] as! Bool
        
        setRunk(data["rankExpChange"] as? Int)
    }
    

    func decode() -> Dictionary<String, AnyObject> {
        return [
            "lobby":          lobby,
            "rule":           rule.title,
            "map":            map!.toStatInkKey(),
            "weapon":         weapon,
            "rank":           rank,
            "rank_exp":       rankExp,
            "rank_after":     rankAfter!,
            "rank_exp_after": rankExpAfter!,
            "result":         isWin! ? "win" : "lose",
            "kill":           kill!,
            "death":          death!,
            "knock_out":      knockOut! ? "yes" : "no"
       ]
    }

    private func setRunk(rankExpChange: Int!) {
        let ranks = ["c-", "c", "c+", "b-", "b", "b+", "a-", "a", "a+", "s", "s+"];

        if isWin as Bool {
            rankExpAfter = rankExp + rankExpChange
            if rank != ranks.last && rankExpAfter >= 100 {
                rankExpAfter = 30
                rankAfter = ranks[ranks.indexOf(rank)! + 1];
            } else {
                rankAfter = rank;
            }
        } else {
            rankExpAfter = rankExp - rankExpChange
            if rank != ranks.first && rankExpAfter < 0 {
                rankExpAfter = 70
                rankAfter = ranks[ranks.indexOf(rank)! - 1];
            } else {
                rankAfter = rank;
            }
        }
    }
}
