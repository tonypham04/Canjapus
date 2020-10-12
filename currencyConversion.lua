local currencyConversion = {}

-- Conversion Factors
CANADIAN_DOLLAR_TO_JAPANESE_YEN_CONVERSION_FACTOR = 78.89

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

function currencyConversion.convertCanadianDollarToJapaneseYen(dollars)
    return currencyConversion.convertAmount(dollars, CANADIAN_DOLLAR_TO_JAPANESE_YEN_CONVERSION_FACTOR)
end

return currencyConversion