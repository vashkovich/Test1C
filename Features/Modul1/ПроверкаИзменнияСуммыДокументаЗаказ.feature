#language: ru

@tree

Функционал: Пересчет суммы в табличной части

Как Менеджер по продажам я хочу
проверить правильность пересчета сумм в табличной части 
чтобы автоматически пересчитывать сумму товара
Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка расчета изменения суммы в документе Заказ Товаров
* Создаем документ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполняем шапку документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
* Добавляем товар
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000024' | 'Кроссовки'        |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
//И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Кроссовки' | '3 700,00' | '2'          | '7 400,00' |

	Когда открылось окно 'Заказ (создание) *'
* Изменяем цену и проверяем расчет
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3,00'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '300,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверяем пересчет
	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Кроссовки' | '300,00' | '3'          | '900,00' |
* Закроем документ
	Когда открылось окно 'Заказ (создание) *'
	И Я закрываю окно 'Заказ (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'


Сценарий: Проверка установки количества для Услуги в Заказе
* Выбираем документ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Мелкооптовая'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Строящийся склад'
* Тобавляем услугу
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000037' | 'Доставка'     |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я завершаю редактирование строки
* Проверяем изменение количества Услуг
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '9'
	И в таблице "Товары" я завершаю редактирование строки

	Тогда таблица "Товары" стала равной:
		| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'  |
		| 'Доставка' | '*' | '9'          | '*' |
		
* Закроем документ
	Когда открылось окно 'Заказ (создание) *'
	И Я закрываю окно 'Заказ (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'


