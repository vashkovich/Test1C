#language: ru

@tree
@БыстрыеПроверки

Функционал: проверка формы справочника организации

Как Тестировщик я хочу
проверить доступность вкладки Налоги и Валюты
чтобы проверить пользователя на заполненность данных формы

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка доступности вкладок Налоги и Валюты справочника Организации
* Открытие элемента
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Организация (создание)'
* Установка галочки и проверка наличия на форме вкладок Налоги и Валюты
	И я устанавливаю флаг с именем 'OurCompany'
	И элемент формы "Валюты" присутствует на форме
	И элемент формы "Вид налога" присутствует на форме
* Снятие галочки и проверка отсутствия на форме вкладок Налоги и Валюты
	И я снимаю флаг с именем 'OurCompany'
	И элемент формы "Валюты" существует и невидим на форме
	И элемент формы "Вид налога" существует и невидим на форме
	И я закрываю все окна клиентского приложения

Сценарий: проверка функциональной опции Организации
	И Я устанавливаю в константу "UseCompanies" значение "False"
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	Тогда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И элемент формы "Организация" отсутствует на форме
	Когда Проверяю шаги на Исключение:
		|'И элемент формы "Организация" отсутствует на форме'|
	И я закрываю все окна клиентского приложения

Сценарий: проверка заполнения справочника Организации
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Организация (создание)'
	И в поле с именем 'Description_ru' я ввожу текст 'Тестовый контрагент'
	И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
	И я нажимаю на кнопку с именем 'FormWrite'

	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'

	И в таблице "List" я перехожу к строке:
		| 'Наименование'        |
		| 'Тестовый контрагент' |
	И в таблице "List" я выбираю текущую строку
	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	И я закрываю все окна клиентского приложения

//	И я жду закрытия окна 'Тестовый контрагент (Организация)' в течение 20 секунд
	
//И я нажимаю на кнопку с именем 'FormWriteAndClose'
//И я жду закрытия окна 'Организация (создание) *' в течение 20 секунд
Сценарий: проверка расположения элементов справочника Организации
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	@screenshot
	Тогда открылось окно 'Организация (создание)'
	И я закрываю все окна клиентского приложения

