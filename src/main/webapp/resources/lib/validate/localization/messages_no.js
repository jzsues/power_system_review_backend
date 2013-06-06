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
 * Locale: NO (Norwegian; Norsk)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Dette feltet er obligatorisk.",
		maxlength: $.validator.format("Maksimalt {0} tegn."),
		minlength: $.validator.format("Minimum {0} tegn."),
		rangelength: $.validator.format("Angi minimum {0} og maksimum {1} tegn."),
		email: "Oppgi en gyldig epostadresse.",
		url: "Angi en gyldig URL.",
		date: "Angi en gyldig dato.",
		dateISO: "Angi en gyldig dato (&ARING;&ARING;&ARING;&ARING;-MM-DD).",
		dateSE: "Angi en gyldig dato.",
		number: "Angi et gyldig nummer.",
		numberSE: "Angi et gyldig nummer.",
		digits: "Skriv kun tall.",
		equalTo: "Skriv samme verdi igjen.",
		range: $.validator.format("Angi en verdi mellom {0} og {1}."),
		max: $.validator.format("Angi en verdi som er mindre eller lik {0}."),
		min: $.validator.format("Angi en verdi som er st&oslash;rre eller lik {0}."),
		creditcard: "Angi et gyldig kredittkortnummer."
	});
}(jQuery));