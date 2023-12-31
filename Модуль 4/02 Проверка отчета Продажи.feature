﻿#language: ru

@tree
@Отчеты

Функционал: тестирование отчетов

Как Тестировщик я хочу
протестировать отчеты 
чтобы проверить что у пользователя не возникнет проблем

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0901 подготовительный сценарий (тестирование отчетов)
	Когда экспорт основных данных
	Когда экспорт документов по продажам
	И я выполняю код встроенного языка на сервере
		| 'Документы.SalesOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' 	  |
		| 'Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'   |

Сценарий: _0902 проверка отчета Продажи
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	Когда открылось окно 'D2001 Продажи'
	И я нажимаю на кнопку с именем 'FormGenerate'
	Дано Табличный документ "Result" равен макету "ОтчетПродажи" по шаблону
