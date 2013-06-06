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
 * Locale: SK (Slovak; slovenčina, slovenský jazyk)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Povinné zadať.",
		maxlength: $.validator.format("Maximálne {0} znakov."),
		minlength: $.validator.format("Minimálne {0} znakov."),
		rangelength: $.validator.format("Minimálne {0} a Maximálne {0} znakov."),
		email: "E-mailová adresa musí byť platná.",
		url: "URL musí byť platný.",
		date: "Musí byť dátum.",
		number: "Musí byť číslo.",
		digits: "Môže obsahovať iba číslice.",
		equalTo: "Dva hodnoty sa musia rovnať.",
		range: $.validator.format("Musí byť medzi {0} a {1}."),
		max: $.validator.format("Nemôže byť viac ako{0}."),
		min: $.validator.format("Nemôže byť menej ako{0}."),
		creditcard: "Číslo platobnej karty musí byť platné."
	});
}(jQuery));