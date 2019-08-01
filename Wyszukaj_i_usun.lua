--- Wczytujemy liste pracownikow ---
	plikR = io.open("pracownicy.txt")
	lista = plikR:read("*all")
	plikR:close()
print("Nazwa pracownika ktorego chcesz wyszukac")
      szukanyPracownik = io.read()
      --- Sprawdzamy czy nazwa pracownika znajduje sie na liscie ---
      czyJest = string.find(lista, szukanyPracownik, 1, true)
      if czyJest then print("Znaleziono pracownika: " .. szukanyPracownik)
        print("Czy chcesz go usunac z listy t/n")
        czyUsuwac = io.read()
      if czyUsuwac == "t" then
      --- Sprawdzamy czy pracownik jest ostatni na liscie zeby wiedziec czy tzraba usunac entera przed czy po nim ---
      if #lista ~= string.find(lista, szukanyPracownik) + #szukanyPracownik - 1 then
        --- Pracownik jest w srodku listy
        szukanyPracownik = szukanyPracownik .. "\n"
        print("lista nie konczy sie na pracowniku")
      elseif #lista == string.find(lista, szukanyPracownik) + #szukanyPracownik - 1 and zaczynaSie(lista, szukanyPracownik) then
        print("Pracownik zostal sam")
      else
        szukanyPracownik = "\n" .. szukanyPracownik
        print("Pracownik jest na koncu")
      end
      --- Podmieniamy dane pracownika z nalezycie dobranym enterem na pusty string (usuwamy)---
      lista = lista:gsub(szukanyPracownik, "")
      plikW = io.open("pracownicy.txt", "w")
      plikW:write(lista)
      plikW:close()
    end
      else
        print("Nie ma takiego pracownika")
      end
