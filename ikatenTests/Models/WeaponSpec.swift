import Quick
import Nimble

class WeaponSpec: QuickSpec {
    override func spec() {
        var weapon: Weapon?

        beforeEach() {
            weapon = Weapon(["key": "52gal", "name": ["ja_JP": ".52ガロン"]])
        }

        describe("init") {
            it("初期化できること") {
                expect(weapon!.name).to(equal(".52ガロン"))
            }
        }
    }
}
