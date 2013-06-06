/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: UK (Ukrainian; українська мова)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Це поле необхідно заповнити.",
		remote: "Будь ласка, введіть правильне значення.",
		email: "Будь ласка, введіть коректну адресу електронної пошти.",
		url: "Будь ласка, введіть коректний URL.",
		date: "Будь ласка, введіть коректну дату.",
		dateISO: "Будь ласка, введіть коректну дату у форматі ISO.",
		number: "Будь ласка, введіть число.",
		digits: "Вводите потрібно лише цифри.",
		creditcard: "Будь ласка, введіть правильний номер кредитної карти.",
		equalTo: "Будь ласка, введіть таке ж значення ще раз.",
		accept: "Будь ласка, виберіть файл з правильним розширенням.",
		maxlength: $.validator.format("Будь ласка, введіть не більше {0} символів."),
		minlength: $.validator.format("Будь ласка, введіть не менше {0} символів."),
		rangelength: $.validator.format("Будь ласка, введіть значення довжиною від {0} до {1} символів."),
		range: $.validator.format("Будь ласка, введіть число від {0} до {1}."),
		max: $.validator.format("Будь ласка, введіть число, менше або рівно {0}."),
		min: $.validator.format("Будь ласка, введіть число, більше або рівно {0}.")
	});
}(jQuery));