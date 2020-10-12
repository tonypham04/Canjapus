local cc = require("currencyConversion")
local graphics = require("design")

local function displayMainMenu()
    print(graphics.logo)
    print("Main Menu")
    print("a. Convert Canadian Dollar to Japanese Yen")
    print("b. Convert Japanese Yen to Canadian Dollar")
    print("c. Convert Canadian Dollar to US Dollar")
    print("q. Quit")
    io.write("> ")
end

local function displayConversionMenu(fromAmount, toAmount)
    io.write(string.format("Converting the %s to %s\n", fromAmount, toAmount))
    print("Enter the amount to convert.")
    print("Press b to go back to the main menu.")
    io.write("> ")
end

local function getAndValidateAmount(fromAmount, toAmount)
    repeat
        local amt = nil
        displayConversionMenu(fromAmount, toAmount)
        amt = io.read()
        if tonumber(amt) then
            amt = tonumber(amt)
            if amt >= 0 then
                return amt
            else
                io.write("A dollar amount cannot be negative. Please try again.\n")
            end
        elseif amt == "b" or amt == "B" then
            return amt
        else
            io.write("Invalid input. Please try again.\n")
        end
    until (type(amt) == "number" and amt >= 0) or amt == "b" or amt == "B"
end

local choice = nil

local function run()
    repeat
        displayMainMenu()
        local amount = 0;
        choice = io.read("l")
        if choice == "a" or choice == "A" then
            amount = getAndValidateAmount("Canadian Dollar", "Japanese Yen")
            if type(amount) == "number" then
                io.write(string.format("$%.2f is equal to %s yen.\n", amount, cc.convertCanadianDollarToJapaneseYen(amount)))
            else
                io.write("Returning to the main menu..\n")
            end
        elseif choice == "b" or choice == "B" then
            amount = getAndValidateAmount("Japanese Yen", "Canadian Dollar")
            if type(amount) == "number" then
                io.write(string.format("%.2f yen is equal to $%s Canadian.\n", amount, cc.convertJapaneseYenToCanadianDollar(amount)))
            else
                io.write("Returning to the main menu..\n")
            end
        elseif choice == "c" or choice == "C" then
            amount = getAndValidateAmount("Canadian Dollar", "American Dollar")
            if type(amount) == "number" then
                io.write(string.format("$%.2f Canadian is equal to $%.2f US.\n", amount, cc.convertCanadianDollarToUSDollar(amount)))
            else
                io.write("Returning to the main menu..\n")
            end
        elseif choice == "q" or choice == "Q" then
            print("Exiting the program..")
        else
            print("Invalid option. Please choose between options a, b and q.\n")
        end
    until choice == "q" or choice == "Q"
end

local function main()
    run()
end

main()