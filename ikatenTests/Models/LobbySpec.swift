import Quick
import Nimble

class LobbySpec: QuickSpec {
    override func spec() {
        var regularMatch: Lobby?
        var gachiMatch:   Lobby?

        beforeEach() {
            regularMatch = Lobby("レギュラーマッチ")
            gachiMatch = Lobby("ガチマッチ")
        }

        describe("init") {
            it("初期化できること") {
                expect(regularMatch!.name).to(equal("レギュラーマッチ"))
                expect(gachiMatch!.name).to(equal("ガチマッチ"))
            }
        }

        describe("toStatInkKey") {
            it("stat.ink用のキーに変換できること") {
                expect(regularMatch!.toStatInkKey()).to(equal("standard"))
                expect(gachiMatch!.toStatInkKey()).to(equal("standard"))
            }
        }

        describe("toSplapiKey") {
            it("splapi用のキーに変換できること") {
                expect(regularMatch!.toSplapiKey()).to(equal("regular"))
                expect(gachiMatch!.toSplapiKey()).to(equal("gachi"))
            }
        }
    }
}
