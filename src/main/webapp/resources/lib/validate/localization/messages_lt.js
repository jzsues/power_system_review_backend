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
 * Locale: LT (Lithuanian; lietuvių kalba)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Šis laukas yra privalomas.",
		remote: "Prašau pataisyti šį lauką.",
		email: "Prašau įvesti teisingą elektroninio pašto adresą.",
		url: "Prašau įvesti teisingą URL.",
		date: "Prašau įvesti teisingą datą.",
		dateISO: "Prašau įvesti teisingą datą (ISO).",
		number: "Prašau įvesti teisingą skaičių.",
		digits: "Prašau naudoti tik skaitmenis.",
		creditcard: "Prašau įvesti teisingą kreditinės kortelės numerį.",
		equalTo: "Prašau įvestį tą pačią reikšmę dar kartą.",
		accept: "Prašau įvesti reikšmę su teisingu plėtiniu.",
		maxlength: $.format("Prašau įvesti ne daugiau kaip {0} simbolių."),
		minlength: $.format("Prašau įvesti bent {0} simbolius."),
		rangelength: $.format("Prašau įvesti reikšmes, kurių ilgis nuo {0} iki {1} simbolių."),
		range: $.format("Prašau įvesti reikšmę intervale nuo {0} iki {1}."),
		max: $.format("Prašau įvesti reikšmę mažesnę arba lygią {0}."),
		min: $.format("Prašau įvesti reikšmę didesnę arba lygią {0}.")
	});
}(jQuery));