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
 * Locale: FA (Persian; فارسی)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "تکمیل این فیلد اجباری است.",
		remote: "لطفا این فیلد را تصحیح کنید.",
		email: ".لطفا یک ایمیل صحیح وارد کنید",
		url: "لطفا آدرس صحیح وارد کنید.",
		date: "لطفا یک تاریخ صحیح وارد کنید",
		dateISO: "لطفا تاریخ صحیح وارد کنید (ISO).",
		number: "لطفا عدد صحیح وارد کنید.",
		digits: "لطفا تنها رقم وارد کنید",
		creditcard: "لطفا کریدیت کارت صحیح وارد کنید.",
		equalTo: "لطفا مقدار برابری وارد کنید",
		accept: "لطفا مقداری وارد کنید که ",
		maxlength: $.validator.format("لطفا بیشتر از {0} حرف وارد نکنید."),
		minlength: $.validator.format("لطفا کمتر از {0} حرف وارد نکنید."),
		rangelength: $.validator.format("لطفا مقداری بین {0} تا {1} حرف وارد کنید."),
		range: $.validator.format("لطفا مقداری بین {0} تا {1} حرف وارد کنید."),
		max: $.validator.format("لطفا مقداری کمتر از {0} حرف وارد کنید."),
		min: $.validator.format("لطفا مقداری بیشتر از {0} حرف وارد کنید.")
	});
}(jQuery));