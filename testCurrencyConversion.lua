luaunit = require("luaunit")
cc = require("currencyConversion")
function testConvertCanadianDollarToJapaneseYen()
    -- Testing the base conversion factor
    luaunit.assertEquals(cc.convertCanadianDollarToJapaneseYen(1), "78.89")
    -- Testing proper conversion to two decimal places
    luaunit.assertEquals(cc.convertCanadianDollarToJapaneseYen(25.00), "1972.25")
    -- Testing the case of zero
    luaunit.assertEquals(cc.convertCanadianDollarToJapaneseYen(0), "0.00")
    -- Testing the case of negative number
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive.", cc.convertCanadianDollarToJapaneseYen, -1)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertCanadianDollarToJapaneseYen, "Invalid entry")
end
os.exit(luaunit.LuaUnit.run())