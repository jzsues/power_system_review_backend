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
 * Locale: PL (Polish; język polski, polszczyzna)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "To pole jest wymagane.",
		remote: "Proszę o wypełnienie tego pola.",
		email: "Proszę o podanie prawidłowego adresu email.",
		url: "Proszę o podanie prawidłowego URL.",
		date: "Proszę o podanie prawidłowej daty.",
		dateISO: "Proszę o podanie prawidłowej daty (ISO).",
		number: "Proszę o podanie prawidłowej liczby.",
		digits: "Proszę o podanie samych cyfr.",
		creditcard: "Proszę o podanie prawidłowej karty kredytowej.",
		equalTo: "Proszę o podanie tej samej wartości ponownie.",
		accept: "Proszę o podanie wartości z prawidłowym rozszerzeniem.",
		maxlength: $.validator.format("Proszę o podanie nie więcej niż {0} znaków."),
		minlength: $.validator.format("Proszę o podanie przynajmniej {0} znaków."),
		rangelength: $.validator.format("Proszę o podanie wartości o długości od {0} do {1} znaków."),
		range: $.validator.format("Proszę o podanie wartości z przedziału od {0} do {1}."),
		max: $.validator.format("Proszę o podanie wartości mniejszej bądź równej {0}."),
		min: $.validator.format("Proszę o podanie wartości większej bądź równej {0}.")
	});
}(jQuery));