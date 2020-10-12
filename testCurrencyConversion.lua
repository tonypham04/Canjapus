luaunit = require("luaunit")
cc = require("currencyConversion")
function testConvertCanadianDollarToJapaneseYen()
    -- Testing the base conversion factor
    luaunit.assertEquals(cc.convertCanadianDollarToJapaneseYen(1), "80.32")
    -- Testing proper conversion to two decimal places
    luaunit.assertEquals(cc.convertCanadianDollarToJapaneseYen(25.00), "2008.00")
    -- Testing the case of zero
    luaunit.assertEquals(cc.convertCanadianDollarToJapaneseYen(0), "0.00")
    -- Testing the case of negative number
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive.", cc.convertCanadianDollarToJapaneseYen, -1)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertCanadianDollarToJapaneseYen, "Invalid entry")
end

function testConvertJapaneseYenToCanadianDollar()
    -- Testing the base conversion factor
    luaunit.assertEquals(cc.convertJapaneseYenToCanadianDollar(80.32), "1.00")
    -- Testing proper conversion using a valid value
    luaunit.assertEquals(cc.convertJapaneseYenToCanadianDollar(2007.20), "24.99")
    -- Testing the case of zero
    luaunit.assertEquals(cc.convertJapaneseYenToCanadianDollar(0), "0.00")
    -- Testing the case of a negative nunmber
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive", cc.convertJapaneseYenToCanadianDollar, -5.94)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertJapaneseYenToCanadianDollar, "Lua is an awesome programming language!")
end
os.exit(luaunit.LuaUnit.run())