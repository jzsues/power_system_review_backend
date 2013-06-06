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
 * Language: SL (Slovenian; slovenski jezik)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "To polje je obvezno.",
		remote: "Prosimo popravite to polje.",
		email: "Prosimo vnesite veljaven email naslov.",
		url: "Prosimo vnesite veljaven URL naslov.",
		date: "Prosimo vnesite veljaven datum.",
		dateISO: "Prosimo vnesite veljaven ISO datum.",
		number: "Prosimo vnesite veljavno število.",
		digits: "Prosimo vnesite samo števila.",
		creditcard: "Prosimo vnesite veljavno številko kreditne kartice.",
		equalTo: "Prosimo ponovno vnesite vrednost.",
		accept: "Prosimo vnesite vrednost z veljavno končnico.",
		maxlength: $.validator.format("Prosimo vnesite največ {0} znakov."),
		minlength: $.validator.format("Prosimo vnesite najmanj {0} znakov."),
		rangelength: $.validator.format("Prosimo vnesite najmanj {0} in največ {1} znakov."),
		range: $.validator.format("Prosimo vnesite vrednost med {0} in {1}."),
		max: $.validator.format("Prosimo vnesite vrednost manjše ali enako {0}."),
		min: $.validator.format("Prosimo vnesite vrednost večje ali enako {0}.")
	});
}(jQuery));