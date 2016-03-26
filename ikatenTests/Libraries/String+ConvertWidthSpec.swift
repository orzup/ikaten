import Quick
import Nimble

class ConverWidthSpec: QuickSpec {
    override func spec() {
        describe("toHalfWidth") {
            it("全角の大文字アルファベットが半角になること") {
                let name = "Ｂバスパーク"
                expect(name.toHalfWidth).to(equal("Bバスパーク"))
            }

            it("全角のアンファサンドが半角になること") {
                let name = "マヒマヒリゾート＆スパ"
                expect(name.toHalfWidth).to(equal("マヒマヒリゾート&スパ"))
            }
        }
    }
}
