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
 * Locale: CA (Catalan; català)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Aquest camp és obligatori.",
		remote: "Si us plau, omple aquest camp.",
		email: "Si us plau, escriu una adreça de correu-e vàlida",
		url: "Si us plau, escriu una URL vàlida.",
		date: "Si us plau, escriu una data vàlida.",
		dateISO: "Si us plau, escriu una data (ISO) vàlida.",
		number: "Si us plau, escriu un número enter vàlid.",
		digits: "Si us plau, escriu només dígits.",
		creditcard: "Si us plau, escriu un número de tarjeta vàlid.",
		equalTo: "Si us plau, escriu el maateix valor de nou.",
		accept: "Si us plau, escriu un valor amb una extensió acceptada.",
		maxlength: $.validator.format("Si us plau, no escriguis més de {0} caracters."),
		minlength: $.validator.format("Si us plau, no escriguis menys de {0} caracters."),
		rangelength: $.validator.format("Si us plau, escriu un valor entre {0} i {1} caracters."),
		range: $.validator.format("Si us plau, escriu un valor entre {0} i {1}."),
		max: $.validator.format("Si us plau, escriu un valor menor o igual a {0}."),
		min: $.validator.format("Si us plau, escriu un valor major o igual a {0}.")
	});
}(jQuery));