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
 * Locale: SI (Slovenian)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "To polje je obvezno.",
		remote: "Vpis v tem polju ni v pravi obliki.",
		email: "Prosimo, vnesite pravi email naslov.",
		url: "Prosimo, vnesite pravi URL.",
		date: "Prosimo, vnesite pravi datum.",
		dateISO: "Prosimo, vnesite pravi datum (ISO).",
		number: "Prosimo, vnesite pravo številko.",
		digits: "Prosimo, vnesite samo številke.",
		creditcard: "Prosimo, vnesite pravo številko kreditne kartice.",
		equalTo: "Prosimo, ponovno vnesite enako vsebino.",
		accept: "Prosimo, vnesite vsebino z pravo končnico.",
		maxlength: $.validator.format("Prosimo, da ne vnašate več kot {0} znakov."),
		minlength: $.validator.format("Prosimo, vnesite vsaj {0} znakov."),
		rangelength: $.validator.format("Prosimo, vnesite od {0} do {1} znakov."),
		range: $.validator.format("Prosimo, vnesite vrednost med {0} in {1}."),
		max: $.validator.format("Prosimo, vnesite vrednost manjšo ali enako {0}."),
		min: $.validator.format("Prosimo, vnesite vrednost večjo ali enako {0}.")
	});
}(jQuery));
