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
 * Locale: SR (Serbian; српски језик)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Поље је обавезно.",
		remote: "Средите ово поље.",
		email: "Унесите исправну и-мејл адресу",
		url: "Унесите исправан URL.",
		date: "Унесите исправан датум.",
		dateISO: "Унесите исправан датум (ISO).",
		number: "Унесите исправан број.",
		digits: "Унесите само цифе.",
		creditcard: "Унесите исправан број кредитне картице.",
		equalTo: "Унесите исту вредност поново.",
		accept: "Унесите вредност са одговарајућом екстензијом.",
		maxlength: $.validator.format("Унесите мање од {0}карактера."),
		minlength: $.validator.format("Унесите барем {0} карактера."),
		rangelength: $.validator.format("Унесите вредност дугачку између {0} и {1} карактера."),
		range: $.validator.format("Унесите вредност између {0} и {1}."),
		max: $.validator.format("Унесите вредност мању или једнаку {0}."),
		min: $.validator.format("Унесите вредност већу или једнаку {0}.")
	});
}(jQuery));