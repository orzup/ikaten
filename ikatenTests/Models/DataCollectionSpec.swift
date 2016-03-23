import Quick
import Nimble

class DataCollectionSpec: QuickSpec {
    override func spec() {
        var dataCollection: DataCollection?

        beforeEach() {
            let data = Data(["key": "key", "name": ["ja_JP": "キー"]])

            dataCollection = DataCollection()
            dataCollection!.append(data)
            dataCollection!.append(data)
        }

        describe("all") {
            it("要素を全て取得すること") {
                expect(dataCollection!.all().count).to(equal(2))
            }
        }

        describe("count") {
            it("要素数を取得すること") {
                expect(dataCollection!.count()).to(equal(2))
            }
        }

        describe("dataAtIndex") {
            it("indexでdataが取れること") {
                expect(dataCollection!.dataAtIndex(1)).to(beTruthy())
            }
        }
    }
}
