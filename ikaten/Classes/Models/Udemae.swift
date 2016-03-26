class Udemae {
    static let ranks = [
        "C-", "C", "C+",
        "B-", "B", "B+",
        "A-", "A", "A+",
        "S", "S+"
    ]

    static let expsMin = 0
    static let expsMax = 100

    let rank: String
    let exp: Int

    init(let rank: String, let exp: Int) {
        self.rank = rank
        self.exp = exp
    }

    class func exps() -> Array<Int> {
        var array: Array<Int> = []
        for i in expsMin ..< expsMax {
            array.append(i)
        }
        return array
    }

    func after(let isWin: Bool, let rankExpChange: Int) -> Udemae {
        var rankAfter = ""
        var rankExpAfter = 0

        if isWin {
            rankExpAfter = exp + rankExpChange
            if rank != Udemae.ranks.last && rankExpAfter >= 100 {
                rankExpAfter = 30
                rankAfter = Udemae.ranks[Udemae.ranks.indexOf(rank)! + 1]
            } else {
                rankAfter = rank
            }
        } else {
            rankExpAfter = exp - rankExpChange
            if rank != Udemae.ranks.first && rankExpAfter < 0 {
                rankExpAfter = 70
                rankAfter = Udemae.ranks[Udemae.ranks.indexOf(rank)! - 1]
            } else {
                rankAfter = rank
            }
        }

        return Udemae(rank: rankAfter, exp: rankExpAfter)
    }
}
