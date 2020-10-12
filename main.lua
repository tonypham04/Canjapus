local cc = require("currencyConversion")

local function displayMainMenu()
    print("Main Menu")
    print("a. Convert Canadian Dollar to Japanese Yen")
    print("q. Quit")
    io.write("> ")
end

local choice = nil

local function run()
    repeat
        displayMainMenu()
        choice = io.read("l")
        if choice == "a" or choice == "A" then
            local amt = nil
            repeat
                print("Converting the Canadian Dollar to Japanese Yen")
                print("Enter the amount to convert.")
                print("Press b to go back to the main menu.")
                io.write("> ")
                amt = io.read()
                if tonumber(amt) then
                    amt = tonumber(amt)
                    if amt >= 0 then
                        io.write(string.format("$%.2f is equal to %s yen.\n", amt, cc.convertCanadianDollarToJapaneseYen(amt)))
                    else
                        io.write("A dollar amount cannot be negative. Please try again.")
                    end
                elseif amt == "b" or amt == "b" then
                    io.write("Returning to the main menu..\n")
                else
                    io.write("Invalid input. Please try again.\n")
                end
            until type(amt) == "number" or amt == "b" or amt == "B"
        end
    until choice == "q" or choice == "Q"
end

local function main()
    run()
end

main()