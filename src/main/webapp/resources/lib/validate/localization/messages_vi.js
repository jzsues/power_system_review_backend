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
 * Locale: VI (Vietnamese; Tiếng Việt)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Hãy nhập.",
		remote: "Hãy sửa cho đúng.",
		email: "Hãy nhập email.",
		url: "Hãy nhập URL.",
		date: "Hãy nhập ngày.",
		dateISO: "Hãy nhập ngày (ISO).",
		number: "Hãy nhập số.",
		digits: "Hãy nhập chữ số.",
		creditcard: "Hãy nhập số thẻ tín dụng.",
		equalTo: "Hãy nhập thêm lần nữa.",
		accept: "Phần mở rộng không đúng.",
		maxlength: $.format("Hãy nhập từ {0} kí tự trở xuống."),
		minlength: $.format("Hãy nhập từ {0} kí tự trở lên."),
		rangelength: $.format("Hãy nhập từ {0} đến {1} kí tự."),
		range: $.format("Hãy nhập từ {0} đến {1}."),
		max: $.format("Hãy nhập từ {0} trở xuống."),
		min: $.format("Hãy nhập từ {1} trở lên.")
	});
}(jQuery));