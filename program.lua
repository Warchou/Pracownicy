zakonczProgram = false
-- fonkcja pozwala sprawdzic czy str zaczyna sie danym ciagiem znakow ---
function zaczynaSie(calosc, kawalek)
   return calosc:sub(1, #kawalek) == kawalek
end

repeat
  --- Wczytujemy liste pracownikow ---
	plikR = io.open("pracownicy.txt")
	lista = plikR:read("*all")
	plikR:close()
	print("Co chcesz zrobic?")
	print("1. Wyswietl liste pracownikow")
	print("2. Dodaj pracownika")
  print("3. Wyszukaj i usun")
	print("4. Zamknij Program")
  --- Pobieramy opcje od uzytkownika ---
    wybor = io.read()
    if wybor == "1" then
      if lista == "" then
        print("Lista jest pusta")
      else
      --- Wyswietla cala liste pracownikow ---
      print("Oto Lista pracownikow:")
      print(lista)
      end
    elseif wybor == "2" then
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
    elseif wybor == "3" then
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
    elseif wybor == "4" then
      zakonczProgram = true
    else
		print("nie ma takiej opcji")
	 end
until zakonczProgram == true
print("Enter by zakonczyc")
io.read()
