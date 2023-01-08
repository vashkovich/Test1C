﻿#language: ru

@tree

Функционал: Проверка заполнения поля Организации при заполнении Заказа покупателя

Как Тестировщик я хочу
проверить заполнение поля Организации в документе Заказ покупателя
чтобы заполнение данного документа было быстрее и эффективнее 

Контекст: 
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка заполнения поля Организации при заполнении документа Заказ покупателя
	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И в поле с именем "Partner" я ввожу текст "Клиент 1 (1 соглашение)"
	И я перехожу к следующему реквизиту
	
	
	И элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	Если элемент формы с именем "Company" стал равен 'Собственная компания 1' Тогда 
		И я перехожу к следующему реквизиту
			
	Если элемент формы с именем "Company" стал равен '' Тогда
	
		И я нажимаю кнопку выбора у поля с именем "Company"
		Тогда открылось окно 'Организации'
		И в таблице "List" я активизирую поле с именем "Description"
		Тогда таблица "List" стала равной:
			| 'Код' | 'Наименование'           |
			| '1'   | 'Собственная компания 1' |
			| '2'   | 'Собственная компания 2' |
		
		И в таблице "List" я перехожу к строке
			| 'Код' | 'Наименование'           |
			| '1'   | 'Собственная компания 1' |
		И в таблице "List" я выбираю текущую строку

	Тогда открылось окно 'Заказ покупателя (создание) *'
	
	И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
	И в таблице "ItemList" я активизирую поле с именем "ItemListItem"
	И в таблице "ItemList" из выпадающего списка с именем "ItemListItem" я выбираю по строке 'набор'
	И я перехожу к следующему реквизиту
	И в таблице "ItemList" в поле с именем 'ItemListItemKey' я ввожу текст ''
	И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItemKey"
	Тогда открылось окно 'Характеристики'
	И в таблице "List" я перехожу к строке:
		| 'Item key'                  | 'Код' | 'Номенклатура' | 'Спецификация товара'      | 'Характеристика'            |
		| 'Набор/Товар с характеристиками' | '9'   | 'Набор'        | 'Товар с характеристиками' | 'Набор/Товар с характеристиками' |
	И в таблице "List" я активизирую поле с именем "Item"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListPrice"
	И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListPrice"
	И в таблице "ItemList" в поле с именем "ItemListPrice" я ввожу текст "500,00"
	И в таблице "ItemList" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormPost'
		
