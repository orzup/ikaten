import Quick
import Nimble

class UdemaeSpec: QuickSpec {
    override func spec() {
        describe("setRunk") {
            let udemae = Udemae(rank: "S", exp: 50)

            context("ウデマエが変わらない場合") {
                it("ウデマエがSであること") {
                    let udemaeAfter = udemae.after(true, rankExpChange: 49)
                    expect(udemaeAfter.rank).to(equal("S"))
                }

                it("ウデマエがSであること") {
                    let udemaeAfter = udemae.after(false, rankExpChange: 50)
                    expect(udemaeAfter.rank).to(equal("S"))
                }
            }

            context("ウデマエが上がる場合") {
                it("ウデマエがS+であること") {
                    let udemaeAfter = udemae.after(true, rankExpChange: 50)
                    expect(udemaeAfter.rank).to(equal("S+"))
                }
            }

            context("ウデマエが下がる場合") {
                it("ウデマエがA+であること") {
                    let udemaeAfter = udemae.after(false, rankExpChange: 51)
                    expect(udemaeAfter.rank).to(equal("A+"))
                }
            }
        }
    }
}
