#language: ru

@tree

Функционал: Создание 10 элементов справочника Номенклатура посредством цикла

Как Тестировщик я хочу
с помощью цикла создать 10 элементов справочника
чтобы не создавать их пошагово для нагрузочного тестирования

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание элементов справочника Номенклатура посредством цикла
	
	И я запоминаю значение выражения "6" в переменную "Шаг"
	И я делаю 10 раз
		И я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И я запоминаю значение выражения '"Товар без характеристик" + $Шаг$' в переменную "НаименованиеНоменклатуры"
		И я проверяю или создаю для справочника "Items" объекты:
						| 'Ref'                                                              | 'DeletionMark' | 'Code'  | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'             | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
						| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-","")}' | 'False'        | '$Шаг$' | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58791'  | ''            | '$НаименованиеНоменклатуры$' | ''                 | ''               | ''               |          |          |          | 0.21     |         |


* e1cib/data/Catalog.Items?ref=b762b13668d0905011eb76684b9f687d