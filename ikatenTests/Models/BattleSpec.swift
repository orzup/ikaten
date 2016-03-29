import Quick
import Nimble

class BattleSpec: QuickSpec {
    override func spec() {
        describe("バトルの成績をセット") {
            let battle = Battle(data:[
                    "lobby":    Lobby("レギュラーマッチ"),
                    "rule":     Rule(["key": "hoko" ,"name": ["ja_JP": "ガチホコ"]]),
                    "weapon":   Weapon(["key": "52gal" ,"name": ["ja_JP": "52ガロン"]]),
                    "rank":     "s",
                    "rank_exp": 50
                ])

            var params : Dictionary<String, AnyObject> = [
                "map":           Stage(["key": "arowana" ,"name": ["ja_JP": "アロワナモール"]]),
                "is_win":        true,
                "kill":          12,
                "death":         5,
                "rankExpChange": 6,
                "knock_out":     false
            ]

            context("ウデマエが変わらない場合") {
                it("ウデマエがSであること") {
                    params["is_win"] = true
                    params["rankExpChange"] = 6
                    battle.setResult(params)

                    expect(battle.rankAfter).to(equal("s"))
                }
            }

            context("ウデマエが上がる場合") {
                it("ウデマエがS+であること") {
                    params["is_win"] = true
                    params["rankExpChange"] = 50
                    battle.setResult(params)

                    expect(battle.rankAfter).to(equal("s+"))
                }
            }

            context("ウデマエが下がる場合") {
                it("ウデマエがA+であること") {
                    params["is_win"] = false
                    params["rankExpChange"] = 51
                    battle.setResult(params)

                    expect(battle.rankAfter).to(equal("a+"))
                }
            }
        }
    }
}
