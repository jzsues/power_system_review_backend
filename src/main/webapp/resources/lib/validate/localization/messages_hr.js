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
 * Locale: HR (Croatia; hrvatski jezik)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Ovo polje je obavezno.",
		remote: "Ovo polje treba popraviti.",
		email: "Unesite ispravnu e-mail adresu.",
		url: "Unesite ispravan URL.",
		date: "Unesite ispravan datum.",
		dateISO: "Unesite ispravan datum (ISO).",
		number: "Unesite ispravan broj.",
		digits: "Unesite samo brojeve.",
		creditcard: "Unesite ispravan broj kreditne kartice.",
		equalTo: "Unesite ponovo istu vrijednost.",
		accept: "Unesite vrijednost sa ispravnom ekstenzijom.",
		maxlength: $.validator.format("Maksimalni broj znakova je {0} ."),
		minlength: $.validator.format("Minimalni broj znakova je {0} ."),
		rangelength: $.validator.format("Unesite vrijednost između {0} i {1} znakova."),
		range: $.validator.format("Unesite vrijednost između {0} i {1}."),
		max: $.validator.format("Unesite vrijednost manju ili jednaku {0}."),
		min: $.validator.format("Unesite vrijednost veću ili jednaku {0}.")
	});
}(jQuery));