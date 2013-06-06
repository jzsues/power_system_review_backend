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
 * Locale: MY (Malay; Melayu)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Medan ini diperlukan.",
		remote: "Sila betulkan medan ini.",
		email: "Sila masukkan alamat emel yang betul.",
		url: "Sila masukkan URL yang betul.",
		date: "Sila masukkan tarikh yang betul.",
		dateISO: "Sila masukkan tarikh(ISO) yang betul.",
		number: "Sila masukkan nombor yang betul.",
		digits: "Sila masukkan nilai digit sahaja.",
		creditcard: "Sila masukkan nombor kredit kad yang betul.",
		equalTo: "Sila masukkan nilai yang sama semula.",
		accept: "Sila masukkan nilai yang telah diterima.",
		maxlength: $.validator.format("Sila masukkan nilai tidak lebih dari {0} aksara."),
		minlength: $.validator.format("Sila masukkan nilai sekurang-kurangnya {0} aksara."),
		rangelength: $.validator.format("Sila masukkan panjang nilai antara {0} dan {1} aksara."),
		range: $.validator.format("Sila masukkan nilai antara {0} dan {1} aksara."),
		max: $.validator.format("Sila masukkan nilai yang kurang atau sama dengan {0}."),
		min: $.validator.format("Sila masukkan nilai yang lebih atau sama dengan {0}.")
	});
}(jQuery));