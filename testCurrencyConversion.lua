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
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive.", cc.convertJapaneseYenToCanadianDollar, -5.94)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertJapaneseYenToCanadianDollar, "Lua is an awesome programming language!")
end

function testConvertCanadianDollarToUSDollar()
    -- Testing the base conversion factor
    luaunit.assertEquals(cc.convertCanadianDollarToUSDollar(1.00), "0.76")
    -- Testing proper conversion using a valid value (Fun fact: $129.99 Canadian is the price of the Logitech MX Vertical Ergonomic Wireless mouse at Best Buy as of October 12, 2020)
    luaunit.assertEquals(cc.convertCanadianDollarToUSDollar(129.99), "98.79")
    -- Testing the case of zero
    luaunit.assertEquals(cc.convertCanadianDollarToUSDollar(0), "0.00")
    -- Testing the case of a negative number
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive.", cc.convertCanadianDollarToUSDollar, -0.42)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertCanadianDollarToUSDollar, "The name 'Canjapus' reminds me of a platypus..")
end

function testConvertUSDollarToCanadianDollar()
    -- Testing the base conversion factor
    luaunit.assertEquals(cc.convertUSDollarToCanadianDollar(1.00), "1.32")
    -- Testing proper conversion using a valid value
    luaunit.assertEquals(cc.convertUSDollarToCanadianDollar(1699.72), "2236.47")
    -- Testing the case of zero
    luaunit.assertEquals(cc.convertUSDollarToCanadianDollar(0.00), "0.00")
    -- Testing the case of a negative number
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive.", cc.convertUSDollarToCanadianDollar, -29.14)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertUSDollarToCanadianDollar, "Visual Studio Code is an awesome text editor!")
end

function testConvertUSDollarToJapaneseYen()
    -- Testing the base conversion factor
    luaunit.assertEquals(cc.convertUSDollarToJapaneseYen(1.00), "105.34")
    -- Testing proper conversion using a valid value
    luaunit.assertEquals(cc.convertUSDollarToJapaneseYen(259.96), "27384.19")
    -- Testing the case of zero
    luaunit.assertEquals(cc.convertUSDollarToJapaneseYen(0), "0.00")
    -- Testing the case of a negative number
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive.", cc.convertUSDollarToJapaneseYen, -9001)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertUSDollarToJapaneseYen, ".. IT'S OVER 9000!!")
end

function testConvertJapaneseYenToUSDollar()
    -- Testing the base conversion factor
    luaunit.assertEquals(cc.convertJapaneseYenToUSDollar(1), "0.01")
    -- Testing the proper conversion using a valid value
    luaunit.assertEquals(cc.convertJapaneseYenToUSDollar(253.47), "2.41")
    -- Testing the case of zero
    luaunit.assertEquals(cc.convertJapaneseYenToUSDollar(0), "0.00")
    -- Testing the case of a negative number (Fun fact: Absolute zero corresponds to -273.15 degrees celcius or 0 K)
    luaunit.assertErrorMsgContains("Error: Dollar amounts should be positive.", cc.convertJapaneseYenToUSDollar, -273.15)
    -- Testing the case of passing a non-number
    luaunit.assertErrorMsgContains("Error: Entry was not a valid dollar amount.", cc.convertJapaneseYenToUSDollar, "The quick brown fox jumps over the lazy dog.")
end
os.exit(luaunit.LuaUnit.run())