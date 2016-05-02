--
-- MoneyMoney Export Extension
-- http://moneymoney-app.com/api/export
--
--
-- The MIT License (MIT)
--
-- Copyright (c) 2015 Daniel Kriesten
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--
-- Export transactions as CSV file with extended information of the source.
--

Exporter{version  = 0.02,
        format           = MM.localizeText("ExtCSV file"),
        fileExtension    = "csv",
        -- bundleIdentifier = "org.vim.MacVim",
        reverseOrder     = false,
        description      = MM.localizeText("Export transactions as CSV file with extended information of the source.")}


function WriteHeader (account, startDate, endDate, transactionCount)
    assert(io.write("Datum;Wertstellung;Kategorie;QuellKto-Name;QuellKto-Owner;QuellKto-Nr;Ziel-Name;Verwendungszweck;Ziel-Konto;Ziel-Bank;Betrag;Währung\n"))
end


function WriteTransactions (account, transactions)

    for _,transaction in ipairs(transactions) do
        assert(io.write(MM.localizeDate(transaction.bookingDate) .. ";",
        MM.localizeDate(transaction.valueDate) .. ";",
        transaction.category .. ";",
        account.name .. ";",
        account.owner .. ";",
        account.accountNumber .. ";",
        MM.localizeText(transaction.type) .. ";",
        transaction.name .. ";",
        transaction.purpose .. ";",
        transaction.accountNumber .. ";",
        transaction.bankCode .. ";",
        string.format("%.02f", transaction.amount) .. ";",
        transaction.currency .. "\n"))
    end

end


function WriteTail (account)
    -- Nothing todo
end

