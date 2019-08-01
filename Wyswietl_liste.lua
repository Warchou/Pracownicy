plikR = io.open("pracownicy.txt")
	lista = plikR:read("*all")
	plikR:close()
if lista == "" then
        print("Lista jest pusta")
    else
		--- Wyswietla cala liste pracownikow ---
		print("Oto Lista pracownikow:")
		print(lista)
	end
