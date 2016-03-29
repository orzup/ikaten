class Udemae {
    static let ranks = [
        "C-", "C", "C+",
        "B-", "B", "B+",
        "A-", "A", "A+",
        "S", "S+"
    ]

    static let expMin = 0
    static let expMax = 100

    let rank: String
    let exp: Int

    init(let rank: String, let exp: Int) {
        self.rank = rank
        self.exp = exp
    }

    func after(let isWin: Bool, let rankExpChange: Int) -> Udemae {
        var rankAfter = ""
        var rankExpAfter = 0

        if isWin {
            rankExpAfter = exp + rankExpChange
            if rank != Udemae.ranks.last && rankExpAfter >= Udemae.expMax {
                rankExpAfter = 30
                rankAfter = Udemae.ranks[Udemae.ranks.indexOf(rank)! + 1]
            } else {
                rankAfter = rank
            }
        } else {
            rankExpAfter = exp - rankExpChange
            if rank != Udemae.ranks.first && rankExpAfter < Udemae.expMin {
                rankExpAfter = 70
                rankAfter = Udemae.ranks[Udemae.ranks.indexOf(rank)! - 1]
            } else {
                rankAfter = rank
            }
        }

        return Udemae(rank: rankAfter, exp: rankExpAfter)
    }
}
