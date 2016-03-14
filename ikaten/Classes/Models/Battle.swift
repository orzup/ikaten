class Battle {
    let lobby: String
    let rule: String
    let weapon: String
    let rank: String
    let rankExp: Int
    var map: String?
    var rankAfter: String?
    var rankExpAfter: Int?
    var result: String?
    var kill: Int?
    var death: Int?
    var knockOut: Bool?

    init(let data: Dictionary<String, AnyObject>) {
        lobby        = data["lobby"] as! String
        rule         = data["rule"] as! String
        weapon       = data["weapon"] as! String
        rank         = data["rank"] as! String
        rankExp      = data["rank_exp"] as! Int
    }

    func setResult(data: Dictionary<String, AnyObject>) {
        map          = data["map"] as? String
        result       = data["result"] as? String
        kill         = data["kill"] as? Int
        death        = data["death"] as? Int
        knockOut     = data["knockOut"] as? Bool
        
        setRunk(data["rankExpChange"] as? Int)
    }
    
    func setRunk(rankExpChange: Int!) {
        let ranks = ["c-", "c", "c+", "b-", "b", "b+", "a-", "a", "a+", "s", "s+"];
        
        if  result == "win" {
            rankExpAfter = rankExp + rankExpChange
            if rank != "s+" && rankExpAfter >= 100 {
                rankExpAfter = 30
                rankAfter = ranks[ranks.indexOf(rank)! + 1];
            } else {
                rankAfter = rank;
            }
        }
        else {
            rankExpAfter = rankExp - rankExpChange
            if rank != "c-" && rankExpAfter < 0 {
                rankExpAfter = 70
                rankAfter = ranks[ranks.indexOf(rank)! - 1];
            } else {
                rankAfter = rank;
            }
        }
    }

    func decode() -> Dictionary<String, AnyObject> {
        let knockOutString = knockOut! ? "yes" : "no"
        return [
            "lobby":          lobby,
            "rule":           rule,
            "map":            map!,
            "weapon":         weapon,
            "rank":           rank,
            "rank_exp":       rankExp,
            "rank_after":     rankAfter!,
            "rank_exp_after": rankExpAfter!,
            "result":         result!,
            "kill":           kill!,
            "death":          death!,
            "knock_out":      knockOutString
       ]
    }
}
