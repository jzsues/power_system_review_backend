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
 * Locale: LV (Latvian; latviešu valoda)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Šis lauks ir obligāts.",
		remote: "Lūdzu, pārbaudiet šo lauku.",
		email: "Lūdzu, ievadiet derīgu e-pasta adresi.",
		url: "Lūdzu, ievadiet derīgu URL adresi.",
		date: "Lūdzu, ievadiet derīgu datumu.",
		dateISO: "Lūdzu, ievadiet derīgu datumu (ISO).",
		number: "Lūdzu, ievadiet derīgu numuru.",
		digits: "Lūdzu, ievadiet tikai ciparus.",
		creditcard: "Lūdzu, ievadiet derīgu kredītkartes numuru.",
		equalTo: "Lūdzu, ievadiet to pašu vēlreiz.",
		accept: "Lūdzu, ievadiet vērtību ar derīgu paplašinājumu.",
		maxlength: $.validator.format("Lūdzu, ievadiet ne vairāk kā {0} rakstzīmes."),
		minlength: $.validator.format("Lūdzu, ievadiet vismaz {0} rakstzīmes."),
		rangelength: $.validator.format("Lūdzu ievadiet {0} līdz {1} rakstzīmes."),
		range: $.validator.format("Lūdzu, ievadiet skaitli no {0} līdz {1}."),
		max: $.validator.format("Lūdzu, ievadiet skaitli, kurš ir mazāks vai vienāds ar {0}."),
		min: $.validator.format("Lūdzu, ievadiet skaitli, kurš ir lielāks vai vienāds ar {0}.")
	});
}(jQuery));