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
		wyswietlListe = loadfile("Wyswietl_liste.lua")
		wyswietlListe()
    elseif wybor == "2" then
		dodajPracownika = loadfile("Dodaj_pracownika.lua")
		dodajPracownika()
    elseif wybor == "3" then
		wyszukajUsun = loadfile("Wyszukaj_i_usun.lua")
		wyszukajUsun()
    elseif wybor == "4" then
      zakonczProgram = true
    else
		print("nie ma takiej opcji")
	 end
until zakonczProgram == true
print("Enter by zakonczyc")
io.read()
