local currencyConversion = {}

-- Conversion Factors
CANADIAN_DOLLAR_TO_JAPANESE_YEN_CONVERSION_FACTOR = 78.89

function currencyConversion.convertCanadianDollarToJapaneseYen(dollars)
    -- Need to test param was a number first before checking if it is negative
    if type(dollars) ~= "number" then
        error("Error: Entry was not a valid dollar amount.")
    end
    if dollars < 0 then
        error("Error: Dollar amounts should be positive.")
    end
    return string.format("%.2f", dollars * CANADIAN_DOLLAR_TO_JAPANESE_YEN_CONVERSION_FACTOR)
end

return currencyConversion