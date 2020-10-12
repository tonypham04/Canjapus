local currencyConversion = {}

-- Conversion Factors as of October 12, 2020
CANADIAN_DOLLAR_TO_JAPANESE_YEN_CONVERSION_FACTOR = 80.32
CANADIAN_DOLLAR_TO_US_DOLLAR = 0.76
US_DOLLAR_TO_JAPANESE_YEN = 105.34

function currencyConversion.convertAmount(amount, conversionFactor)
    -- Validate that the passed in amount is appropriate before attempting to convert
    if type(amount) ~= "number" then
        error("Error: Entry was not a valid dollar amount.")
    end
    if amount < 0 then
        error("Error: Dollar amounts should be positive.")
    end
    return string.format("%.2f", amount * conversionFactor)
end

function currencyConversion.convertCanadianDollarToJapaneseYen(dollar)
    return currencyConversion.convertAmount(dollar, CANADIAN_DOLLAR_TO_JAPANESE_YEN_CONVERSION_FACTOR)
end

function currencyConversion.convertJapaneseYenToCanadianDollar(yen)
    return currencyConversion.convertAmount(yen, 1/CANADIAN_DOLLAR_TO_JAPANESE_YEN_CONVERSION_FACTOR)
end

function currencyConversion.convertCanadianDollarToUSDollar(dollar)
    return currencyConversion.convertAmount(dollar, CANADIAN_DOLLAR_TO_US_DOLLAR)
end

function currencyConversion.convertUSDollarToCanadianDollar(dollar)
    return currencyConversion.convertAmount(dollar, 1/CANADIAN_DOLLAR_TO_US_DOLLAR)
end

function currencyConversion.convertUSDollarToJapaneseYen(dollar)
    return currencyConversion.convertAmount(dollar, US_DOLLAR_TO_JAPANESE_YEN)
end

return currencyConversion