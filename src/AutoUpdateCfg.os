#Использовать v8runner

// Создание резервной копии базы.
// Не делает проверку на наличие соединений с базой
//
// Параметры:
//  Параметры  - Структура - Параметры соединения и архивирования
//    ПутьКБазе - Строка - Строка соединения с базой
//    Логин - Строка - Логин для входа в базу
//    Пароль - Строка - Пароль для входа в базу
//    КаталогКопий - Строка - Куда положить резервную копию
//    ИмяФайлаВыгрузки - Строка - Основная часть имени резервной копии
//    Суфикс - Строка - Дополнительный текст вставляемый в имя файла копии
//
// Возвращаемое значение:
//   Булево
//
Функция СделатьРезервнуюКопию(Параметры) Экспорт
	Конфигуратор = Новый УправлениеКонфигуратором();

	СтрДата = Формат(ТекущаяДата(), "ДФ=""гггг-ММ-дд_ЧЧ-мм""");
	ПутьВыгрузки = ОбъединитьПути(Параметры.КаталогКопий, Параметры.ИмяФайлаВыгрузки + "_" + СтрДата + "-" + Параметры.Суфикс + ".dt");
	
	Конфигуратор.УстановитьКонтекст(Параметры.ПутьКБазе, Параметры.Логин, Параметры.Пароль);
	Конфигуратор.ВыгрузитьИнформационнуюБазу(ПутьВыгрузки);

	Возврат Истина;

КонецФункции // СделатьРезервнуюКопию()

// Обновляет конфиграцию
//
// Параметры:
//  Параметры  - Структура - Параметры соединения и архивирования
//    ПутьКБазе - Строка - Строка соединения с базой
//    Логин - Строка - Логин для входа в базу
//    Пароль - Строка - Пароль для входа в базу
//    КаталогВерсии - Строка - Месторасположение файла обновления
//
// Возвращаемое значение:
//   Булево
//
Функция УстановитьОбновление(Параметры) Экспорт

	Конфигуратор = Новый УправлениеКонфигуратором();
	Конфигуратор.УстановитьКонтекст(Параметры.ПутьКБазе, Параметры.Логин, Параметры.Пароль);
	Конфигуратор.ОбновитьКонфигурацию(Параметры.КаталогВерсии, Ложь);
	Конфигуратор.ОбновитьКонфигурациюБазыДанных();

	Возврат Истина;

КонецФункции // УстановитьОбновление(Параметры)

Процедура Инициализация()
	
КонецПроцедуры

Инициализация();