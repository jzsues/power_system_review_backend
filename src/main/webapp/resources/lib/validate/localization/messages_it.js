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
 * Locale: IT (Italian; Italiano)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Campo obbligatorio.",
		remote: "Controlla questo campo.",
		email: "Inserisci un indirizzo email valido.",
		url: "Inserisci un indirizzo web valido.",
		date: "Inserisci una data valida.",
		dateISO: "Inserisci una data valida (ISO).",
		number: "Inserisci un numero valido.",
		digits: "Inserisci solo numeri.",
		creditcard: "Inserisci un numero di carta di credito valido.",
		equalTo: "Il valore non corrisponde.",
		accept: "Inserisci un valore con un&apos;estensione valida.",
		maxlength: $.validator.format("Non inserire pi&ugrave; di {0} caratteri."),
		minlength: $.validator.format("Inserisci almeno {0} caratteri."),
		rangelength: $.validator.format("Inserisci un valore compreso tra {0} e {1} caratteri."),
		range: $.validator.format("Inserisci un valore compreso tra {0} e {1}."),
		max: $.validator.format("Inserisci un valore minore o uguale a {0}."),
		min: $.validator.format("Inserisci un valore maggiore o uguale a {0}.")
	});
}(jQuery));