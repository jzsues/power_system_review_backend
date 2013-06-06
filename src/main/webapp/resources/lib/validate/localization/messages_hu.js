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
 * Locale: HU (Hungarian; Magyar)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Kötelező megadni.",
		maxlength: $.validator.format("Legfeljebb {0} karakter hosszú legyen."),
		minlength: $.validator.format("Legalább {0} karakter hosszú legyen."),
		rangelength: $.validator.format("Legalább {0} és legfeljebb {1} karakter hosszú legyen."),
		email: "Érvényes e-mail címnek kell lennie.",
		url: "Érvényes URL-nek kell lennie.",
		date: "Dátumnak kell lennie.",
		number: "Számnak kell lennie.",
		digits: "Csak számjegyek lehetnek.",
		equalTo: "Meg kell egyeznie a két értéknek.",
		range: $.validator.format("{0} és {1} közé kell esnie."),
		max: $.validator.format("Nem lehet nagyobb, mint {0}."),
		min: $.validator.format("Nem lehet kisebb, mint {0}."),
		creditcard: "Érvényes hitelkártyaszámnak kell lennie.",
		remote: "Kérem javítsa ki ezt a mezőt.",
		dateISO: "Kérem írjon be egy érvényes dátumot (ISO)."
	});
}(jQuery));