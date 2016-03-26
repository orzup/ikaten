import Quick
import Nimble

class StagesSpec: QuickSpec {
    override func spec() {
        var stages: Stages?

        beforeEach() {
            stages = Stages(
                [
                    ["key": "arowana", "name": ["ja_JP": "アロワナモール"]],
                    ["key": "shotturu", "name": ["ja_JP": "ショッツル鉱山"]]
                ]
            )
        }

        describe("init") {
            it("初期化できること") {
                expect(stages!.nameAtIndex(1)).to(equal("ショッツル鉱山"))
            }
        }
    }
}
