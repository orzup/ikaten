import Quick
import Nimble

class WeaponsSpec: QuickSpec {
    override func spec() {
        var weapons: Weapons?

        beforeEach() {
            weapons = Weapons(
                [
                    ["key": "52gal", "name": ["ja_JP": ".52ガロン"]],
                    ["key": "96gal", "name": ["ja_JP": ".96ガロン"]]
                ]
            )
        }

        describe("init") {
            it("初期化できること") {
                expect(weapons!.nameAtIndex(1)).to(equal(".96ガロン"))
            }
        }
    }
}
