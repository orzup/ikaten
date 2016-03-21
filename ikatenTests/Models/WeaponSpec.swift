import Quick
import Nimble

class WeaponSpec: QuickSpec {
    override func spec() {
        var weapon: Weapon?

        beforeEach() {
            weapon = Weapon(["name": ["ja_JP": "buki"]])
        }

        describe("init") {
            it("初期化できること") {
                expect(weapon!.name).to(equal("buki"))
            }
        }
    }
}
