# music_directory_organizer

DOKUMENT TECHNICZNY PROJEKTU SKRYPTU [music_directory_organizer]

1. Tematyka projektu

Skrypt będzie służył do organizacji katalogu zawierającego pliki z rozszerzeniem mp3, oraz do ujednolicenia nazw tych plików i podkatalogów. Z każdego pliku, znajdującego się w katalogu zadanym przez użytkownika jako parametr, pobrane zostaną metadane oznaczające: numer utworu, tytuł, album, rok i artystę. Na tej podstawie skrypt zmieni nazwy plików na: ”[numer] - [tytuł]”, oraz w nowym katalogu stworzy podkatalogi w hierarchii: ”[artysta]”/”[album] ([rok])”, o nazwach odpowiadających metadanym plików, które zostaną do nich przeniesione. Pliki których tagi nie zostały rozpoznane trafią do katalogu ”unknown”.

2. Opis techniczny projektu

Projekt zostanie stworzony z wykorzystaniem dystrybucji Debian (wersja 10.9.0) z środowiskiem GNOME. Aby skrypt mógł odczytać metadane z pliku mp3 konieczne będzie zainstalowanie narzędzia „id3v2”. 

3. Potencjalne możliwe problemy i zagrożenia

Brak narzędzia „id3v2”. Pliki mogą zawierać dane niezgodne ze standardem ID3v2, lub potrzebne tam dane mogą być niezupełne. Brak uprawnień do edycji zadanych plików.
