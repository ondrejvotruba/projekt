# Název projektu
CS2 Tactical Hub: Interaktivní průvodce hrou

# Žák
Ondřej Votruba

# Stručný popis tématu (3–5 vět)
Webová prezentace zaměřená na taktickou střílečku Counter-Strike 2. Stránka bude mít podobu one-page webu s několika sekcemi, které představí novinky ve hře, principy ekonomiky, detailní katalog zbraní a přehled kompetitivních map. Obsah bude z velké části načítán dynamicky z JSON souborů pomocí AJAXu. Cílem projektu je vytvořit moderní, přehledný a responzivní web s herní tématikou, se zaměřením na práci s daty a jednoduchou serverovou komunikaci.

# Cílová skupina
Začínající hráči, kteří se chtějí naučit základy herní ekonomiky, a pokročilí hráči hledající přesné statistiky zbraní a informace o aktuálním map poolu.

# Návrh obsahových sekcí
* **O hře CS2** – představení nové verze hry, přechod na Source 2 engine, hlavní rozdíly oproti CS:GO.
* **Herní ekonomika** – vysvětlení nákupního systému, odměny za kolo (loss bonus), management peněz.
* **Arzenál (Zbrojnice)** – dynamicky načítaný seznam zbraní s fotografiemi a statistikami (damage, cena, penetrace).
* **Map Pool** – přehled aktivních turnajových map a jejich specifika.
* **Kontakt** – formulář pro nahlášení chyb v datech nebo návrhy na vylepšení obsahu.

# Návrh designu / wireframe
* Tmavé barevné ladění typické pro herní komunitu.
* Přehledné blokové uspořádání sekcí pod sebou.
* Karty zbraní v gridu
* Jednoduché a čitelné UI, moderní prvky

# Použité technologie
* **Frontend:** HTML, JavaScript
* **Data:** JSON soubory pro textové sekce + JSON databáze zbraní
* **AJAX:** načítání obsahu sekcí a seznamu zbraní
* **Backend:** jednoduchý PHP endpoint pro odeslání kontaktního formuláře
* **Verzování:** Git + GitHub 

# Očekávaný přínos / co se naučím
* práce s JSON a strukturovanými daty (reprezentace herních předmětů)
* načítání dat pomocí AJAX a dynamické vkládání obsahu
* tvorba responzivního designu s herním vizuálem
* základní formulářová komunikace se serverem
* organizace projektu ve složkách, verzování přes GitHub
