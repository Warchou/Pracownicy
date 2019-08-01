--- Wczytujemy liste pracownikow ---
	plikR = io.open("pracownicy.txt")
	lista = plikR:read("*all")
	plikR:close()
--- Pobieramy dane nowego pracownika ---
	print("Wprowadz dane nowego pracownika:")
	nowyPracownik = io.read()
    --- Jezeli lista bedzie pusta nie dodamy entera przed pierwszym pracownikiem ---
    if lista ~= "" then
      lista = lista .. "\n"
    end
    --- Otwieramy plik zeby nadpisac liste wraz z nowym pracownikiem ---
    plikW = io.open("pracownicy.txt", "w")
    plikW:write(lista .. nowyPracownik)
    plikW:close()
