import Quick
import Nimble

class ConverWidthSpec: QuickSpec {
    override func spec() {
        describe("toHalfWidth") {
            it("全角の数字が半角になること") {
                let name = "１２３４"
                expect(name.toHalfWidth).to(equal("1234"))
            }

            it("全角のアルファベットが半角になること") {
                let name = "ａbｃＡＢＣ"
                expect(name.toHalfWidth).to(equal("abcABC"))
            }

            it("全角のアンパサンドが半角になること") {
                let name = "＆"
                expect(name.toHalfWidth).to(equal("&"))
            }
        }
    }
}
