import Quick
import Nimble

class WeaponsSpec: QuickSpec {
    override func spec() {
        var weapons: Weapons?

        beforeEach() {
            weapons = Weapons(
                [
                    ["name": ["ja_JP": "buki1"]],
                    ["name": ["ja_JP": "buki2"]]
                ]
            )
        }

        describe("init") {
            it("初期化できること") {
                expect(weapons!.nameAtIndex(1)).to(equal("buki2"))
            }
        }
    }
}
